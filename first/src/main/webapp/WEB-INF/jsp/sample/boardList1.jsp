<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!-- Bootstrap -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<style>
#container {
	width: 70%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	padding-top: 10%; /* 테두리와 내용 사이의 패딩 여백 */
}

#list {
	text-align: center;
}

#write {
	text-align: right;
} /* Bootstrap 수정 */
.table>thead {
	background-color: #b3c6ff;
}

.table>thead>tr>th {
	text-align: center;
}

.table-hover>tbody>tr:hover {
	background-color: #e6ecff;
}

.table>tbody>tr>td {
	text-align: center;
}

.table>tbody>tr>#title {
	text-align: left;
}

div>#paging {
	text-align: center;
}

.hit {
	animation-name: blink;
	animation-duration: 1.5s;
	animation-timing-function: ease;
	animation-iteration-count: infinite; /* 위 속성들을 한 줄로 표기하기 */
	/* -webkit-animation: blink 1.5s ease infinite; */
} /* 애니메이션 지점 설정하기 */ /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */


@keyframes blink {
	from {color: white;
}

30%
{
color


:

 

yellow


;
}
to {
	color: red;
	font-weight: bold;
}
/* 0% {color:white;} 30% {color: yellow;} 100% {color:red; font-weight: bold;} */
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/include/menu.jsp" %>
	<div id="container">
		<div align="right">
			<!-- Login 검증 -->
			<!-- jstl의 if문은 else가 없어서 따로 검증해야함. -->
			<c:if test="${id != null}">
				<%-- <%@include file="loginOk.jsp" %> --%>
			</c:if>
			<c:if test="${id == null}">
				<%-- <%@include file="login.jsp" %> --%>
			</c:if>
		</div>
		<div id="list">
			<b>게시판 (전체 글: ${totalCount})</b>
		</div>
		<div id="write">
			<a href="/bbs/writeForm.bbs?pageNum=${pageNum}">글쓰기</a>
		</div>
		<div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="10%">번호</th>
						<th width="50%">제목</th>
						<th width="10%">작성자</th>
						<th width="20%">작성일</th>
						<th width="10%">조회</th>
					</tr>
				</thead>
				<tbody>
	
					<c:choose>
								<c:when test="${fn:length(list) > 0}">
					<c:forEach var="row" items="${list }" varStatus="status">
						<tr>
							<td>${row.IDX}</td>
							<td id="title" class="title"><c:if test="${row.depth > 0}"> &nbsp;&nbsp; </c:if>
								<a href="#this" name="title">${row.TITLE}</a>
								<c:if test="${row.HIT_CNT >= 20}">
									<span class="hit">hit!</span>
								</c:if>
								<input type="hidden" id="IDX" value="${row.IDX }"></td>
							
							<td>${row.CREA_ID}</td>
							<td>${row.CREA_DTM}</td>
							<td>${row.HIT_CNT}</td>
							<tr> 
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
					
					
					
				
						</tbody>
			</table>
			<!-- Paging 처리 -->
			<div id="paging">${pageCode}</div>
			
				<br />

	<div id="write"> <a href="#this" class="btn" id="write"> 글쓰기 </a> </div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#write").on("click", function(e){ // 목록으로
				e.preventDefault();
				fn_openBoardWrite();
			});
			
			$("a[name='title']").on("click", function(e){  
				e.preventDefault(); 
				fn_openBoardDetail($(this)); 
			}); 
		});

			function fn_openBoardWrite(){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value = '/sample/openBoardWrite.do' />");
				comSubmit.submit();
			}
			
			function fn_openBoardDetail(obj){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do' />");
				comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
				comSubmit.submit();
			}

	</script>
		</div>
	</div>
</body>
</html>

