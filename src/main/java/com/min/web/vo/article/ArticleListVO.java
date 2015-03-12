package com.min.web.vo.article;

import java.util.List;

import lombok.Getter;

public class ArticleListVO {
	
	@Getter
	private List<ArticleVO.ListResponse> articlesResponse;
	@Getter
	private boolean first;
	@Getter
	private boolean last;
	
	public ArticleListVO(List<ArticleVO.ListResponse> articlesResponse,boolean first, boolean last){
		this.articlesResponse = articlesResponse;
		this.first = first;
		this.last = last;
	}
}
