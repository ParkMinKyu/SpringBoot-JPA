package com.min.web.vo.article;

import java.util.List;

import lombok.Getter;

public class ArticleViewVO {
	
	@Getter
	private ArticleVO.ViewResponse articleResponse;
	@Getter
	private List<CommentVO.Response> commentsResponse;
	
	public ArticleViewVO(ArticleVO.ViewResponse articleResponse, List<CommentVO.Response> commentsResponse){
		this.articleResponse = articleResponse;
		this.commentsResponse = commentsResponse;
	}
}
