package com.min.web.rest;


import java.lang.reflect.Type;
import java.util.List;

import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.min.web.domain.article.Article;
import com.min.web.domain.article.Comment;
import com.min.web.repository.article.ArticleRepository;
import com.min.web.repository.article.CommentRepository;
import com.min.web.vo.article.ArticleListVO;
import com.min.web.vo.article.ArticleVO;
import com.min.web.vo.article.ArticleViewVO;
import com.min.web.vo.article.CommentVO;

@RestController
@RequestMapping("/taiji/article")
public class ArticleController {
	
	private static final int PAGE_COUNT = 15;
	private static final int PAGE_INDEX = 1;
	
	@Autowired
	private ArticleRepository articleRepository;

	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	@RequestMapping(value = "list/{page}", method = RequestMethod.GET)
	public ResponseEntity<?> list(@PathVariable("page")int page){
		PageRequest pageRequest = new PageRequest(page - PAGE_INDEX, PAGE_COUNT, Sort.Direction.DESC, "seq");
		Page<Article> articles = articleRepository.findAll(pageRequest);
		Type listArticle =  new TypeToken<List<ArticleVO.ListResponse>>(){}.getType();
		List<ArticleVO.ListResponse> articlesResponse = modelMapper.map(articles.getContent(), listArticle);
		return new ResponseEntity<>( new ArticleListVO(articlesResponse, articles.isFirst(), articles.isLast()), HttpStatus.OK);
	}

	@RequestMapping(value = "view/userLike/{seq}", method = RequestMethod.PUT)
	@Transactional
	public ResponseEntity<?> userLike(@PathVariable("seq")long seq){
		Article article = articleRepository.getOne(seq);
		article.setUserLike(article.getUserLike()+1);
		articleRepository.save(article);
		return new ResponseEntity<>( modelMapper.map(article, ArticleVO.ViewResponse.class), HttpStatus.OK);
	}

	@RequestMapping(value = "view/{seq}", method = RequestMethod.GET)
	public ResponseEntity<?> view(@PathVariable("seq")long seq){
		return new ResponseEntity<>(getArticleView(seq), HttpStatus.OK);
	}
	
	@RequestMapping(value="comment/save",method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
	@Transactional
	public ResponseEntity<?> commentSave(@RequestBody @Valid CommentVO commentVO, BindingResult result){
		if(result.hasErrors()) return new ResponseEntity<> (result.getAllErrors(), HttpStatus.BAD_REQUEST);
		Article article = articleRepository.findOne(commentVO.getArticleSeq());
		Comment comment = modelMapper.map(commentVO, Comment.class);
		comment.setArticle(article);
		commentRepository.save(comment);
		return new ResponseEntity<> ( modelMapper.map(commentVO, CommentVO.ViewResponse.class), HttpStatus.CREATED);
	}

	@Transactional(readOnly = true)
	private ArticleViewVO getArticleView(long seq){
		Article article = articleRepository.findOne(seq);
		ArticleVO.ViewResponse articleResponse = modelMapper.map(article, ArticleVO.ViewResponse.class);
		Type commentListType =  new TypeToken<List<CommentVO.ViewResponse>>(){}.getType();
		List<CommentVO.ViewResponse> commentsResponse = modelMapper.map(article.getComments(), commentListType);
		return new ArticleViewVO(articleResponse, commentsResponse);
	}
}
