package com.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.entities.Question;

public class QuestionModel {
	private static List<String> index = new ArrayList<String>();
	private	static HashMap<String, Question> questions = new HashMap<String, Question>();
	private static HashMap<String, Boolean> uniqueQuestions = new HashMap<String, Boolean>();
	
	public static boolean addQuestion(Question q) {
		if(q.getQuestion() == null || q.getQuestion() == "") {
			return false;
		}
		if(questions.containsKey(q.getId())) {
			return false;
		}
		if(uniqueQuestions.containsKey(q.getQuestion())) {
			return false;
		}
		index.add(q.getId());
		questions.put(q.getId(), q);
		uniqueQuestions.put(q.getQuestion(), true);
		return true;
	}
	
	public static List<Question> getAllQuestions(){
		List<Question> allQuestions = new ArrayList<Question>();
		for(String id: index) {
			allQuestions.add(questions.get(id));
		}
		return allQuestions;
	}
	
	public static Question getQuestion(String id) {
		if(questions.containsKey(id)) {
			return questions.get(id);
		}
		return null;
	}
}
