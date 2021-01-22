<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CLear Cut Recipes</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/navbarstyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/fontawesome-free-5.15.1-web/css/all.css">
<!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">-->
<!-- nyj -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/article_layout/article_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/article_layout/article_read.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="ccrcontainer">
	<div class="topbar">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp" />
	</div>

<div id="article_wrapper">
	<div id="article_header">
		<div id="article_magazine"><h1>Magazine 매거진</h1></div>
		<div id="article_write">
			<c:if test="${!empty sessionUser }">
			<button type="button" class="btn_a write_a" Onclick="location.href='${pageContext.request.contextPath }/article/article_write.do'">글쓰기</button>
			</c:if>
		</div>
	</div>
	<div id="article_main">
		<div id="article_left"></div>
		<div id="article_center">
			
			<div id="article_content">
				<div id="article_head">
					<div id="article_title">${result.article.article_title }</div>
					<div id="article_date">
					<fmt:formatDate pattern="yyyy.MM.dd KK:mm" value="${result.article.article_date }" />
					</div>
					<div id="article_views">${result.article.article_views }</div>
				</div>
				
				<div id="article_body">
					<div class="read_icon-bar">
					  <a class="read_icon_active" href="${pageContext.request.contextPath }/article/article_favorited_process.do?article_no=${click.article.article_no}"><i class="fa fa-heart"></i></a>
					  <a href="#"><i class="fa fa-share"></i></a> 
					  <a href="#"><i class="fa fa-print"></i></a> 
					</div>
					<div id="article_text">${result.article.article_text}</div>
					<div id="article_imgupload">
					<c:forEach items="${result.imageList }" var="imageList">
						<img src="${imageList.articleimg_link }" style="max-width: 100%; height: auto;">
					</c:forEach>
					</div>
					<div id="buttons">
					<div id="button_list">
						<button type="button" class="btn_a write_a" onClick="location.href ='${pageContext.request.contextPath}/article/article_main.do'">목록</button>
					
						<c:if test="${!empty sessionUser && sessionUser.member_no == result.ccrMember.member_no }">
							<button type="button" class="btn_a write_a" onClick="location.href ='${pageContext.request.contextPath}/article/article_update.do?article_no=${result.article.article_no}'">수정</button>
							<button type="button" class="btn_a write_a" onClick="location.href ='${pageContext.request.contextPath}/article/article_delete_process.do?article_no=${result.article.article_no}'">삭제</button>
							
						</c:if>
					</div>
				</div>
				</div>
				
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
