package com.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.entities.Answer;

public class AnswerModel {
	private static HashMap<String, List<String>> indices = new HashMap<String, List<String>>();
	private static HashMap<String, Answer> answers = new HashMap<String, Answer>();
	private static HashMap<String, HashMap<String, Boolean>> uniqueTitles = new HashMap<String, HashMap<String,Boolean>>();
	
	public static Boolean addAnswer(Answer answer) {
		if(answer.getQuestionId() == null) {
			return false;
		}
		if(answer.getTitle() == null || answer.getTitle() == "") {
			return false;
		}
		//can make other fields as mandatory too
		if(uniqueTitles.containsKey(answer.getQuestionId())) {
			HashMap<String, Boolean> titles = uniqueTitles.get(answer.getQuestionId());
			if(titles.containsKey(answer.getTitle())) {
				return false;
			}
			titles.put(answer.getTitle(), true);
			List<String> index = indices.get(answer.getQuestionId());
			index.add(answer.getId());
			answers.put(answer.getId(), answer);
			return true;
		} else {
			List<String> index = new ArrayList<String>();
			index.add(answer.getId());
			indices.put(answer.getQuestionId(), index);
			HashMap<String, Boolean> titles = new HashMap<String, Boolean>();
			titles.put(answer.getTitle(), true);
			uniqueTitles.put(answer.getQuestionId(), titles);
			answers.put(answer.getId(), answer);
			return true;
		}
	}
	
	public static List<Answer> getAnswers(String questionId) {
		List<Answer> answerList = new ArrayList<Answer>();
		if(indices.containsKey(questionId)) {
			List<String> index = indices.get(questionId);
			for(String ansId : index) {
				answerList.add(answers.get(ansId));
			}
		}
		return answerList;
	}
}
