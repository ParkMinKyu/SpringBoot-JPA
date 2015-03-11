package com.min.web.vo.article;

import java.util.Date;

import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class ArticleVO {
	
	private long seq;
	
	@Size(min=10,max=300)
	private String title;
	
	@Size(min=10)
	private String content;
	
	private long like;
	
	private Date regDate = new Date();
}
