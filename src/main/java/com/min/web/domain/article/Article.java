package com.min.web.domain.article;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;

@Entity(name="article")
@Data
public class Article {
	
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	private long seq;
	
	@Column(nullable=false)
	private String title;
	
	@Column(columnDefinition="varchar(20) default '1234'")
	private String password;
	
	@Column(nullable=false,length=4000)
	private String content;

	@Column(nullable=false,length=20)
	private String userName;
	
	@Column(columnDefinition="bigint default '0'")
	private long userLike;
	
	@Temporal(TemporalType.DATE)
	private Date regDate = new Date();
	
	@OneToMany(mappedBy="article",fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JsonBackReference
	private List<Comment> comments;

	public void addComment(Comment comment) {
		// TODO Auto-generated method stub
		comments.add(comment);
	}
}
