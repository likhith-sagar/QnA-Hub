# QnA-Hub : A web application

This is a simple web application built using Spring MVC framework as part of OOAD course at PES University.

MVC (Model-View-Controller) is one of the most widely used software design pattern for app and web
development. The Model View Controller design pattern separates concerns into model, view, and
controller. The model contains data, view has the UI logic and controller has the backend code for
application logic.

Problem Formulation:

1. Create a web application to ask questions and post answers for the posted questions.

About project:

+ QnA-Hub is a simple web app built using Spring MVC Framework on Eclipse IDE.
+ Project is created using Maven with Archetype Web Application.
+ It runs on Tomcat Server at localhost (Tested on Tomcat v8.5 server).
+ Bootstrap is used for styling for views.
+ Functionalities: 
  - User can view all questions and post new questions on home page.
    - Questions must be unique.
  - User can navigate to answers page for a question by clicking on it.
  - User can view all answers and post new answers for a question on its answer page.
    - Answer titles must be unique.

MVC Implementation:

+ Models:
  - QuestionModel.java: stores and provides interface to access questions.
  - AnswerModel.java: stores and provides interface to access answers.
+ Views:
  - home.jsp: view to display and add questions.
  - answers.jsp: view to display and add answer for a particular question.
+ Controller:
  - MainController.java: controller to listen and serve for requests.

Entities: Question.java and Answer.java
