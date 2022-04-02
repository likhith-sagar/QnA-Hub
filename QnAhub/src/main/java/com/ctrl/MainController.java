package com.ctrl;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.entities.Answer;
import com.entities.Question;
import com.models.AnswerModel;
import com.models.QuestionModel;

@Controller
public class MainController {
	
	@RequestMapping("/home")
	public String home(Model m) {
		List<Question> data = QuestionModel.getAllQuestions(); 
		m.addAttribute("data", data);
		m.addAttribute("question", new Question());
		return "home";
	}
	
	@RequestMapping(value="/home", method=RequestMethod.POST)
	public String addQuestion(@ModelAttribute("question") Question question, Model m) {
		question.setCurrentTimestamp();
		question.setNewId();
		if(QuestionModel.addQuestion(question)) {
			m.addAttribute("status", 1);
			m.addAttribute("question", new Question());
			
		} else {
			m.addAttribute("status", -1);
		}
		List<Question> data = QuestionModel.getAllQuestions(); 
		m.addAttribute("data", data);
		return "home";
	}
	
	@RequestMapping("/answers")
	public String answers(@RequestParam String q, Model m) {
		Question question = QuestionModel.getQuestion(q);
		m.addAttribute("question", question);
		m.addAttribute("answer", new Answer());
		List<Answer> answers = AnswerModel.getAnswers(q);
		m.addAttribute("answers", answers);
		return "answers";
	}
	
	@RequestMapping(value="/answers", method=RequestMethod.POST)
	public String addAnswer(@RequestParam String q, @ModelAttribute("answer") Answer answer, Model m) {
		answer.setQuestionId(q);
		answer.setNewId();
		if(AnswerModel.addAnswer(answer)) {
			m.addAttribute("status", 1);
			m.addAttribute("answer", new Answer());
			
		} else {
			m.addAttribute("status", -1);
		}
		Question question = QuestionModel.getQuestion(q);
		m.addAttribute("question", question);
		List<Answer> answers = AnswerModel.getAnswers(q);
		m.addAttribute("answers", answers);
		return "answers";
	}

}
