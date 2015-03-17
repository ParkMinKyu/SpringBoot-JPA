package com.min.web.vo.article;

import java.util.Date;
import java.util.List;

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
	
	@Size(min=2,max=20)
	private String userName;
	
	private long userLike;
	
	private Date regDate = new Date();
	
	@Data
	public static class ViewResponse{
		private long seq;
		
		@Size(min=10,max=300)
		private String title;
		
		@Size(min=10)
		private String content;

		private String userName;
		
		private long userLike;
		
		private Date regDate = new Date();
	}

	@Data
	public static class ListResponse{
		private long seq;
		
		@Size(min=10,max=300)
		private String title;
		
		private String userName;
		
		private long userLike;
		
		private Date regDate = new Date();
		
		private List<CommentVO.ListResponse> comments;
	}
}
