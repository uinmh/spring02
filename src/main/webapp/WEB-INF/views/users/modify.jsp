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
		<h2>회원 정보 수정 페이지</h2>
		</header>
		<nav>
			<ul class="nav bg-light" >
				<li class="nav-item"><c:url var="main" value="/"></c:url>
				 <a class="nav-link active" href=${ main }>메인 페이지</a>
			    </li>
			    <li class="nav-item"><c:url var="list" value="/users/list"></c:url>
				 <a class="nav-link active" href=${ list }>유저 목록 페이지</a>
			    </li>
			    <li class="nav-item"><c:url var="detail" value="/users/detail">
			 	   <c:param name="id" value="${ user.id }" />
			    </c:url>
				 <a class="nav-link active" href=${ detail }>상세 페이지</a>
			    </li>
			</ul>
		</nav>
		<main>
			<!-- 페이지의 메인 content -->
			<div class="card">
				<div class="card-header"></div>
				<div class="card-body">
					<form id="formModify">
						<div>
							<label for="id" class="form-label">회원번호</label> <input id="id" name="id" type="text"
								value="${ user.id }" class="form-control" readonly />
						</div>
						<br />
						<div>
							<label for="username" class="form-label">아이디</label> <input id="username" type="text" name="username"
								value="${ user.username }" class="form-control" required />
						</div>
						<br />
						<div>
							<label for="password" class="form-label">비밀번호</label> <input id="password" type="password" name="password"
								value="${ user.password }" class="form-control" autofocus required />
						</div>
						<br />
						<div>
							<label for="email" class="form-label">이메일</label> <input id="email" type="email" name="email"
								value="${ user.email }" class="form-control" required/>
						</div>
						<br />
						<div class="my-2">
							<button id=btnDelete class="btn btn-danger">삭제</button>
							<button id=btnUpdate class="btn btn-success">수정</button>
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
		<c:url var="userDeletePage" value="/users/delete"></c:url>
		<c:url var="userUpdatePage" value="/users/modify"></c:url>

	<script>

	// id="postForm" 인 HTML 요소를 찾음.
	const form = document.querySelector('#formModify');
	
	// id="btnDelete" 인 버튼 찾음.
	const btnDelete = document.querySelector('#btnDelete');
	
	// 버튼 클릭 이벤트 리스너를 등록.
	btnDelete.addEventListener('click', function(event) {
		event.preventDefault(); 
		// 이벤트 기본 처리 방식을 막음.
		// -> 폼 양식이 서버로 제출(submit)되지 않도록 함.
		
	// 사용자에게 삭제 확인
	const check = confirm('정말 삭제 하시겠습니까?');
		
	if (check) { // 사용자"확인"을 선택했을 때
		
		form.action = '${ userDeletePage }'; // 제출 요청주소
		form.method = 'post'; 	// 제출방식
		form.submit();// 서버로 제출 (데이터 전송)
	}
	
});
	
	// id="btnDelete" 인 버튼 찾음.
	const btnUpdate = document.querySelector('#btnUpdate');
	
	// 버튼 클릭 이벤트 리스너를 등록.
	btnUpdate.addEventListener('click', function(event) {
		event.preventDefault(); 
		// 이벤트 기본 처리 방식을 막음.
		// -> 폼 양식이 서버로 제출(submit)되지 않도록 함.
	
	// <input> title에 연결 된 값 	
	const password = document.querySelector('#password').value;
	// <textArea> content에 연결 된 값.
	const email = document.querySelector('#email').value;
	
	if (password == '' || email == ''){
		
		alert ('비밀번호와 이메일을 입력해주세요.');
		return;// 이벤트 리스너 종료.
	}
	
	// 사용자에게 삭제 확인
	const check = confirm('정말 수정 하시겠습니까?');
	
		
	if (check) { // 사용자"확인"을 선택했을 때
		
		form.action = '${ userUpdatePage }'; // 제출 요청주소
		form.method = 'post'; 	// 제출방식
		form.submit();// 서버로 제출 (데이터 전송)
	}
});
	
	</script>
</body>
</html>