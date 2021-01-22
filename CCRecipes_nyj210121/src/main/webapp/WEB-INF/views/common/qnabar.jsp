<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-sm-2 me-5" style = "background-color: rgba(0,0,0, 0.4);">
	      <h3 class = "white_text">Clear-Cut Recipes</h3>
	      <p class = "white_text">게시판 바로가기</p>
	      <ul class="nav nav-pills flex-column">
	        <li class="nav-item">
	          <a class="nav-link" href="#">공지사항</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link active" href="${pageContext.request.contextPath }/qna/qna_board.do">Q&A 게시판</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">자유게시판</a>
	        </li>
	        
	      </ul>
	      <hr class="d-sm-none">
	    </div> 
</body>
</html>