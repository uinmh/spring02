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
		<h2>수정 페이지</h2>
		</header>
		<nav>
			<ul class="nav bg-light" >
				<li class="nav-item"><c:url var="main" value="/"></c:url>
				 <a class="nav-link active" href=${ main }>메인 페이지</a>
			    </li>
			    <li class="nav-item"><c:url var="list" value="/post/list"></c:url>
				 <a class="nav-link active" href=${ list }>목록 페이지</a>
			    </li>
			    <li class="nav-item"><c:url var="detail" value="/post/detail">
			 	   <c:param name="id" value="${ post.id }" />
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
							<label for="id" class="form-label">글 번호</label> <input id="id" name="id" type="text"
								value="${ post.id }" class="form-control" readonly />
						</div>
						<br />
						<div>
							<label for="title" class="form-label">제목</label> <input id="title" type="text" name="title"
								value="${ post.title }" class="form-control" required autofocus />
						</div>
						<br />
						<div>
							<label for="content" class="form-label">내용</label>
							<textArea id="content" class="form-control" name="content" >${post.content}</textArea>
						</div>
						<br />
						<div>
							<label for="author" class="form-label">작성자</label> <input id="author" type="text"
								value="${ post.author }" class="form-control" readonly/>
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
		<c:url var="postDeletePage" value="/post/delete"></c:url>
		<c:url var="postUpdatePage" value="/post/modify"></c:url>

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
		
		form.action = '${ postDeletePage }'; // 제출 요청주소
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
	const title = document.querySelector('#title').value;
	// <textArea> content에 연결 된 값.
	const content = document.querySelector('#content').value;
	
	if (title == '' || content == ''){
		
		alert ('제목과 내용은 반드시 입력 되어야 합니다.');
		return;// 이벤트 리스너 종료.
	}
	
	// 사용자에게 삭제 확인
	const check = confirm('정말 수정 하시겠습니까?');
	
		
	if (check) { // 사용자"확인"을 선택했을 때
		
		form.action = '${ postUpdatePage }'; // 제출 요청주소
		form.method = 'post'; 	// 제출방식
		form.submit();// 서버로 제출 (데이터 전송)
	}
});
	
	</script>
</body>
</html>