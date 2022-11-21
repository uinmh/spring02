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
		<h2>계정 상세 페이지</h2>
		</header>
		<nav>
			<ul class="nav bg-light" >
				<li class="nav-item"><c:url var="list" value="/users/list"></c:url>
				 <a class="nav-link active" href=${ list }>유저 목록</a>
			    </li>
			    <li class="nav-item"><c:url var="modify" value="/users/modify">
			 	   <c:param name="id" value="${ user.id }" />
			    </c:url>
				 <a class="nav-link active" href=${ modify }>수정 페이지</a>
			    </li>
			</ul>
		</nav>
		
		<main> <!-- 페이지의 메인 content -->
				<!-- 페이지의 메인 content -->
			<div class="card">
				<div class="card-header"></div>
				<div class="card-body">
					<form>
						<div>
							<label for="id" class="form-label">회원 번호</label> <input id="id" type="text"
								value="${ user.id }" class="form-control" readonly />
						</div>
						<br />
						<div>
							<label for="username" class="form-label">아이디</label> <input id="username" type="text"
								value="${ user.username }" class="form-control" readonly />
						</div>
						<br />
						<div>
							<label for="password" class="form-label">비밀번호</label> <input id="password" type="password"
								value="${ user.password }" class="form-control" readonly />
						</div>
						<br />
						<div>
							<label for="email" class="form-label">이메일</label> <input id="email" type="email"
								value="${ user.email }" class="form-control" readonly />
						</div>
						<div>
							<label for="point" class="form-label">아이디</label> <input id="point" type="text"
								value="${ user.points }" class="form-control" readonly />
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