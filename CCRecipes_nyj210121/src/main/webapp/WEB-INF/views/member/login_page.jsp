<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">


<style>

</style>
<title>Insert title here</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/navbarstyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/fontawesome-free-5.15.1-web/css/all.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">


</head>
<body class="ccrcontainer">

<div class="topbar">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp" />
</div>

<div class="mt-5" style="padding-top: 350px;">

		<div class="row">
			<div class="col"></div>



			<div class="col-4">
				<div class="row">
					<div class="col">
						<button type="button" class="btn btn-primary" onclick="login()"
							id="loginbutton">Login</button>
					</div>
					<div class="col">
						<button type="button" class="btn" onclick="signup()"
							id="signupbutton" style="float: right">Sign Up</button>
					</div>
				</div>
				<!-- 				loginform -->
				<form action="${pageContext.request.contextPath }/member/login_process.do"
					method="post" id="memberlogin">

					<div class="row mt-4">
						<div class="col">
							<div class="form-floating">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com" required name="member_email">
								<label for="floatingInput">이메일 주소</label>
							</div>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							<div class="form-floating">
								<input type="password" class="form-control"
									id="floatingPassword" placeholder="Password" required
									name="member_pw"> <label for="floatingPassword">비밀번호</label>
							</div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col d-grid gap-2">
							<input type="hidden" name="redirect_url" value="${referer }">
							<input class="btn btn-outline-success" type="submit"
								value="로그인">
						</div>
					</div>
				</form>
				<!-- 				signupform -->
				<form action="${pageContext.request.contextPath }/member/join_process.do"
					method="post" id="membersignup" style="display: none">
					<div class="row mt-4 mb-3">
						<div class="col input-group">
							<input type="text" class="form-control" placeholder="아이디"
								aria-label="Username" required name="member_email_id"> 
							<span class="input-group-text">@</span> 
							<input type="text" class="form-control" placeholder="이메일 " 
								aria-label="Server" required name="member_email_server"> 
<!-- 							<select -->
<!-- 								class="form-select" id="inputGroupSelect01"> -->
<!-- 								<option selected>Choose...</option> -->
<!-- 								<option value="1">gmail.com</option> -->
<!-- 								<option value="2">naver.com</option> -->
<!-- 								<option value="3">outlook.com</option> -->
<!-- 							</select> -->
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<input type="password" class="form-control"
								placeholder="비밀번호" required name="member_pw">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<input type="password" class="form-control"
								placeholder="비밀번호 확인" required>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<input type="text" class="form-control" placeholder="닉네임"
								required name="member_nickname">
						</div>
					</div>
					<div class="row mb-1">
						<div class="col form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault"> <label class="form-check-label"
								for="flexCheckDefault"> 개인정보 수집 및 이용동의 </label>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault"> <label class="form-check-label"
								for="flexCheckDefault"> 사이트 이용 약관 동의 </label>
						</div>
					</div>
				
					<div class="row mt-4 mb-3">
						<div class="col d-grid gap-2">
							<input type="hidden" name="redirect_url" value="${referer }">
							<input class="btn btn-outline-success" type="submit"
								value="회원가입">
						</div>
					</div>
				</form>
			</div>



			<div class="col"></div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		var loginform = document.getElementById("memberlogin");
		var signupform = document.getElementById("membersignup");
		var loginbutton = document.getElementById("loginbutton");
		var signupbutton = document.getElementById("signupbutton");

		function login() {
			loginform.style.display = "block";
			signupform.style.display = "none";
			if (loginbutton.classList.contains("btn-primary")) {
			} else {
				loginbutton.classList.toggle("btn-primary");
			}
			if (signupbutton.classList.contains("btn-primary")) {
				signupbutton.classList.toggle("btn-primary");
			}

		}

		function signup() {
			loginform.style.display = "none";
			signupform.style.display = "block";
			if (loginbutton.classList.contains("btn-primary")) {
				loginbutton.classList.toggle("btn-primary");
			}

			signupbutton.classList.toggle("btn-primary");
		}
	</script>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>







