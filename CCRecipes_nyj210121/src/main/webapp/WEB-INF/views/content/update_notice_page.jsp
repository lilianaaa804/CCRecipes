<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	공지사항 글수정
	<form action="${pageContext.request.contextPath}/content/update_notice_process.do" method="post">
		작성자:${noticeResult.ccrMember.member_nickname }<br>
		제목:<input type="text" name="notice_title" value="${noticeResult.ccrNotice.notice_title }"><br>
		내용:
		<textarea rows="10" cols="60" name="notice_text">${noticeResult.ccrNotice.notice_text }</textarea><br>
		<input type="hidden" name="notice_no" value="${noticeResult.ccrNotice.notice_no }">
		<input type="submit" value="글수정">
	</form>

</body>
</html>