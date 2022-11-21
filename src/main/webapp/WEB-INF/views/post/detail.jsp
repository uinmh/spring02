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
</style>
</head>
<body>
	<div class="container-fluid">
		<header class="my-2 p-4 text-center text-bg-secondary">
		<h1>Spring MVC &amp; MyBatis</h1>
		<h2>상세 페이지</h2>
		</header>
		<nav>
			<ul class="nav bg-light" >
				<li class="nav-item"><c:url var="main" value="/"></c:url>
				 <a class="nav-link active" href=${ main }>메인 페이지</a>
			    </li>
			    <li class="nav-item"><c:url var="list" value="/post/list"></c:url>
				 <a class="nav-link active" href=${ list }>목록 페이지</a>
			    </li>
			    <li class="nav-item"><c:url var="modify" value="/post/modify">
			 	   <c:param name="id" value="${ post.id }" />
			    </c:url>
				 <a class="nav-link active" href=${ modify }>수정 페이지</a>
			    </li>
			</ul>
		</nav>
		<main>
			<!-- 페이지의 메인 content -->
			<div class="card">
				<div class="card-header"></div>
				<div class="card-body">
					<form>
						<div>
							<label for="id" class="form-label">글 번호</label> <input id="id" type="text"
								value="${ post.id }" class="form-control" readonly />
						</div>
						<br />
						<div>
							<label for="title" class="form-label">제목</label> <input id="title" type="text"
								value="${ post.title }" class="form-control" readonly />
						</div>
						<br />
						<div>
							<label for="content" class="form-label">내용</label>
							<textArea id="content" class="form-control" readonly>${post.content}</textArea>
						</div>
						<br />
						<div>
							<label for="author" class="form-label">작성자</label> <input id="author" type="text"
								value="${ post.author }" class="form-control" readonly />
						</div>
						<br />
						<div>
							<label for="createdTime" class="form-label">작성시간</label> <input id="createdTime"
								type="text" value="${post.created_time}" class="form-control" readonly />
						</div>
						<br />
						<div>
							<label for="modifiedTime" class="form-label">수정시간</label> <input id="modifiedTime"
								type="text" value="${post.modified_time}" class="form-control" readonly />
						</div>
					</form>
				</div>
			</div>
		</main>

	</div>
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