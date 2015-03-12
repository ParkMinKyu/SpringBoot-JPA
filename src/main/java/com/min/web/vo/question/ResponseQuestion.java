package com.min.web.vo.question;

import java.util.List;

import lombok.Getter;

public class ResponseQuestion {
	@Getter
	private QuestionVO question;
	@Getter
	private List<AnswerVO> answers;
	
	public ResponseQuestion(QuestionVO question, List<AnswerVO> answers){
		this.question = question;
		this.answers = answers;
	}
	
}
