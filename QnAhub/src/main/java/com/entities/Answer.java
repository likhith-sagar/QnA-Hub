package com.entities;

import java.util.Date;

public class Answer {
	String title;
	String answer;
	String id;
	String questionId;
	public Answer(String title, String answer, String id, String questionId) {
		super();
		this.title = title;
		this.answer = answer;
		this.id = id;
		this.questionId = questionId;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setNewId() {
		this.id =  String.valueOf(new Date().getTime());
	}
	public Answer() {
		super();
		// TODO Auto-generated constructor stub
	}
}
