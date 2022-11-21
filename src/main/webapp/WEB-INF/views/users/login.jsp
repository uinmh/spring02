<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring 02</title>
<style>
body {
  background:#2c2c2c;
  font-family:"Raleway";
}
.form {
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%,-50%);
  width:300px;
  height:250px;
  padding:10px;
}
.form .form-header {
  height:30px;
  display:flex;
  align-items:center;
  text-align:center;
}
.form .form-header > div {
  width:calc(100% / 3);
  color:#ddd;
  font-size:18px;
  font-weight:600;
  cursor:pointer;
}
.form.signup .form-header div.show-signup {
  color:#f1575b;
}
.form.signin .form-header div.show-signin {
  color:#f1575b;
}
.form.reset .form-header div.show-reset {
  color:#f1575b;
}
.form .form-elements {
  margin-top:15px;
}
.form .form-elements .form-element {
  height:50px;
  opacity:1;
  overflow:hidden;
  transition:all 500ms ease-in-out;
}
.form .form-elements input {
  width:100%;
  padding:10px;
  font-size:16px;
  margin:5px 0px;
  border-radius:10px;
  box-sizing:border-box;
  border:1px solid #222;
  background:#f5f5f5;
}
.form .form-elements button {
  width:100%;
  padding:10px;
  font-size:16px;
  font-weight:600;
  margin-top:5px;
  border-radius:10px;
  background:#f1575b;
  color:#f5f5f5;
  cursor:pointer;
  border:none;
  outline:none;
}
.form .arrow {
  position:absolute;
  top:51px;
  width:0;
  height:0;
  border-left:10px solid transparent;
  border-right:10px solid transparent;
  border-bottom:10px solid #f5f5f5;
}
.form.signup .arrow {
  left:calc(calc(100% / 3) / 2);
}
.form.signin .arrow {
  left:calc(calc(100% / 3) + calc(calc(100% / 3) / 2.2)) ;
}
.form.reset .arrow {
  left:calc(calc(calc(100% / 3) * 2) + calc(calc(100% / 3) / 3)) ;
}

.form.signin .form-elements > div:nth-child(3) {
  height:0px;
  opacity:0;
}
.form.reset .form-elements > div:nth-child(2),
.form.reset .form-elements > div:nth-child(3) {
  height:0px;
  opacity:0;
}
</style>
</head>
<body>
	<form id="join">
		<div class="form signup">
			<div class="form-header">
				<div class="show-signup">Sign Up</div>
				<div class="show-signin">Sign In</div>
				<div class="show-reset">Reset</div>
			</div>
			<div class="arrow"></div>
			<div class="form-elements">
				<div class="form-element">
					<input type="text" name="username" id="id" placeholder="id">
				</div>
				<div class="form-element">
					<input type="password" name="password" id="password" placeholder="password" autoComplete="off">
				</div>
				<div class="form-element">
					<input type="email" name="email" id="email" placeholder="email">
				</div>
				<div class="form-element">
					<button id="submit-btn">Sign Up</button>
				</div>
			</div>
		</div>
	</form>
	
	<c:url var="usersJoinPage" value="/users/join"></c:url>
	<c:url var="usersLoginPage" value="/users/login"></c:url>
<script>

	function resetClass(element, classname){
	  element.classList.remove(classname);
	}
	document.getElementsByClassName("show-signup")[0].addEventListener("click",function(){
	  let form = document.getElementsByClassName("form")[0];
	  resetClass(form, "signin");
	  resetClass(form, "reset");
	  form.classList.add("signup");
	  document.getElementById("submit-btn").innerText = "Sign Up"
 	});
	document.getElementsByClassName("show-signin")[0].addEventListener("click",function(){
	  let form = document.getElementsByClassName("form")[0];
	  resetClass(form, "signup");
	  resetClass(form, "reset");
	  form.classList.add("signin");
	  document.getElementById("submit-btn").innerText = "Sign In";
	});
	document.getElementsByClassName("show-reset")[0].addEventListener("click",function(){
	  let form = document.getElementsByClassName("form")[0];
	  resetClass(form, "signup");
	  resetClass(form, "signin");
	  form.classList.add("reset");
	  document.getElementById("submit-btn").innerText = "Reset password";
	});

	const form = document.querySelector('#join');
    const btnInsert = document.getElementById("submit-btn");
	 
    
    	btnInsert.addEventListener('click', function(event) {

    	if (btnInsert.innerText == "Sign Up") {
    		
    		event.preventDefault();
    		const id = document.querySelector('#id').value;
    		const password = document.querySelector('#password').value;
    		const email = document.getElementById('email').value;

    		if (id == '' || password == '' || email == '') {
    			alert("입력값이 없으면 안됩니다.");
    			return false;
    		} if (id.length < 5){
    			alert("아이디는 5글자 이상으로 입력해주세요.");
    			return false;
    		} else {
    			alert("환영합니다." + id + " 님!");
    			form.action = '${ usersJoinPage }';
    			form.method = 'post';
    			form.submit();
    		}
    	  }
    	if (btnInsert.innerText == "Sign In") {
    		
    		event.preventDefault();
    		const id = document.querySelector('#id').value;
    		const password = document.querySelector('#password').value;

    		if (id == '' || password == '') {
    			alert("입력값이 없으면 안됩니다.");
    			return false;
    		} if (id.length < 5){
    			alert("아이디는 5글자 이상으로 입력해주세요.");
    			return false;
    		} else {
    			alert("환영합니다." + id + " 님!");
    			form.action = '${ usersLoginPage }';
    			form.method = 'post';
    			form.submit();
    		}
    	}
    	
    	});

</script>
</body>
</html>