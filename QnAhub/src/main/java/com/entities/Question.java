package com.entities;

import java.util.Date;

public class Question {
	String username;
	String question;
	long timestamp;
	String id;

	public Question(String id, String username, String question, long timestamp) {
		super();
		this.id = id;
		this.username = username;
		this.question = question;
		this.timestamp = timestamp;
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
	
	public long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

	public void setCurrentTimestamp() {
		this.timestamp = new Date().getTime();
	}

	public String getTimestring() {
		return new Date(this.timestamp).toString();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}
}
