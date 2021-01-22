<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Friends</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/top.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<style type="text/css">
</style>

</head>

<body>

	<div class="row">
		<div class="col-3">
			<div id="mySidenav" class="ccrsidenav">
				<img
					src="${pageContext.request.contextPath }/resources/image/ccrlogo.png"
					class="navbarlogo"> <a href="javascript:void(0)"
					class="closebtn" onclick="closeNav()">&times;</a>

				<div class="ccrsidenav-item">
					<a href="#">추천</a>
				</div>

				<div class="ccrsidenav-item dropdown-item">
					<a href="#">레시피</a>
				</div>
				<div class="dropdown-container">
					<a href="#">한식</a> <a href="#">중식</a> <a href="#">양식</a> <a
						href="#">일식</a>
				</div>

				<div class="ccrsidenav-item">
					<a href="#">매거진</a>
				</div>

				<div class="ccrsidenav-item">
					<a href="#">클래스</a>
				</div>

				<div class="ccrsidenav-item dropdown-item">
					<a href="#">마이페이지</a>
				</div>
				<div class="dropdown-container">
					<a href="#" class="dda">내 정보</a> <a href="#" class="dda">코인</a> <a
						href="#" class="dda">찜목록</a> <a href="#" class="dda">내가쓴레시피</a>
				</div>

			</div>
			<div id="navbtnicon">
				<span id="navbtn" class="openbtn" onclick="openNav()">&#9776;
				</span>
			</div>
		</div>
		<div class="col">
			<img
				style="display: block; margin-left: auto; margin-right: auto; width: 10%; margin-top: 5px; height: 75px; width: 110px;"
				src="C:\Users\Jay K\Desktop\toplogo.png">
		</div>
		<div class="col-3">
			<div class="userbox">
				<a href="${pageContext.request.contextPath }/member/login_page.do"
					class="loginicon"> <i class="far fa-user-circle"></i> Login
				</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-3"></div>
		<div class="col"
			style="margin-top: 1%; border-radius: 5px; height: 5px; background: linear-gradient(to right, silver, gold);">
		</div>
		<div class="col-3"></div>
	</div>



	<div class="row">
		<div class="col-3"></div>
		<div class="col">
			<div class="row">
				<div class="col-3">Friend Nickname</div>
			</div>
			<div class="row">
				<c:forEach items="${friendslist }" var="friends">
					<div class="col-3">
						<table>
							<tbody>
								<tr>
									<td><a style="margin-left: 150px"
										href="${pageContext.request.contextPath }/member/user.do?member_no=${friends.member_no }&redirect_url=${referer }">
											${friends.member_nickname } </a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-9">
						<table>
							<thead>
							</thead>
							<tbody>
								<tr>
									<!-- 						DELETE FRIEND -->
									<!-- deleteFriend -->
									<td><a class="btn btn-primary" style="margin-left: 150px"
										href="${pageContext.request.contextPath }/deletefriend.do?member_no=${friends.member_no }&redirect_url=${referer }">
											Delete Friend</a></td>
									<!-- 						BLOCK FRIEND -->
									<!-- blockFriend -->
									<td><a class="btn btn-primary" style="margin-left: 150px"
										href="${pageContext.request.contextPath }/blockfriend.do?member_no=${friends.member_no }&redirect_url=${referer }">Block
											Friend</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="col-3"></div>
	</div>

	<div class="row">
		<div class="col-3"></div>
		<div class="col">
			<div class="row">
				<div class="col-3">Request Sent to</div>
			</div>
			<div class="row">
				<c:forEach items="${pendingRequests }" var="outogingRequests">
					<div class="col-3">
						<table>
							<tbody>
								<tr>
									<td><a style="margin-left: 150px"
										href="${pageContext.request.contextPath }/member/user.do?member_no=${outogingRequests.member_no }&redirect_url=${referer }">
											${outogingRequests.member_nickname } </a></td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="col-9">
						<table>
							<thead>
							</thead>
							<tbody>
								<tr>
									<!-- 						CANCEL REQUEST SENT -->
									<!-- cancelFriendRequest -->
									<td><a class="btn btn-primary" style="margin-left: 150px"
										href="${pageContext.request.contextPath }/cancelFriendRequest.do?member_no=${outogingRequests.member_no }&redirect_url=${referer }">Cancel
											Friend Request</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="col-3"></div>
	</div>


	<div class="row">
		<div class="col-3"></div>
		<div class="col">
			<div class="row">
				<div class="col-3">Requests From</div>
			</div>
			<div class="row">
				<c:forEach items="${friendRequests }" var="incomingRequests">
					<div class="col-3">
						<table>

							<tbody>

								<tr>
									<td><a style="margin-left: 150px"
										href="${pageContext.request.contextPath }/member/user.do?member_no=${incomingRequests.member_no }&redirect_url=${referer }">
											${incomingRequests.member_nickname } </a></td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="col-9">
						<table>
							<thead>
							</thead>
							<tbody>
								<tr>
									<!-- 						ACCEPT REQUEST -->
									<!-- acceptFriendRequest -->
									<td><a class="btn btn-success" style="margin-left: 50px"
										href="${pageContext.request.contextPath }/acceptFriendRequest.do?member_no=${incomingRequests.member_no }&redirect_url=${referer }">Accept
											Request</a></td>
									<td>
										<!-- 						DENY REQUEST --> <!-- declineFriendRequest --> <a
										class="btn btn-danger" style="margin-left: 50px"
										href="${pageContext.request.contextPath }/delcineFriendRequest.do?member_no=${incomingRequests.member_no }&redirect_url=${referer }">Decline
											Request</a>
									</td>
									<td>
										<!-- 						BLOCK USER --> <!-- blockFriend --> <a
										class="btn btn-dark" style="margin-left: 50px"
										href="${pageContext.request.contextPath }/blockFriendRequest.do?member_no=${incomingRequests.member_no }&redirect_url=${referer }">
											Block Friend </a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="col-3"></div>
	</div>


	<div class="row">
		<div class="col-3"></div>
		<div class="col">
			<div class="row">
				<div class="col-3">Blocked Users</div>
			</div>
			<div class="row">
				<c:forEach items="${blockedUsers }" var="blockedUsers">
					<div class="col-3">
						<table>
							<tbody>
								<tr>
									<td><a style="margin-left: 150px"
										href="${pageContext.request.contextPath }/member/user.do?member_no=${blockedUsers.member_no }&redirect_url=${referer }">
											${blockedUsers.member_nickname } </a></td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="col-9">
						<table>
							<thead>
							</thead>
							<tbody>
								<tr>
									<!-- 						UNBLOCK -->
									<!-- unblockUser -->
									<td><a class="btn btn-primary" style="margin-left: 150px"
										href="${pageContext.request.contextPath }/unblockUser.do?member_no=${blockedUsers.member_no }&redirect_url=${referer }">
											Unblock</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="col-3"></div>
	</div>







</body>
</html>