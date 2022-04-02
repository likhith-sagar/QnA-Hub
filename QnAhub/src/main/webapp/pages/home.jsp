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

<link href="rsc/css/style.css" rel="stylesheet">

<title>Home</title>
</head>
<body>

	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand">QnA-Hub</a>
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</nav>

	<div class="container">
		<div class="form-space">
			<form:form id="new-question" action="" method="post"
				modelAttribute="question">
				<div class="mb-3">
					<form:input type="text" class="form-control"
						style="font-size: 16px;" path="username" autocomplete="off"
						name="username" placeholder="username" />
				</div>
				<div class="mb-3">
					<form:textarea class="form-control" name="question" path="question"
						placeholder="Type your question here" style="font-size: 16px;"
						rows="3"></form:textarea>
				</div>
				<c:if test="${status == 1 }">
					<div class="status success">Successfully added question</div>
				</c:if>
				<c:if test="${status == -1 }">
					<div class="status fail">Error adding question</div>
				</c:if>
				<div class="col-auto" style="text-align: right;">
					<button type="submit" class="btn btn-primary mb-3">Post
						Question</button>
				</div>
			</form:form>
		</div>
		<div class="list-group">
			<c:forEach begin="0" items="${data }" step="1" var="item">
				<button type="button" class="list-group-item list-group-item-action"
					aria-current="true" onClick='action("${item.id}")'>
					<div class="question">
						<c:out value="${item.getQuestion() }"></c:out>
					</div>
					<div class="details">
						<div>
							By: <span class="username"><c:out
									value="${item.getUsername() }"></c:out></span>
						</div>
						<div>
							On: <span class="time"><c:out
									value="${item.getTimestring() }"></c:out></span>
						</div>
					</div>
				</button>
			</c:forEach>
		</div>
	</div>


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
	
	function action(id) {
		let url = "answers/?q="+id;
		console.log(url);
		window.location.href = url;
	}
</script>

</html>