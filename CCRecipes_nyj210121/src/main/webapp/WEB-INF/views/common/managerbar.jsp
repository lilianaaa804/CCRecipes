<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.underline-on-hover:hover {
	    text-decoration: underline;
	}
</style>
</head>
<body>
	<div class="col-sm-2 me-5" >
		<div class = "row">
			<div class = "col" style = "background-color: rgba(0,0,0, 0.4);">
                        <h3 style = "color : white; ">Clear-Cut Recipes</h3>
                        
                        <p class = "white_text margin_b">회원 관리</p>
                          <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                            <a class="nav-link active underline-on-hover" href="#">회원리스트</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="">탈퇴회원리스트</a>
                            </li>
                        </ul>
                        
                        <p class = "white_text margin_b">게시글 관리</p>
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="#">공지사항</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/qna/qna_board.do">Q&A 게시판</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="#">자유게시판</a>
                            </li>
                        </ul>
                        
                        <hr class="d-sm-none">
                        
                        
                         <p class = "white_text margin_b">클래스 관리</p>
                          <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="#">클래스 리스트</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="#">자유게시판</a>
                            </li>
                        </ul>
                        
                         <p class = "white_text margin_b">서비스 관리</p>
                          <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="#">코인 구매내역</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="#">신고 접수</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="#">자유게시판</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div> 
</body>
</html>