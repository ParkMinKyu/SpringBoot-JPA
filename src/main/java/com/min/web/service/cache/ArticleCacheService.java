package com.min.web.service.cache;


import java.lang.reflect.Type;

import lombok.extern.log4j.Log4j;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import com.min.web.domain.article.Article;
import com.min.web.repository.article.ArticleRepository;
import com.min.web.vo.article.ArticleVO;

@Component
@Log4j
public class ArticleCacheService {
	
	private static final int PAGE_COUNT = 15;
	private static final int PAGE_INDEX = 1;
	
	@Autowired
	private ArticleRepository articleRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Cacheable("articles")
	public Page<ArticleVO> findAll(int page){
		log.info("Cached Article Page No : " + page);
		PageRequest pageRequest = new PageRequest(page - PAGE_INDEX, PAGE_COUNT, Sort.Direction.DESC, "seq");
		Page<Article> articles = articleRepository.findAll(pageRequest);
		Type articleListType =  new TypeToken<Page<ArticleVO>>(){}.getType();
		return modelMapper.map(articles, articleListType);
	}
	
	@Cacheable("article")
	public ArticleVO findArticle(long seq){
		// TODO Auto-generated method stub
		log.info("Cached Article View No : " + seq);
		return modelMapper.map(articleRepository.findOne(seq), ArticleVO.class);
	}
}
