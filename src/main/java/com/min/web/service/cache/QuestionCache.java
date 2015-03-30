package com.min.web.service.cache;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import lombok.extern.log4j.Log4j;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.min.web.config.NamingConfig;
import com.min.web.domain.question.Answer;
import com.min.web.domain.question.Question;
import com.min.web.repository.question.AnswerRepository;
import com.min.web.repository.question.QuestionRepository;
import com.min.web.vo.question.AnswerVO;
import com.min.web.vo.question.QuestionVO;
import com.min.web.vo.question.ResponseQuestion;

@Component
@Log4j
public class QuestionCache {
	
	@Autowired
	private AnswerRepository answerRepository;
	
	@Autowired
	private QuestionRepository questionRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Cacheable(NamingConfig.QUESTION_CACHE_NAME)
	@Transactional(readOnly = true)
	public ResponseQuestion getQuestion(long num){
		log.info("Cached Question No : " + num);
		long questionCount = questionRepository.count();
		long randomQuestion = (int) (Math.random() * questionCount)+1;
		
		Question question = questionRepository.findOne(randomQuestion);
		
		long answerGroup = question.getAnswer().getAnswerGroup();
		
		List<Answer> answerList = answerRepository.findByAnswerGroup(answerGroup);
		
		List<AnswerVO> responseAnswer = new ArrayList<>();
		responseAnswer.add(modelMapper.map(question.getAnswer(), AnswerVO.class));
		for(int i = 1 ; i <= 4 ; i ++){
			int randomAnswer = (int) (Math.random() * answerList.size());
			AnswerVO ranAnswerVO = modelMapper.map(answerList.get(randomAnswer), AnswerVO.class);
			if(!responseAnswer.contains(ranAnswerVO)){
				responseAnswer.add(ranAnswerVO);
			}else{
				i--;
			}
		}
		Collections.shuffle(responseAnswer);
		return new ResponseQuestion(modelMapper.map(question, QuestionVO.class), responseAnswer);
	}
}
