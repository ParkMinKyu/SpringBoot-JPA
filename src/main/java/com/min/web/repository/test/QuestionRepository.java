package com.min.web.repository.test;

import org.springframework.data.repository.CrudRepository;

import com.min.web.domain.test.Question;

public interface QuestionRepository extends CrudRepository<Question, Long>{
	
}
