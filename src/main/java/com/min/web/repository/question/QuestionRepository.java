package com.min.web.repository.question;

import org.springframework.data.repository.CrudRepository;

import com.min.web.domain.question.Question;

public interface QuestionRepository extends CrudRepository<Question, Long>{
	
}
