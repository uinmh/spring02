<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
	  rel="stylesheet" 
	  integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
	  crossorigin="anonymous">
<title>Spring 2</title>
<style>
	nav {
		text-align: center;
	}
	
	#no1 {
		background-color: lightgray;
	}
	#form {
		background-color: lightgray;
	}
</style>
</head>
<body>
	<div class="container-fluid">
		<header class="my-2 p-4 text-center text-bg-secondary">
		<h1>Spring MVC &amp; MyBatis</h1>
		<h2>새글 작성 페이지</h2>
		</header>
		<nav>
			<ul class="nav bg-light" >
				<li class="nav-item"><c:url var="main" value="/"></c:url>
				 <a class="nav-link active" href=${ main }>메인 페이지</a>
			    </li>
			    <li class="nav-item"><c:url var="list" value="/post/list"></c:url>
				 <a class="nav-link active" href=${ list }>목록 페이지</a>
			    </li>
			    <li class="nav-item"><c:url var="list" value="/post"></c:url>
				 <a class="nav-link disabled" href=${ list }>예비</a>
			    </li>
			</ul>
		</nav>

		<main>
			<!-- 페이지의 메인 content -->

			<div id="no1" class="card my-4">
				<form id="form" method="post">
					<!-- fom안에 작성하면 전달 가능. -->
					<div class="my-2">
						<label for="title" class="form-label">제목</label> <input type="text" id="title" class="form-control" name="title"
							required autofocus />
					</div>
					<br />
					<div class="my-2">
						<label for="content" class="form-label">내용</label>
						<textarea rows="10" cols="30" name="content" id="content"
s							class="form-control" required></textarea>
					</div>
					<br /> 
					<div class="my-2">
						<label for="author" class="form-label">작성자</label>
						<input type="text" name="author" id="author" class="form-control"required />
			
					</div>
					<br />
					<div class="my-2">
						<input type="submit" class="form-control" value="등록" />
						 <input type="button" class="form-control" value="취소" onclick="return()" />
					</div>
				</form>
			</div>
		</main>

	</div>
	
	<script>
	
	</script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
	</script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"
		integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
		crossorigin="anonymous">
	</script>
</body>
</html>