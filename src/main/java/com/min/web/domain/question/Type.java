package com.min.web.domain.question;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Data;

@Entity(name="type")
@Data
public class Type{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long seq;
	
	@Column(name="name", nullable=false)
	private String name;
	
	@OneToMany(mappedBy="type")
	private List<Answer> answers;
	
}
