package com.min.web.rest;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.min.web.domain.test.Answer;
import com.min.web.domain.test.Question;
import com.min.web.handler.exception.support.DomainNullPointSupport;
import com.min.web.repository.test.AnswerRepository;
import com.min.web.repository.test.QuestionRepository;
import com.min.web.vo.test.AnswerVO;
import com.min.web.vo.test.QuestionVO;
import com.min.web.vo.test.ResponseQuestion;


@RestController
@RequestMapping("/taiji/question")
public class TestController {
	
	@Autowired
	private AnswerRepository answerRepository;
	
	@Autowired
	private QuestionRepository questionRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	@RequestMapping(value = "{num}", method = RequestMethod.GET)
	public ResponseEntity<?> greeting(@PathVariable(value="num")long num,HttpServletRequest req){
		HttpSession session = req.getSession();
		ResponseQuestion responseQuestion = (ResponseQuestion) session.getAttribute("question"+num);
		if(responseQuestion == null){
			long questionCount = questionRepository.count();
			long randomQuestion = (int) (Math.random() * questionCount)+1;
			
			Question question = questionRepository.findOne(randomQuestion);
			if(question == null) throw new DomainNullPointSupport(num,"Question");
			
			long answerGroup = question.getAnswer().getAnswerGroup();
			
			List<Answer> answerList = answerRepository.findByAnswerGroup(answerGroup);
			if(answerList.isEmpty()) throw new DomainNullPointSupport(answerGroup,"AnswerGroup");
			
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
			/*java.lang.reflect.Type listType = new TypeToken<List<AnswerVO>>(){}.getType();*/
			responseQuestion = new ResponseQuestion(modelMapper.map(question, QuestionVO.class), responseAnswer);
			session.setAttribute("question"+num, responseQuestion);
		}
		
		return new ResponseEntity<>(responseQuestion,HttpStatus.OK);
	}
	
}
