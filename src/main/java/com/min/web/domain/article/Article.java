package com.min.web.domain.article;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Entity(name="article")
@Data
public class Article {
	
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	private long seq;
	
	@Column(nullable=false)
	private String title;
	
	@Column(nullable=false,length=4000)
	private String content;

	@Column(nullable=false,length=100)
	private String userName;
	
	@Column(columnDefinition="bigint default '0'")
	private long userLike;
	
	@Temporal(TemporalType.DATE)
	private Date regDate = new Date();
}
