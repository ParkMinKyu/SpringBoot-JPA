package com.min.web.vo.article;

import java.util.List;

import lombok.Getter;

public class ArticleViewVO {
	
	@Getter
	private ArticleVO.ViewResponse articleResponse;
	@Getter
	private List<CommentVO.ViewResponse> commentsResponse;
	
	public ArticleViewVO(ArticleVO.ViewResponse articleResponse, List<CommentVO.ViewResponse> commentsResponse){
		this.articleResponse = articleResponse;
		this.commentsResponse = commentsResponse;
	}
}
