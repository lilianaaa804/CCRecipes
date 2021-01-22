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
  
	.underline-on-hover:hover {
	    text-decoration: underline;
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
	
	<div class="container qnacontainer" style = "margin-top : 150px;">
	  <div class="row">	
	    
	    
	   <jsp:include page="/WEB-INF/views/common/qnabar.jsp"></jsp:include>
	   
	    <div class="col-sm-8">
	      <h2>Q&A 게시판 </h2>
	      
	      <c:choose>
	      	<c:when test="${!empty sessionUser }">
	      		<div class = "text_align_right white_text"><a href = "${pageContext.request.contextPath }/qna/qna_writing_page.do">글쓰기</a></div>	
	      	</c:when>
	      	<c:otherwise></c:otherwise>
	      </c:choose>
	       
	       <hr>
	      
		<form action = "${pageContext.request.contextPath }/qna/qna_serach.do" method = "post">
	      <div class = "row mb-3">
	      	
	      	<div class = "col-2">
	      		<select name = "qna_search" class = "form-select" >
	      			<option value = "search_writer_qna" selected>작성자</option>	
	      			<option value = "search_title_qna">제목</option>
	      			<option value = "search_text_qna">내용</option>
	      			
	      		</select>
	      	</div>
	      	<div class = "col-8	">
	      		<input class = "form-control" name = "search_word" type = "text" placeholder="검색어를 입력해주세요.">
	      	</div>
	      	<div class = "col-2">
	      		<input class = "btn btn-primary" type = "submit" value = "검색">
	      	</div>
	      	
	      </div>
	     </form> 
	      <div class = "row mb-2">
	      	<div class = "col">
	      		<div class = "row">
	      			<div class = "col">
	      			<div class = "row text_center_align mb-2">
		      			<div class = "col-1">글번호</div>
		      			<div class = "col">제목</div>
		      			<div class = "col-2">작성자</div>
		      			<div class = "col-1">조회수</div>
		      			<div class = "col">작성일</div>
	      			</div>
	      			
	      			
	      			<c:forEach items="${resultList}" var="data"> 
		      			<div class = "row mb-2">
		      				<div class = "col-1 text_center_align">${data.qnaContentVo.qna_no}</div> 
			      			<div class = "col underline-on-hover" ><a style = "text-decoration : none; color : black;" href = "${pageContext.request.contextPath }/qna/qna_read_page.do?qna_no=${data.qnaContentVo.qna_no}">${data.qnaContentVo.qna_title }</a></div>	
			      			<div class = "col-2 text_center_align">${data.ccrMember.member_nickname }</div>
			      			<div class = "col-1 text_center_align">${data.qnaContentVo.qna_views }</div>
			      			<div class = "col text_center_align">${data.qnaContentVo.qna_date }</div>  
		      			</div>
	      			</c:forEach> 
	      			
	      			
	      			
	      		</div>
	      	</div>
	  
	      	</div>
	      	
	      </div>
	      
		  
	    </div>
	  </div>
	</div>
	 
</body>
</html>
