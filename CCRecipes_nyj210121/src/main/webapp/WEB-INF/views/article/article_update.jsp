<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CLear Cut Recipes</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/navbarstyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/fontawesome-free-5.15.1-web/css/all.css">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"> -->
<!-- nyj -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/article_layout/article_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/article_layout/article_read.css">
</head>
<body class="ccrcontainer">
	<div class="topbar">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp" />
	</div>

<div id="article_wrapper">
	<div id="article_header">
		<div id="article_magazine">Magazine 매거진</div>
		
	</div>
	<div id="article_main">
		<div id="article_left"></div>
		<div id="article_center">
			<div id="article_content">
			<form action="${pageContext.request.contextPath}/article/article_update_process.do" method="post">
				<div id="article_head">
					<div id="article_title">
					<input type= "text" name="article_title" value="${result.article.article_title }">
					</div>
				</div>
				<div id="article_body">
					<div id="article_text"><textarea name="article_text" rows="10" cols="60">${result.article.article_text }</textarea></div>
					<div id="article_imgupload"><input name="files" type="file" accept="image/*"  multiple></div>
					<input type="hidden" name="article_no" value="${result.article.article_no }">
				</div>
				<div id="buttons">
					<div id="button_list">
						<button type="button" class="btn_a write_a" onClick="location.href ='${pageContext.request.contextPath}/article/article_main.do'">목록</button>
					
						<button class="btn_a write_a">수정</button>
					</div>
				</div>
				</form>
			</div>
		</div>
		<div id="article_right">
			<div id="article_pfbox">
				<div id="article_pfp">${result.ccrMember.member_pfp }</div>
				<div id="article_nickname">${result.ccrMember.member_nickname }</div>
				<div id="article_subscribe">
				<input type="button" value="구독" onClick="location.href ='#'">
				</div>
				<div id="article_pfbio">${result.ccrMember.member_bio }</div>
			</div>
		</div>
	</div>
	<div id="article_footer">footer</div>
	
</div>

	
</body>
</html>