<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.col-6 {
  padding: 8px;
  text-align: center;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>



<div class="row mt-5 mb-5">
	<div class="col-3"></div>
	<div class="col-6">네비바자리</div>
	<div class="col-3"></div>
</div>
	
<div class="row mb-2">
	<div class="col-2"></div>
	<div class="col-5">
	 <dl>
    <dt><h4><i class="fas fa-heart"></i>자유게시판<i class="fas fa-heart"></i></h4></dt>
    <dd><h6>- 세부검색을 원하시면 검색카테고리를 선택해주세요</h6></dd>
  </dl>     
  </div>
  <div class="col"></div>
</div>	

<form action="${pageContext.request.contextPath }/content/main_page.do" method="get">
				<div class="row mb-3"><!-- 검색... -->
				<div class="col-1"></div>
					<div class="col-2 mt-2">
						<select name="search_type" class="form-control">
							<option value="title">자유게시판</option>
							<option value="content">클래스</option>
							<option value="writer">매거진</option>
						</select>
					</div>
					<div class="col-6">
						<input name="search_word" type="text" class="form-control">
					</div>
					<div class="col-2 d-grid gap-2">
						<input type="submit" value="검색" class="btn btn-primary">
					</div>
					<div class="col-1"></div>
				</div>
				</form>
	
	<div class="container">
  <h4><i class="fas fa-file"></i>자유로운 모든 글을 쓸수 있는 게시판입니다.</h4>
  <p>-타인을 비하하거나 불건전한 글은 관리자에 의해 삭제 될 수 있음을 미리 말씀드립니다.</p>            
  <table class="table table-hover">
    <thead>
    <!-- tr표 내부행 th는 제목셀 td는일반내용 -->
      <tr class="table-primary" >
        <th>글번호</th>
        <th>작성자</th>
        <th>글내용</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
        
        <c:forEach items="${resultList }" var="data">
									<tr class="table-warning">
										<td>${data.CCRBulletin.bulletin_no }</td>
										<td>${data.CCRMember.member_nickname}</td>
										<td><a href="${pageContext.request.contextPath }/bulletin/read_bulletin_page.do?bulletin_no=${data.CCRBulletin.bulletin_no }">${data.CCRBulletin.bulletin_title }</a></td>
										<td><fmt:formatDate pattern="yy.MM.dd" value="${data.CCRBulletin.bulletin_writedate }"/></td>
										<td>${data.CCRBulletin.bulletin_readcount }</td>
									</tr>
		</c:forEach>
       
      <tr class="table-light">
        <td>노연지</td>
        <td>3번글</td>
        <td>사미라장인</td>
        <td>2020-12-22</td>
        <td>18</td>
        
      </tr>
      
      <tr class="table-secondary">
        <td>권주강</td>
        <td>4번글</td>
        <td>베인장인</td>
        <td>2020-12-23</td>
        <td>19</td>
        
      </tr> 
      
       <tr  class="table-info">
        <td>김유진</td>
        <td>5번글</td>
        <td>아펠리오스장인</td>
        <td>2020-12-24</td>
        <td>20</td>
      </tr> 
      
    </tbody>
  </table>
</div>


<div class="row mt-2 mb-2">
	<div class="col-9"></div>
	<div class="col-2 d-grid gap-2">
		<a class="btn btn-primary" href="${pageContext.request.contextPath }/bulletin/write_bulletin_page.do">글쓰기</a>
	</div>
	<div class="col-1"></div>
</div>


<div class="container mt-5">
<ul class="pagination justify-content-center">
  <li class="page-item"><a class="page-link" href="#">이전</a></li>
  <li class="page-item active"><a class="page-link" href="#">1</a></li>
  <li class="page-item"><a class="page-link" href="#">2</a></li>
  <li class="page-item"><a class="page-link" href="#">3</a></li>
  <li class="page-item"><a class="page-link" href="#">4</a></li>
  <li class="page-item"><a class="page-link" href="#">5</a></li>
  <li class="page-item"><a class="page-link" href="#">다음</a></li>
</ul>
</div>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>






