package com.min.web.vo.article;

import java.util.Date;

import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class ArticleVO {
	
	private long seq;
	
	@Size(min=2,max=300)
	private String title;
	
	@Size(min=10)
	private String content;

	@Size(min=4,max=20)
	private String password;
	
	private String userName;
	
	private long like;
	
	private Date regDate = new Date();
	
	@Data
	public static class ViewResponse{
		private long seq;
		
		@Size(min=10,max=300)
		private String title;
		
		@Size(min=10)
		private String content;

		private String userName;
		
		private long like;
		
		private Date regDate = new Date();
	}

	@Data
	public static class ListResponse{
		private long seq;
		
		@Size(min=10,max=300)
		private String title;
		
		private String userName;
		
		private long like;
		
		private Date regDate = new Date();
	}
}
