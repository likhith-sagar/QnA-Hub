<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link href="<c:url value="/rsc/css/style.css"/>" rel="stylesheet">

<title>Answers</title>
</head>
<body>

	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href='<c:url value="/home"></c:url>'>QnA-Hub</a>
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</nav>

	<c:if test="${question != null }">
		<div class="container">

			<div class="question-box">
				<div class="question">
					<c:out value="${question.getQuestion() }"></c:out>
				</div>
				<div class="details">
					<div class="details">
						<div>
							By: <span class="username"><c:out
									value="${question.getUsername() }"></c:out></span>
						</div>
						<div>
							On: <span class="time"><c:out
									value="${question.getTimestring() }"></c:out></span>
						</div>
					</div>
				</div>
			</div>

			<c:if test="${ answers.size() == 0}">
				<br>
				<div class="error">No answers yet</div>
				<br>
			</c:if>
			<c:if test="${status == 1 }">
				<div class="status success">Successfully added answer</div>
			</c:if>
			<c:if test="${status == -1 }">
				<div class="status fail">Error adding answer</div>
			</c:if>
			<div class="answer-list">
				<ol class="list-group">
					<c:forEach begin="0" items="${answers }" step="1" var="item">
						<li
							class="list-group-item d-flex justify-content-between align-items-start">
							<div class="ms-2 me-auto">
								<div class="fw-bold answer-title">
									<c:out value="${item.getTitle() }"></c:out>
								</div>
								<span class="answer"> <c:out value="${item.getAnswer() }"></c:out>
								</span>
							</div>
						</li>
					</c:forEach>
				</ol>
			</div>
			<br> <br>
			<div class="form-space">
				<form:form id="new-answer" action="" method="post"
					modelAttribute="answer">
					<div class="mb-3">
						<input type="text" class="form-control" style="font-size: 16px;"
							path="title" autocomplete="off" name="title" placeholder="title">
					</div>
					<div class="mb-3">
						<textarea class="form-control" name="answer" path="answer"
							placeholder="Type your answer here" style="font-size: 16px;"
							rows="6"></textarea>
					</div>

					<div class="col-auto" style="text-align: right;">
						<button type="submit" class="btn btn-primary mb-3">Post
							Answer</button>
					</div>
				</form:form>
			</div>


		</div>
	</c:if>
	<c:if test="${question == null }">

		<div class="container">
			<div class="error">Question not found</div>
		</div>

	</c:if>




	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</body>

<script>
const statusEle = document.querySelector(".status");
if(statusEle){
	window.setTimeout(e=>{
		statusEle.remove();
	}, 4000);
}
</script>

</html>