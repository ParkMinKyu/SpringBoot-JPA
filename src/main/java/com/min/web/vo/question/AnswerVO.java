package com.min.web.vo.question;


import lombok.Data;

@Data
public class AnswerVO{
	private long seq;
	private String content;
	private long answerGroup;
	private long typeSeq;
}
