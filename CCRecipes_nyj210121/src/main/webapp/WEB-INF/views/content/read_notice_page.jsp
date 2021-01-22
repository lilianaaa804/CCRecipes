<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>MyPage - My Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath }/resources/mypage.css" rel="stylesheet">
    <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/navbarstyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/fontawesome-free-5.15.1-web/css/all.css">
    
    <style>
        body {
            background-image: url("${pageContext.request.contextPath }/resources/image/background 2.jpeg");
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
        }

        ul.breadcrumb {
            margin-top: 3%;
            padding: 10px 16px;
            list-style: none;
            background-color: white;
            padding: 10px 16px;
        }

        ul.breadcrumb li {
            display: inline;
            font-size: 18px;
        }

        ul.breadcrumb li+li:before {
            padding: 8px;
            color: black;
            content: "/\00a0";
        }

        ul.breadcrumb li a {
            color: #0275d8;
            text-decoration: none;
        }

        ul.breadcrumb li a:hover {
            color: #01447e;
            text-decoration: underline;
        }
    </style>
</head>

<body class="ccrcontainer ">

<div class="topbar">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp" />
	</div>


    <div class="row">
        <div class="col">
            <img style="display: block; margin-left: auto; margin-right: auto; width: 10%; margin-top: 5px;"
                src="${pageContext.request.contextPath }/resources/image/ccrlogo2.png">
        </div>
    </div>
    <div class="row">
        <div class="col"></div>
        <div class="col-6"
            style="margin-top: 1%; border-radius: 5px; height: 5px; background: linear-gradient(to right, silver, gold);">
        </div>
        <div class="col"></div>
    </div>
    <div class="row">

        <div class="col-3"></div>

        <div class="col-6">
            <div class="row">
                <div class="col">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li>My Page</li>
                        <li>My Account</li>
                    </ul>
                </div>
            </div>
            
            
           <div class="row border border-dark">
           	<div class="col-2 badge bg-dark text-wrap">
           		제목
           		
           	</div>
           	<div class="col fs-5 bg-white text-wrap">${noticeResult.ccrNotice.notice_title }</div>
           </div>
           <div class="row mt-2 border border-dark">
           	<div class="col-2 badge bg-dark text-wrap">
           		작성자
           	</div>
           	<div class="col fs-5 bg-white text-wrap">${noticeResult.ccrMember.member_nickname }</div>
           </div>
           
           <div class="row border border-dark mt-2  bg-white text-wrap">
           	<div class="col-2 badge bg-dark text-wrap" style="display: block;">
           	작성일 
           		
           	</div>
           	<div class="col"><fmt:formatDate pattern="yyyy-MM-dd" value="${noticeResult.ccrNotice.notice_date }"/></div>
           	<div class="col-2 badge bg-dark text-wrap" style="display: block;">
           	조회수
           		
           	</div>
           	<div class="col">${noticeResult.ccrNotice.notice_readcount }</div>
           </div>
            
           <div class="row border border-dark mt-2">
           	<div class="col fs-5 bg-white text-wrap" style="height:200px">
           		
           		${noticeResult.ccrNotice.notice_text }
           	</div>
           	
           </div>
           <div class="row mt-2">
           	<div class="col">
           	<a href="${pageContext.request.contextPath }/content/notice_page.do"><button type="button" class="btn btn-outline-dark">목록으로</button></a></div>
           </div>
        </div>
        
    </div>
    
    
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>


</html>

<!-- 	<h1>공지사항 글보기</h1> -->
	
<%-- 	제목:${noticeResult.ccrNotice.notice_title }<br> --%>
<%-- 	작성자:${noticeResult.ccrMember.member_nickname }<br> --%>
<%-- 	조회수:${noticeResult.ccrNotice.notice_readcount }<br> --%>
<%-- 	작성일:${noticeResult.ccrNotice.notice_date }<br> --%>
<%-- 	내용:${noticeResult.ccrNotice.notice_text }<br> --%>
	
	