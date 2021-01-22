<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/navbarstyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/fontawesome-free-5.15.1-web/css/all.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
</head>
<body class="ccrcontainer ">
	<div class="topbar">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp" />
	</div>

	<div class="container mt-5">


		<div class="row">
			<div class="col"></div>
			<div class="col fs-1 badge bg-dark text-wrap">공지사항</div>
			<div class="col"></div>
		</div>
		<div class="row mb-5"></div>
		
		<form action="${pageContext.request.contextPath}/content/notice_page.do" method="post">
		<div class="row mb-3">
			<div class="col-5 "></div>
			
			<div class="col-4 ">
				<input name="search_word" type="text" class="form-control border border-dark">
			</div>
			<div class="col-1  d-grid gap-2">
				<input type="submit" value="검색" class="btn btn-dark">
			</div>
		</div>
		</form>
		
		<div class="row mb-1">
			<div class="col-2"></div>
			<div class="col-8 ">

				<table class=" table table-light table-hover table-borderless">
					<thead class="table-dark">
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>조회수</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${noticeResultList }" var="data">
							<tr>
								<td>${data.ccrNotice.notice_no }</td>
								<td><a
									href="${pageContext.request.contextPath}/content/read_notice_page.do?notice_no=${data.ccrNotice.notice_no }">${data.ccrNotice.notice_title }</a></td>
								<td>${data.ccrNotice.notice_readcount }</td>
								<td>${data.ccrMember.member_nickname }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${data.ccrNotice.notice_date }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">

			<div class="col">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm mb-0 justify-content-center">
						<li class="page-item<c:if test="${currentPage==1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/content/notice_page.do?page_num=1">&lt;&lt;</a></li>
						<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/content/notice_page.do?page_num=${beginPage-1 }">&lt;</a></li>
						<c:forEach begin="${beginPage }" end="${endPage }" var="i">
						<li class="page-item<c:if test="${i==currentPage }">active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/content/notice_page.do?page_num=${i}">${i}</a></li>
						</c:forEach>
						<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/content/notice_page.do?page_num=${endPage+1 }">&gt;</a></li>
						<li class="page-item<c:if test="${currentPage == pageCount}"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/content/notice_page.do?page_num=${pageCount }">&gt;&gt;</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="row">7</div>


	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>