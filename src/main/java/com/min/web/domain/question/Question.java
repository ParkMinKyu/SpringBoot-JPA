package com.min.web.domain.question;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity(name="question")
@Data
public class Question{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long seq;
	
	@Column(name="title", nullable=false)
	private String title;
	
	@Column(name="score", nullable=false)
	private long score;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="answer_seq")
	private Answer answer;
	
}
