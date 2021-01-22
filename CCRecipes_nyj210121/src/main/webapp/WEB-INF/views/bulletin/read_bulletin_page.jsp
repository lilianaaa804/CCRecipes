<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">



	function writeReple(){
		var repleContent = document.getElementById("reple_content").value;
		var contentNo = ${result.CCRBulletin.bulletin_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//...
					refresh();
			}			
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/bulletin/write_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("bulletin_no=" + bulletinNo + "&reple_content=" + repleContent);
		
		
		
		document.getElementById("reple_content").value="";
	}
	function refreshReple(){
		var bulletinNo = ${result.CCRBulletin.bulletin_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//...
				//alert(xmlhttp.responseText);
				var obj = JSON.parse(xmlhttp.responseText);
				
				//이후...JS로 태그 생성 및 꾸미기....
				
				var repleListBox = document.getElementById("reple_list_box");
				
				//박스 안쪽 초기화...
				//repleListBox.innerHTML = ""; 
				
				var childCount = repleListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){ //전체리스트뽑아옴
					repleListBox.childNodes[0].remove();
				}
				
				
				
				
				for(repleData of obj){
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class","row");
					
					var contentBox = document.createElement("div");
					contentBox.setAttribute("class","col-9 alert alert-primary");
					contentBox.innerText = repleData.repleVo.reple_content;
					
					var nickBox = document.createElement("div");
					nickBox.setAttribute("class","col-1 alert alert-success");
					nickBox.innerText = repleData.memberVo.member_nickname;
					
					var dateBox = document.createElement("div");
					dateBox.setAttribute("class","col-2 alert alert-danger");
					
					var d = new Date(repleData.repleVo.reple_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					
					dateBox.innerText = strDate;
					
					rowBox.append(contentBox);
					rowBox.append(nickBox);
					rowBox.append(dateBox);
					
					repleListBox.append(rowBox);
				}
				
			}			
		};
		
		xmlhttp.open("get","${pageContext.request.contextPath}/bulletin/get_reple_list.do?bulletin_no=" + bulletinNo);
		xmlhttp.send();
		
	}


	function refresh(){
		refreshReple();
		refreshGraph();
	}

	setInterval(refresh,1000);
	
</script>

<style>
.row{
float :left;
}
</style>


</head>

<body onload="refresh();">

<div class="container mt-5" style="padding-top: 200px;"></div>

		



<div class="container">
	<div class="row">
		<div class="col">
	<h1>게시글 보기</h1>
	제목 : ${result.CCRBulletin.content_title }<br>
	작성자 : ${result.memberVo.member_nickname }<br>
	조회수  : ${result.CCRBulletin.bulletin_readcount}<br>
	작성일 : ${result.CCRBulletin.bulletin_writedate}<br>
	내용 : <br>
	${result.CCRBulletin.bulletin_content }<br>
		</div>
	

	
	
	<c:forEach items="${result.imageVoList}" var="imageVo">
		<img src="${imageVo.image_link}"><br>
	</c:forEach>
	
	<a href="${pageContext.request.contextPath}/bulletin/bulletin_page.do">목록으로</a>
	
	<c:if test="${!empty sessionUser && sessionUser.member_no == result.CCRBulletin.member_no}">
		<a href="${pageContext.request.contextPath}/bulletin/delete_bulletin_process.do?bulletin_no=${result.CCRBulletin.bulletin_no}">삭제</a>
		<a href="${pageContext.request.contextPath}/bulletin/update_bulletin_page.do?bulletin_no=${result.CCRBulletin.bulletin_no }">수정</a>
	</c:if>
	
	
	<!-- 리플리스트 -->
	<div class="container" id="reple_list_box">

		<div class="row">
		<div class="col-9 alert alert-primary">안녕하세요</div>	
		<div class="col-1 alert alert-success">한조</div>	
		<div class="col-2 alert alert-danger">2020-10-10</div>	
		
		</div>

	</div>
	</div>
		
	<c:if test="${!empty sessionUser }">
	<div>
		<!-- 순수 AJAX는 form 없어도 됨...JS로 다 처리 할것이기 때문에... -->
		댓글 쓰기 : <br> 
		<textarea id="reple_content" rows="3" cols="100"></textarea>
		<input onclick="writeReple()" type="button" value="댓글 작성">		
	</div>
	</c:if>
	</div>
	
	
	<div class="container mt-5" style="padding-top: 50px;"></div>
	<div class="row">
	<div class="col-1"></div>
			<div class="col">
		
			 	<dl>
    			<dt><h4><i class="fas fa-heart"></i>주의사항<i class="fas fa-heart"></i><h4></dt>
   				<dd><h6>- 1.상대방을 비방하는 글을 자제해주세요<h6></dd>
   				<dd><h6>- 2.글쓰기 전에 카테고리에 맞는글일 찾아쓰세요<h6></dd>
   				<dd><h6>- 3.항상 인사말로 시작해요<h6></dd>
   				<dd><h6>- 4.기본적인 매너는 꼭 지키셔야 합니다<h6></dd>
   				<dd><h6>- 5.글을 쓰기 전에 항상 같은 질문이 있는지 확인!!<h6></dd>
 				</dl>     
			</div>
			
	</div>
</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>









