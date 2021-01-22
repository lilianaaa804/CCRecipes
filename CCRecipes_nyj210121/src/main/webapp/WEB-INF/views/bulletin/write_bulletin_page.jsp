<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.col-4{
  padding: 8px;
  text-align: center;
}

.row{
float :left;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>

<div class="container mt-5" style="padding-top: 200px;"></div>

		

<div class="row">
	<div class="col-4"></div>
	<div class="col-4" >글쓰기</div>
	<div class="col-4"></div>
</div>


<div class="container">
	<div class="row">
			<div class="col">
			<form action="${pageContext.request.contextPath}/bulletin/write_bulletin_process.do" method="post" enctype="multipart/form-data">
			작성자 : ${sessionUser.member_nickname }<br>								<!-- get으론 해결할수없음 enctype이있으면 항상 post  -->
			제목 : <input type="text" name="bulletin_title"><br>
			내용 : 
			<textarea name="bulletin_content" rows="10" cols="60"></textarea>
			<br>
			이미지:<input name="files" type="file" accept="image/*"  multiple="multiple"><br> 
			<input type="submit" value="글 쓰기">
			</form>
			</div>
	</div>
</div>


<div class="container mt-5" style="padding-top: 50px;"></div>
	<div class="row">
	<div class="col-2"></div>
			<div class="col">
		
			 	<dl>
    			<dt><i class="fas fa-heart"></i><h4>주의사항</h4><i class="fas fa-heart"></i></dt>
   				<dd><h6>- 1.상대방을 비방하는 글을 자제해주세요</h6></dd>
   				<dd><h6>- 2.글쓰기 전에 카테고리에 맞는글일 찾아쓰세요</h6></dd>
   				<dd><h6>- 3.항상 인사말로 시작해요</h6></dd>
   				<dd><h6>- 4.기본적인 매너는 꼭 지키셔야 합니다</h6></dd>
   				<dd><h6>- 5.글을 쓰기 전에 항상 같은 질문이 있는지 확인!!</h6></dd>
 				</dl>     
			</div>
			
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>







