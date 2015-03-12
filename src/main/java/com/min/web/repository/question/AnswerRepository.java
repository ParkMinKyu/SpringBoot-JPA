package com.min.web.repository.question;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.min.web.domain.question.Answer;

public interface AnswerRepository extends CrudRepository<Answer, Long>{
	List<Answer> findByTypeSeq(Long typeSeq);

	List<Answer> findByAnswerGroup(long answerGroup);
}
