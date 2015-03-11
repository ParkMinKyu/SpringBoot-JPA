package com.min.web.rest;


import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.min.web.service.cache.ArticleCacheService;
import com.min.web.vo.article.ArticleVO;

@RestController
@RequestMapping("/taiji/article")
public class ArticleController {
	
	@Autowired
	private ArticleCacheService articleCache;
	
	@Autowired
	private ModelMapper modelMapper;
	
	@RequestMapping(value = "list/{page}", method = RequestMethod.GET)
	@Transactional(readOnly = true)
	public ResponseEntity<?> list(@PathVariable("page")int page){
		return new ResponseEntity<>( articleCache.findAll(page), HttpStatus.OK);
	}

	@RequestMapping(value = "view/{seq}", method = RequestMethod.GET)
	@Transactional(readOnly = true)
	public ResponseEntity<?> view(@PathVariable("seq")int seq){
		return new ResponseEntity<>( modelMapper.map(articleCache.findArticle(seq), ArticleVO.class), HttpStatus.OK);
	}
	
}
