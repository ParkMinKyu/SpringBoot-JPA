package com.min.web.vo.imgarticle;

import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class ImgArticleVO {

	private long seq;
	
	@Size(min=4,max=100)
	private String title;
	
	@Size(min=4,max=200)
	private String comment;
	
	private String path;

	private long imgGroup;
	
	private String name;
	
	private String thumbName;
	
	private long userLike;
}
