<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 수정</h1>
	<form action="${pageContext.request.contextPath}/bulletin/update_bulletin_process.do" method="post">
		작성자 : ${sessionUser.member_nickname }<br>
		제목 : <input type="text" name="bulletin_title" value="${result.CCRBulletin.bulletin_title }"><br>
		내용 : <br>
		<textarea name="bulletin_content" rows="10" cols="60">${result.CCRBulletin.bulletin_content }</textarea>
		<input type="hidden" name="bulletin_no" value="${result.CCRBulletin.bulletin_no }">
		<br>
		<input type="submit" value="수정">
	</form>

</body>
</html>









