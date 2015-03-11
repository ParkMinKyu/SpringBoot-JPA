package com.min.web.repository.test;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.min.web.domain.test.Type;

@Transactional
public interface TypeRepository extends CrudRepository<Type, Long>{
	
}
