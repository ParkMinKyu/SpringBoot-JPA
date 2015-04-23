package com.min.web.domain.imgarticle;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity(name="imgarticle")
@Data
public class ImgArticle {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private long seq;
	
	@Column(nullable=false,length=100)
	private String title;
	
	@Column(nullable=false,length=200)
	private String comment;
	
	@Column(nullable=false,length=100)
	private String path;

	@Column(columnDefinition="bigint default '0'")
	private long imgGroup;
	
	@Column(nullable=false,length=100)
	private String name;
	
	@Column(nullable=false,length=100)
	private String thumbName;
	
	@Column(columnDefinition="bigint default '0'")
	private long userLike;
	
	@Column(columnDefinition="bigint default '0'")
	private long blindImg;
}
