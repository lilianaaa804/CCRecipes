<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CLear Cut Recipes</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/navbarstyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/fontawesome-free-5.15.1-web/css/all.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">


<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

.underline-on-hover:hover {
	text-decoration: underline;
}

.qnacontainer {
	margin-top: 50px;
	margin-left: 50px;
}

.margin_b {
	margin-bottom: 5px;
	margin-top: 10px;
}

.pageBar {
	margin-top: 50px;
}
</style>

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<body class="ccrcontainer">
	<div class="topbar">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp" />
	</div>

	<div class="qnacontainer">
		<div class="row">


			<div class="col-sm-2 me-5">
				<div class="row">
					<div class="col"
						style="background-color: rgba(0, 0, 0, 0.4); height: 900px;">
						<h3 style="color: white;">Clear-Cut Recipes</h3>

						<p class="white_text margin_b">회원 관리</p>
						<ul class="nav nav-pills flex-column">
							<li class="nav-item"><a
								class="nav-link active underline-on-hover"
								href="${pageContext.request.contextPath }/manager/member/member_list.do">회원리스트</a>
							</li>
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pageContext.request.contextPath }/manager/member/withdrawn_member_list.do">탈퇴회원리스트</a>
							</li>
						</ul>

						<p class="white_text margin_b">게시글 관리</p>
						<ul class="nav nav-pills flex-column">
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pageContext.request.contextPath }/manager/board/notice_list.do">공지사항</a>
							</li>
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pageContext.request.contextPath }/manager/board/qna_list.do">Q&A
									게시판</a></li>
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pageContext.request.contextPath }/manager/board/free_board.do">자유게시판</a>
							</li>
						</ul>

						<hr class="d-sm-none">


						<p class="white_text margin_b">클래스 관리</p>
						<ul class="nav nav-pills flex-column">
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pageContext.request.contextPath }/manager/class/class_list.do">클래스
									리스트</a></li>
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pateContext.request.contextPath}/manager/class/teacher_list.do">선생님
									목록</a></li>
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pateContext.request.contextPath}/manager/class/class_member_list.do">수강회원
									목록</a></li>
						</ul>

						<p class="white_text margin_b">매거진 관리</p>
						<ul class="nav nav-pills flex-column">
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pageContext.request.contextPath }/manager/megazine/megazine_list.do">매거진
									리스트</a></li>
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pateContext.request.contextPath}/manager/megazine/editor_list.do">에디터
									목록</a></li>
						</ul>

						<p class="white_text margin_b">서비스 관리</p>
						<ul class="nav nav-pills flex-column">
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pageContext.request.contextPath }/manager/service/coin_order.do">코인
									구매내역</a></li>
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pageContext.request.contextPath }/manager/service/report_list.do">신고
									접수</a></li>
						</ul>

						<p class="white_text margin_b">통계</p>
						<ul class="nav nav-pills flex-column">
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pageContext.request.contextPath }/manager/statistic/member_join.do">회원
									가입 통계</a></li>
							<li class="nav-item"><a class="nav-link underline-on-hover"
								href="${pageContext.request.contextPath }/manager/statistic/views.do">조회수
									통계</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-sm-8">
				<p style="margin-bottom: 5px;">회원관리</p>
				<h2>회원리스트</h2>

				<c:choose>
					<c:when test="${!empty sessionUser }">
						<div class="text_align_right">
							<a
								href="${pageContext.request.contextPath }/qna/qna_writing_page.do">글쓰기</a>
						</div>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>

				<hr>

				<form
					action="${pageContext.request.contextPath }/manager/member/member_serach.do"
					method="post">
					<div class="row mb-3">

						<div class="col-2">
							<select name="member_search" class="form-select">
								<option value="search_email_member" selected>이메일</option>
								<option value="search_nickname_member">닉네임</option>
								<option value="search_rank_member">등급</option>
							</select>
						</div>
						<div class="col-8	">
							<input class="form-control" name="search_word" type="text"
								placeholder="검색어를 입력해주세요.">
						</div>
						<div class="col-2">
							<input class="btn btn-primary" type="submit" value="검색">
						</div>

					</div>
				</form>

				<div class="row mb-2">
					<div class="col">
						<div class="row">
							<div class="col">
								<div class="row  mb-2">
									<div class="col-1 text_center_align">번호</div>
									<div class="col-3 text_center_align">이메일</div>
									<div class="col-2 text_center_align">닉네임</div>
									<div class="col-1 text_center_align">등급</div>
									<div class="col-1 text_center_align">코인</div>
									<div class="col text_center_align">가입일</div>
									<div class="col text_center_align">관리</div>
								</div>


								<c:forEach items="${memberList}" var="data">
									<form
										action="${pageContext.request.contextPath }/member/update_member_process.do?member_no=${data.ccrMemberVo.member_no}"
										method="post">
										<div class="row mb-2">
											<div class="col-1 text_center_align"><a href="${pageContext.request.contextPath }/member/user.do?member_no=${data.ccrMemberVo.member_no}">${data.ccrMemberVo.member_no}</a></div>
											<div class="col-3 underline-on-hover">${data.ccrMemberVo.member_email}</div>
											<div class="col-2 text_center_align">
												<input name="member_nickname" class="form-control"
													style="width: 150px;" type="text"
													value="${data.ccrMemberVo.member_nickname}">
											</div>
											<div class="col-1 text_center_align">
												<input name="member_rank" class="form-control"
													style="width: 55px;" type="text"
													value="${data.ccrMemberVo.member_rank}">
											</div>
											<div class="col-1 text_center_align">
												<input name="member_coin" class="form-control"
													style="width: 55px;" type="text"
													value="${data.ccrMemberVo.member_coin}">
											</div>
											<div class="col text_center_align">${data.ccrMemberVo.member_joindate}</div>
											<div class="col text_center_align">
												<div class="row">
													<div class="col">
														<button>수정</button>
													</div>
													<div class="col">
														<a
															href="${pageContext.request.contextPath }/member/delete_member.do?member_no=${data.ccrMemberVo.member_no}"><button
																type="button">삭제</button></a>
													</div>

												</div>
											</div>
										</div>
									</form>



								</c:forEach>


								<div class="row pageBar">
									<div class="col" style="text-align: ceneter;">

										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item disabled"><a class="page-link"
													href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">Next</a>
												</li>
											</ul>
										</nav>

									</div>
								</div>

							</div>
						</div>

					</div>

				</div>


			</div>
		</div>
	</div>

</body>
</html>
