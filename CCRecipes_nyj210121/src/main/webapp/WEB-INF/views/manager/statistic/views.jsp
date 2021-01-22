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
   
</style>
  
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  								


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
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/board/qna_list.do">Q&A 게시판</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/board/free_board.do">자유게시판</a>
                            </li>
                        </ul>
                        
                        <hr class="d-sm-none">
                        
                        
                         <p class = "white_text margin_b">클래스 관리</p>
                          <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/class/class_list.do">클래스 리스트</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover" href="${pateContext.request.contextPath}/manager/class/teacher_list.do">선생님 목록</a>
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
                            <a class="nav-link underline-on-hover" href="${pageContext.request.contextPath }/manager/statistic/member_join.do">회원가입 통계</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link underline-on-hover active" href="${pageContext.request.contextPath }/manager/statistic/views.do">조회수 통계</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div> 
	   
	    <div class="col-sm-8">
	      <p style = "margin-bottom:5px;">통계</p>
	      <h2>조회수 통계</h2>
	      
	      <c:choose>
	      	<c:when test="${!empty sessionUser }">
	      		<div class = "text_align_right"><a href = "${pageContext.request.contextPath }/qna/qna_writing_page.do">글쓰기</a></div>	
	      	</c:when>
	      	<c:otherwise></c:otherwise>
	      </c:choose>
	       
	       <hr>
	      
		
	     
	      <div class = "row mb-2">
	      	<div class = "col">
	      		<div class = "row">
	      			<div class = "col">
				 	   <div id="chart_div"></div>
	      		</div>
	      	</div>
	  
	      	</div>
	      	
	      </div>
	      
		  
	    </div>
	  </div>
	</div>
	 
	 
	 <script>
	 google.charts.load('current', {packages: ['corechart', 'bar']});
	 google.charts.setOnLoadCallback(drawBasic);

	 function drawBasic() {

	       var data = new google.visualization.DataTable();
	       data.addColumn('timeofday', 'Time of Day');
	       data.addColumn('number', 'Motivation Level');

	       data.addRows([
	         [{v: [8, 0, 0], f: '8일'}, 1],
	         [{v: [9, 0, 0], f: '9일'}, 2],
	         [{v: [10, 0, 0], f:'10일'}, 3],
	         [{v: [11, 0, 0], f: '11일'}, 4],
	         [{v: [12, 0, 0], f: '12일'}, 5],
	         [{v: [13, 0, 0], f: '1일'}, 6],
	         [{v: [14, 0, 0], f: '2일'}, 7],
	         [{v: [15, 0, 0], f: '3일'}, 8],
	         [{v: [16, 0, 0], f: '4일'}, 9],
	         [{v: [17, 0, 0], f: '5일'}, 10],
	       ]);

	       var options = {
	         title: 'Motivation Level Throughout the Day',
	         hAxis: {
	           title: 'Time of Day',
	           format: 'h:mm a',
	           viewWindow: {
	             min: [7, 30, 0],
	             max: [17, 30, 0]
	           }
	         },
	         vAxis: {
	           title: 'Rating (scale of 1-10)'
	         }
	       };

	       var chart = new google.visualization.ColumnChart(
	         document.getElementById('chart_div'));

	       chart.draw(data, options);
	     }
	 </script>
</body>
</html>
