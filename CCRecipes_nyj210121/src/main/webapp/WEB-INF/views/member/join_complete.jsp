<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		background-image: url("./image/background.png");
		background-position: center;
		background-size: cover;
		background-repeat: no-repeat;
	}
	
	.text_align_center {
		text-align : center; 
	}
	.text_non_deco {
		text-decoration : none;
	}
</style>
<link href="${pageContext.request.contextPath}/resources/others/other.css" rel="stylesheet">
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<body>

	<div class = "row" style = "height : 400px;"></div>
	<div class ="row">
		<div class = "col"></div>
		<div class = "col text_align_center">축하합니다! 회원가입이 완료 되었습니다.</div>
		<div class = "col"></div>
	</div>
	<div class = "row">
		<div class = "col text_align_center"><a class = "text_non_deco" href = "${pageContext.request.contextPath }/member/login_page.do">로그인 페이지로</a></div>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>