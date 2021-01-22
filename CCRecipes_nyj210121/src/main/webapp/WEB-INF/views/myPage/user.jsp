<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${viewingUser.member_nickname }</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link
	href="${pageContext.request.contextPath }/resources/css/mypage.css"
	rel="stylesheet">
</head>
<body>
	<div>
		<div class="row">
			<div class="col">
				<img
					style="display: block; margin-left: auto; margin-right: auto; width: 10%;"
					src="C:\Users\Jay K\Desktop\KakaoTalk_20210114_113725936.png">
			</div>
		</div>
		<div class="row">
			<div class="col"></div>
			<div class="col-6"
				style="margin-top: 1%; border-radius: 5px; height: 5px; background: linear-gradient(to right, silver, gold);"></div>
			<div class="col"></div>
		</div>
		<div class="row">

			<div class="col-3"></div>

			<div class="col-6">
				<div class="row mt-50">
					<div class="col">
						<ul class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li>My Page</li>
							<li>My Account</li>
						</ul>
					</div>
				</div>
				<div style="background-color: white; border-radius: 5px;">
					<div class="row mt-10">
						<div class="col" style="margin-top: 30px;">
							<img src="" alt=""
								style="width: 150px; height: 150px; border-radius: 50px; margin-left: 50%;">
						</div>
					</div>
					<div class="row" style="margin-top: 15px;">
						<div class="col-3"></div>
						<div class="col-8">
							<div class="progress">
								<div class="progress-bar" role="progressbar" style="width: 75%"
									aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<div class="col-1"></div>
					</div>
					<div class="row" style="margin-top: 30px;">
						<div class="col-3">
							<ul class="list-group list-group-flush"
								style="margin-left: 10px;">
								<li class="list-group-item" style="border-bottom-width: 1px;">Name</li>
							</ul>
						</div>
						<div class="col-8">
							<input type="text" placeholder="${viewingUser.member_nickname }"
								style="width: 100%; height: 40px; margin-top: 5px;">
						</div>
					</div>
					<div class="row" style="margin-top: 30px;">
						<div class="col-3">
							<ul class="list-group list-group-flush"
								style="margin-left: 10px;">
								<li class="list-group-item" style="border-bottom-width: 1px;">Bio</li>
							</ul>
						</div>
						<div class="col-8">
							<input type="text" placeholder="${viewingUser.member_bio }"
								style="width: 100%; height: 120px;">
						</div>
					</div>
					<div class="row">
						<c:choose>
							<c:when test="${friendStatus == null}">
								<div class="col" style="margin: 50px 0px 20px 0px;">
									<a
										href="${pageContext.request.contextPath }/sendFriendRequest.do?member_no=${viewingUser.member_no }&redirect_url=${referer }">
										<button type="button" class="btn btn-success"
											style="margin-left: 50%;">Send Friend Request</button>
									</a>
								</div>
								<!-- 								add when you wanna block someone who hasnt sent you a request or whatever -->
								<div class="col" style="margin: 50px 0px 20px 0px;">
									<a
										href="${pageContext.request.contextPath }/blockUser.do?member_no=${viewingUser.member_no }&redirect_url=${referer }">
										<button type="button" class="btn btn-success"
											style="margin-left: 50%;">Block User</button>
									</a>
								</div>
							</c:when>
							<c:when test="${friendStatus == 0}">
								<div class="col" style="margin: 50px 0px 20px 0px;">
									<a
										href="${pageContext.request.contextPath }/cancelFriendRequest.do?member_no=${viewingUser.member_no }&redirect_url=${referer }">
										<button type="button" class="btn btn-danger"
											style="margin-left: 50%;">Cancel Friend Request</button>
									</a>
								</div>
								<div class="col" style="margin: 50px 0px 20px 0px;">
									<a
										href="${pageContext.request.contextPath }/blockFriend.do?member_no=${viewingUser.member_no }&redirect_url=${referer }">
										<button type="button" class="btn btn-success"
											style="margin-left: 50%;">Block User</button>
									</a>
								</div>
							</c:when>
							<c:when test="${friendStatus == 1}">
								<div class="col" style="margin: 50px 0px 20px 0px;">
									<a
										href="${pageContext.request.contextPath }/deleteFriendRequest.do?member_no=${viewingUser.member_no }&redirect_url=${referer }">
										<button type="button" class="btn btn-danger"
											style="margin-left: 50%;">Delete Friend</button>
									</a>
								</div>
								<div class="col" style="margin: 50px 0px 20px 0px;">
									<a
										href="${pageContext.request.contextPath }/blockFriend.do?member_no=${viewingUser.member_no }&redirect_url=${referer }">
										<button type="button" class="btn btn-success"
											style="margin-left: 50%;">Block User</button>
									</a>
								</div>
							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose>
					</div>


					<!-- 					show this memebr's recipes and otehr stuff below -->
				</div>
			</div>



		</div>
	</div>
</body>
</html>