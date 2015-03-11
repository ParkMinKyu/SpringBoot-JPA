package com.min.web.repository.test;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.min.web.domain.test.Answer;

public interface AnswerRepository extends CrudRepository<Answer, Long>{
	List<Answer> findByTypeSeq(Long typeSeq);

	List<Answer> findByAnswerGroup(long answerGroup);
}
