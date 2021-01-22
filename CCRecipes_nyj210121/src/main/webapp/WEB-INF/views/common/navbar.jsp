<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="mySidenav" class="ccrsidenav">
	<img
		src="${pageContext.request.contextPath }/resources/image/ccrlogo.png"
		class="navbarlogo"> <a href="javascript:void(0)"
		class="closebtn" onclick="closeNav()">&times;</a>

	<div class="ccrsidenav-item">
		<a href="#">추천</a>
	</div>

	<div class="ccrsidenav-item dropdown-item" style="margin-left: 0px;">
		<a href="#">레시피</a>
	</div>
	<div class="dropdown-container">
		<a href="#">한식</a> <a href="#">중식</a> <a href="#">양식</a> <a href="#">일식</a>
	</div>

	<div class="ccrsidenav-item">
		<a href="#">매거진</a>
	</div>

	<div class="ccrsidenav-item">
		<a href="#">클래스</a>
	</div>

	<div class="ccrsidenav-item dropdown-item ccrnavbarpl">
		<a href="#">마이페이지</a>
	</div>
	<div class="dropdown-container">
		<a href="#" class="dda">내 정보</a> <a href="#" class="dda">코인</a> <a
			href="#" class="dda">찜목록</a> <a href="#" class="dda">내가쓴레시피</a> <a
			href="#" class="dda">내가남긴후기</a> <a href="#" class="dda">내 클래스</a>
	</div>


</div>

<div id="navbtnicon">
	<span id="navbtn" class="openbtn" onclick="openNav()">&#9776; </span>
</div>

<div class="userbox">
	<div>
		<c:choose>
			<c:when test="${sessionUser.member_email eq 'manager@naver.com'}">
				<a style="margin-top: -6px; margin-right: 10px;"
					href="${pageContext.request.contextPath }/manager/member/member_list.do"
					class="loginicon"> <i class="far fa-user-circle"></i></a>
				<div class="ccruserid">${sessionUser.member_nickname }님</div>
				<div class="ccruserlogout">
					<a class="ccruserid"
						href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
				</div>
			</c:when>
			<c:when test="${!empty sessionUser}">
				<a style="margin-top: -6px; margin-right: 10px;"
					href="${pageContext.request.contextPath }/member/my_page.do"
					class="loginicon"> <i class="far fa-user-circle"></i></a>
				<div class="ccruserid">${sessionUser.member_nickname }님</div>
				<div class="ccruserlogout">
					<a class="ccruserid"
						href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
				</div>
			</c:when>
			<c:when test="${empty sessionUser }">
				<<a href="${pageContext.request.contextPath }/member/login_page.do"
					class="loginicon"> <i class="far fa-user-circle"></i> Login
				</a>
			</c:when>
			<c:otherwise>

			</c:otherwise>

		</c:choose>
	</div>

</div>


<script>
	function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
		document.getElementById("navbtn").classList.toggle("hidden");
		document.getElementById("navbtnicon").classList.toggle("hidden");
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
		document.getElementById("navbtn").classList.toggle("hidden");
		document.getElementById("navbtnicon").classList.toggle("hidden");
	}

	var dropdown = document.getElementsByClassName("dropdown-item");
	var i;

	for (i = 0; i < dropdown.length; i++) {

		dropdown[i].addEventListener("mouseover", function() {
			this.classList.toggle("active");
			var nextsibling = this.nextElementSibling;
			if (nextsibling.className == "dropdown-container") {
				nextsibling.style.display = "block";
			}

		});
		dropdown[i].addEventListener("mouseout", function() {
			this.classList.toggle("active");
			var nextsibling = this.nextElementSibling;
			if (nextsibling.className == "dropdown-container") {
				nextsibling.style.display = "none";
			}
		});
	}
</script>
