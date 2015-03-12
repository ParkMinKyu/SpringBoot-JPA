package com.min.web.domain.question;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.Data;

@Entity(name="answer")
@Data
public class Answer{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long seq;
	
	@Column(name="content", nullable=false)
	private String content;
	
	@Column(name="answer_group", nullable=false)
	private long answerGroup;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="type_seq")
	private Type type;
	
	@OneToMany(mappedBy="answer")
	private List<Question> questions;

}
