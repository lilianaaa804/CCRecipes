<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
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

    .qnacontainer {
        margin-top: 50px;
        margin-left: 50px;

    }
   .margin_b{
		margin-bottom : 5px;  
		margin-top : 10px;
   }
   
   .pageBar {
  	margin-top : 50px;
  	
  }
  
  .text_center{
  	text-align : center;
  }
  
  .margin_zero {
   	margin : 0px;
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
	
	<div class="qnacontainer">
	  <div class="row">
            

	    <div class="col-sm-2 me-5" >
		<div class = "row">
			<div class = "col" style = "background-color: rgba(0,0,0, 0.4); height : 900px;">
                        <h3 style = "color : white; ">Clear-Cut Recipes</h3>
                        
                        <p class = "white_text margin_b">회원 관리</p>
                          <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/member/member_list.do">회원리스트</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/member/withdrawn_member_list.do">탈퇴회원리스트</a>
                            </li>
                        </ul>
                        
                        <p class = "white_text margin_b">게시글 관리</p>
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/board/notice_list.do">공지사항</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link active underline-on-hover" href="${pageContext.request.contextPath }/manager/board/qna_list.do">Q&A 게시판</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/board/free_board.do">자유게시판</a>
                            </li>
                        </ul>
                        
                        <hr class="d-sm-none">
                        
                        
                         <p class = "white_text margin_b">클래스 관리</p>
                          <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/class/class_list.do"">클래스 리스트</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pateContext.request.contextPath}/manager/class/class_member_list.do">수강회원 목록</a>
                            </li>
                        </ul>
                        
                         
                      	  <p class = "white_text margin_b">매거진 관리</p>
                          <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/megazine/megazine_list.do">매거진 리스트</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pateContext.request.contextPath}/manager/megazine/editor_list.do">에디터 목록</a>
                            </li>
                      	  </ul>
                        
                        
                         <p class = "white_text margin_b">서비스 관리</p>
                          <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/service/coin_order.do">코인 구매내역</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/service/report_list.do">신고 접수</a>
                            </li>
                        </ul>
                        
                         <p class = "white_text margin_b">통계</p>
                          <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/statistic/member_join.do">회원 가입 통계</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/statistic/views.do">조회수 통계</a>
                            </li>
                        </ul>
                        
         
                    </div>
                </div>
            </div> 
	   
	    <div class="col-sm-8">
	      <p style = "margin-bottom:5px;">게시글 관리</p>
	      <h2>Q&A 글보기</h2>	
	      <c:choose>
	      	<c:when test="${!empty sessionUser }">
	      		<div class = "text_align_right"><a href = "${pageContext.request.contextPath }/qna/qna_writing_page.do">글쓰기</a></div>	
	      	</c:when>
	      	<c:otherwise></c:otherwise>
	      </c:choose>
	       
	       <hr>
 
<!-- 	     			-sm-10 -->
	      
		       
			  
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
	 		  			<form action = "${pageContext.request.contextPath }/manager/board/qna_comment_process.do?qna_no=${resultList.qnaContentVo.qna_no}" method = "post" class="row g-3">
						  <div class="col-2">
						    <input type="text" readonly class="form-control-plaintext" value="관리자">
						  </div>
						  <div class="col">
						    <input type="text" name = "qna_comment_text" class="form-control" id="inputPassword2" placeholder="댓글을 입력해주세요.">
						  </div>
						  <div class="col-2" style = "text-align: right;">
						    <button type="submit" class="btn btn-primary mb-3">댓글 작성</button>
						  </div>
						  <input type = "hidden" name = "member_no" value = "${resultList.ccMemberVo.member_no}">
						</form>
	 		  		</div>
	 		  	</div>
	 		  	
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
				
				<div class = "row text_center">
					<div class = "col-2">닉네임</div>
					<div class = "col">내용</div>
					<div class = "col-3">날짜</div>
				</div>
				<hr class = "marginz_zero">
				
				
				
				<c:forEach items="${commentList}" var="data">
					<div class = "row">
						<div class = "col-2 text_center">관리자</div>
						<div class = "col ">${data.qnaCommentVo.qna_comment_text	 }</div>
						<div class = "col-3 text_center">${data.qnaCommentVo.qna_comment_date }</div>
					</div>
				</c:forEach>
				
				
				
				
				
				
				<div class = "row">
					<div class = "col"></div>
				</div>
				<div class = "row">
					<div class = "col">
						<a href = "${pageContext.request.contextPath }/manager/board/qna_list.do"><button class="btn btn-primary" style = "float : right;">목록</button></a>
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
	