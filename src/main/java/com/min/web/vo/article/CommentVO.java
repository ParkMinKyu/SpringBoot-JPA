package com.min.web.vo.article;

import java.util.Date;

import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class CommentVO {
	
	private long seq;
	
	@Size(min=4,max=20)
	private String password;

	@Size(min=2,max=2000)
	private String content;

	@Size(min=2,max=20)
	private String userName;
	
	private long userLike;
	
	private long articleSeq;
	
	private Date regDate = new Date();
	
	@Data
	public static class ViewResponse{
		private long seq;
		
		@Size(min=6,max=2000)
		private String content;

		@Size(min=2,max=20)
		private String userName;
		
		private long userLike;
		
		private long articleSeq;
		
		private Date regDate = new Date();
	}

	@Data
	public static class ListResponse{
		private long seq;
	}
}
