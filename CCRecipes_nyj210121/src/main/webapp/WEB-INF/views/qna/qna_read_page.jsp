<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  
  .text_center{
  	text-align : center;
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
	      <h2>Q&A 글보기</h2>
	      <div class = "text_align_right white_text"><a href = "${pageContext.request.contextPath }/qna/qna_board.do">목록으로</a></div>
	      <hr>
	      
	      
		       
			  
		      <div class="mb-2">
		      	<div class = "row">
		      		<div class = "col-2">제목</div>
		      		<div class = "col">${resultList.qnaContentVo.qna_title}</div>
		      	</div>
						      		
			  </div>
		      <div class = "mb-2">	
		      	<div class = "row">
		      		<div class = "col-2">작성자</div>
		      		<div class = "col">${resultList.ccMemberVo.member_nickname}</div>
		      	</div>
		      </div>
		      <hr>	
		      <div class="mb-3" style = "background-color : white; opacity : 0.5; border-radius: 15px; ">
		      		<div style = "padding : 15px;">
			      		${resultList.qnaContentVo.qna_text }
			  		</div>
			  </div>	
	 		  <div class="d-grid gap-2">	
	 		  	<div class = "row">
	 		  		<div class = "col">
							
						<c:choose>
							<c:when test="${sessionUser.member_no eq resultList.ccMemberVo.member_no}">
								<a href = "${pageContext.request.contextPath }/qna/qna_delete_process.do?qna_no=${resultList.qnaContentVo.qna_no }"><button type="button" class="btn btn-primary ms-2" style = "float : right;">삭제</button></a>
								<a href = "${pageContext.request.contextPath }/qna/qna_update_page.do?qna_no=${resultList.qnaContentVo.qna_no }" style = "float : right;"><button class="btn btn-primary ms-2" >수정</button></a>
							</c:when>
						</c:choose>
						
					</div>
					
			  	</div>
			  	
			  	<div class = "row">
			  		<div class = "col text_center">
			  			<a href = "${pageContext.request.contextPath }/qna/qna_like_process.do?qna_no=${resultList.qnaContentVo.qna_no}&&member_no=${sessionUser.member_no}">
			  				<input type = "button" value = "좋아요">
			  			</a> 
			  			 :  0
			  		</div>
			  	</div>
			  	
			  	<div class = "row">
			  		<div class = "col"><a href = "${pageContext.request.contextPath }/qna/qna_board.do"><button class="btn btn-primary" style = "float : right;">목록</button></a></div>
			  	</div>
			  	<c:forEach items="${commentList}" var="data">
					<div class = "row">
						<div class = "col-2">${data.ccrMember.member_nickname }</div>
						<div class = "col">${data.qnaCommentVo.qna_comment_text	 }</div>
						<div class = "col-3">${data.qnaCommentVo.qna_comment_date }</div>
					</div>
				</c:forEach>
				
				
			  </div>
		   
		  
	    </div>
	  </div>
	</div>
	
</body>
</html>
