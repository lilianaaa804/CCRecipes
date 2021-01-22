<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">


<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/others/other.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<div class = "row">
			
		</div> 	
		<div class="row mt-3">
			<div class="col"></div>
			<div class="col-4">
				
				<div class = "row mt-5">
					<div class = "col text_align_center" style = "width : 200px; height : 350px;"></div>
				</div>
				<div class = "row" style = "text-align : center;">
					<div id="loginbtn" class = "col btn btn-outline-warning"><a class = "text_non_deco text_color" href = "${pageContext.request.contextPath }/member/login_page.do">Login</a></div> 
					<div id="joinbtn" class = "col btn btn-warning"><a class = "text_non_deco text_color" href="${pageContext.request.contextPath }/member/join_page.do">Join</a></div>
				</div>
				
				<div class = "row mt-3">
					<div class = "col"></div>
				</div>
			
				<div class = "row">
					<div class = "col">
					<form action="${pageContext.request.contextPath }/member/join_process.do" method="post">
					  <div class="mb-2">
					    <input name="member_email" type="email" placeholder="아이디를 입력해주세요." class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					    <div id="emailHelp" class="form-text">이메일 형식으로 입력해주세요.</div>
					  </div>
					  <div class="mb-2">
					    <input name="member_pw" type="password" placeholder="비밀번호를 입력해주세요." class="form-control" id="exampleInputPassword1">
					  </div>
					  <div class="mb-2">
					    <input name="member_nickname"type="text" class="form-control"  placeholder="닉네임을 입력해주세요." id="exampleInputNickname1">
					  </div>
					  <div class = "row">
					  	<div class = "col d-grid gap-2" style = "text-align : left">
					  		<button type="submit" class="btn btn-warning mt-3">회원가입</button>
					  	</div>
					  </div>
					</form>
				</div>
				</div>
			
			
			
			</div>
			<div class="col"></div>
		</div>	
	</div>
	<script type="text/javascript">
		/* var loginbutton = document.selectById("loginbtn");
		var joinbutton = document.selectById("joinbtn");
		
		function login(){
			loginbutton.classList.toggle("btn-outline-success");
			loginbutton.classList.toggle("btn-success");
		} */
	</script>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>







