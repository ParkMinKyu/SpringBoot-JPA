package com.min.web.domain.article;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Entity(name="comment")
@Data
public class Comment {
	
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	private long seq;
	
	@Column(nullable=false,length=20)
	private String password;

	@Column(nullable=false,length=2000)
	private String content;

	@Column(nullable=false,length=20)
	private String userName;
	
	@Column(columnDefinition="bigint default '0'")
	private long userLike;
	
	@Temporal(TemporalType.DATE)
	private Date regDate = new Date();
	
	@ManyToOne(fetch = FetchType.LAZY,cascade = CascadeType.PERSIST)
	@JoinColumn(name="article_seq")
	private Article article;
	
}
