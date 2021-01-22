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
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/article_layout/article_list.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/article_layout/article_common.css">

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
		<div id="article_search">
		<form action="${pageContext.request.contextPath }/article/article_main.do" method="get">
			<div id="select_box">
			<select name="search_type">
				<option value="title">제목</option>
				<option value="text">내용</option>
				<option value="member">작성자</option>
			</select>
			</div>
			<div id="search_box">
				<input name="search_word" type="text">
			</div>
			<div id="search_button">
				<button>검색</button>
			</div>
		</form>
		</div>
	</div>
	<div id="article_main">
		<div id="article_left"></div>
		<div id="article_center">
			<c:forEach items="${resultList}" var="data">
			<div id="article_box">
				<div id="article_box2">
					<div id="article_title">
					<a href="${pageContext.request.contextPath }/article/article_read.do?article_no=${data.article.article_no}">${data.article.article_title }</a>
					</div>
					<div id="article_profile">
						<div id="article_nickname">
							${data.ccrMember.member_nickname }
						</div>
						<div id="article_date">
							<fmt:formatDate pattern="yyyy.MM.dd KK:mm" value="${data.article.article_date }" />
						</div>
						<div id="article_views">
							조회수 : ${data.article.article_views }
						</div>
					</div>
					<div id="article_preview">
						<a href="#">${data.article.article_text }</a>
					</div>
				</div>
				<div id="article_image">
					<img src="${data.articleImage.articleimg_link }">
				</div>
			</div>
			</c:forEach>
			<div class="article_pagination">
			<ul class="pagination_ul">
			  <li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a href="${pageContext.request.contextPath }/article/article_main.do?page_num=1">&lt;&lt;</a></li>
			  <li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a href="${pageContext.request.contextPath }/article/article_main.do?page_num=${beginPage-1}">&lt;</a></li>
			  <c:forEach begin="${beginPage }" end="${endPage }" var="i">
			  	<li class="page-item<c:if test="${i == currentPage }"> active</c:if>">
			 		 <a href="${pageContext.request.contextPath }/article/article_main.do?page_num=${i }">${i }</a></li>
			  </c:forEach>
			  <li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a href="${pageContext.request.contextPath }/article/article_main.do?page_num=${endPage+1}">&gt;</a></li>
			  <li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a href="${pageContext.request.contextPath }/article/article_main.do?page_num=${pageCount }">&gt;&gt;</a></li>
			</ul>
			</div>
		</div>
		<div id="article_right">인기 에디터</div>
	</div>
	<div id="article_footer">footer</div>
	
</div>

	
</body>
</html>
