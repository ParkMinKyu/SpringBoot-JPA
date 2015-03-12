package com.min.web.vo.question;

import lombok.Data;

@Data
public class QuestionVO{
	private long seq;
	private String title;
	private long score;
	private long answerSeq;
}
