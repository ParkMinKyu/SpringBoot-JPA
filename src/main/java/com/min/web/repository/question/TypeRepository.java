package com.min.web.repository.question;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.min.web.domain.question.Type;

@Transactional
public interface TypeRepository extends CrudRepository<Type, Long>{
	
}
