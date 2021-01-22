<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            
            <form action="${pageContext.request.contextPath}/content/write_notice_process.do" method="post">
           <div class="row">
           	<div class="col">
           		<h1 style="display: block;">제목</h1>
           		<input type="text" name="notice_title">
           	</div>
           	
           </div>
           <div class="row">
           	<div class="col" style="display: block;">
           		작성자:${sessionUser.member_nickname }
           		
           	</div>
           </div>
           <div class="row">
           	<div class="col">
           		<h1 style="display: block;">내용</h1>
           		<textarea rows="10" cols="60" name="notice_text"></textarea>
           	</div>
           </div>
           <div class="row">
           	<div class="col">
           		<input type="submit" value="글쓰기"> 
           	</div>
           </div>
        </form>  
        </div>
        
    </div>
    
    
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>


</html>

<!-- 	공지사항 글쓰기 -->
<%-- 	<form action="${pageContext.request.contextPath}/content/write_notice_process.do" method="post"> --%>
<%-- 		작성자:${sessionUser.member_nickname }<br> --%>
<!-- 		제목:<input type="text" name="notice_title"><br> -->
<!-- 		내용: -->
<!-- 		<textarea rows="10" cols="60" name="notice_text"></textarea><br> -->
<!-- 		<input type="submit" value="글쓰기"> -->
<!-- 	</form> -->
	