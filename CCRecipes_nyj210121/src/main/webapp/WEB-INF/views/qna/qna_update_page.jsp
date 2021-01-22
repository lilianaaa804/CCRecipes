<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CLear Cut Recipes</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/navbarstyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fontawesome-free-5.15.1-web/css/all.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">


<style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  
 .white_text{
  	color : white;
  }
</style>
  
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>  
<body class="ccrcontainer" >
	<div class="topbar">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp" />
	</div>
	
	<!-- <div class="jumbotron text-center" style="margin-bottom:0">
	  <h1> 로고 </h1>
	  <p>최고의 레시피를 만나보세요!</p> 
	</div> -->
	
	
 	<div class="container qnacontainer" style = "margin-top : 150px;">
	  <div class="row">
	    <jsp:include page="/WEB-INF/views/common/qnabar.jsp"></jsp:include>
	    
	   
	   
	    <div class="col-sm-8">
	      <h2>Q&A 글수정</h2>
	      <div class = "text_align_right white_text"><a href = "${pageContext.request.contextPath }/qna/qna_board.do">목록으로</a></div>
	      <hr>
	      
	      <form action = "${pageContext.request.contextPath }/qna/qna_update_process.do" method = "post">
		      <select class="form-select mb-2" aria-label="Default select example">
				  <option value = "qna_board" selected>Q&A 게시판</option>	
			  </select>
			  
		      <div class="mb-2">
				  <input name = "qna_title" type="text" class="form-control" id="exampleFormControlInput1" value = "${resultList.qnaContentVo.qna_title }">
			  </div>
		      
		      <div class="mb-2">
				  <textarea name = "qna_text" class="form-control" id="exampleFormControlTextarea1" rows="15">${resultList.qnaContentVo.qna_text }</textarea>
			  </div>	
	 		  <div class="d-grid gap-2">
				<button class="btn btn-primary" type="submit">글쓰기</button>
			  </div>
		  </form>
		  
	    </div>
	  </div>
	</div>
	
</body>
</html>
