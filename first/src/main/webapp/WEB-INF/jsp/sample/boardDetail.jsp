<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<link href="/css/bootstrap.min.css" rel="stylesheet">

<style>
  #banner > .inner {
    -moz-transform: scale(1.0);
    -webkit-transform: scale(1.0);
    -ms-transform: scale(1.0);
    transform: scale(1.0);
    -moz-transition: opacity 1s ease, -moz-transform 1s ease;
    -webkit-transition: opacity 1s ease, -webkit-transform 1s ease;
    -ms-transition: opacity 1s ease, -ms-transform 1s ease;
    transition: opacity 1s ease, transform 1s ease;
    opacity: 1;
    position: relative;
    z-index: 3; }
  #banner video {
    -moz-transform: translateX(50%) translateY(50%);
    -webkit-transform: translateX(50%) translateY(50%);
    -ms-transform: translateX(50%) translateY(50%);
    transform: translateX(50%) translateY(50%);
    bottom: 30%;
    height: auto;
    min-height: 100%;
    min-width: 100%;
    overflow: hidden;
    position: absolute;
    right: 50%;
    width: auto; }
 
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
	background-color: #ffffff;
}

.table>tr>th {
	text-align: center;
	color: black;
	background-color: white;
}


.table-hover>tbody>tr:hover {
	background-color: #ffffff;
}

.table>tbody>tr>td {
	text-align: center;
	color: black;
	background-color: white;
}

.table>tbody>tr>th {
	text-align: center;
	color: black;
	background-color: white;
}

.table>tbody>tr>#title {
	text-align: left;
}


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
<%@ include file="/WEB-INF/jsp/home/homeMenu.jsp"%>
<div id="banner">
				<div class="inner">
<div id="container">
<font color ="white"><caption>게시글 상세</caption></font>
	<table class="table table-striped table-bordered table-hover">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${dto.TITLE }</td>
				<th scope="row">조회수</th>
				<td>${dto.HIT_CNT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${dto.CREA_ID }</td>
				<th scope="row">작성시간</th>
				<td>${dto.CREA_DTM }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${dto.TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${dto.CONTENTS }</td>
			</tr>
		</tbody>
	</table>
	
	<div align="right">
	<a href="#this" class="btn" id="list">목록으로</a>

	
	
<c:choose>
	<c:when test="${sessionScope.userId == dto.CREA_ID}">
		<a href="#this" class="btn" id="update">수정하기</a>
	</c:when>
	<c:when test="${sessionScope.userId == 'admin'}">
		<a href="#this" class="btn" id="update">수정하기</a>
	</c:when>
	<c:otherwise>
		
	</c:otherwise>
</c:choose>		
	
	
	
	
	</div>
	</div>
	</div>
	<video autoplay loop muted playsinline src="/images/Stars19642.mp4"></video>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript"> 
	$(document).ready(function(){
		$("#list").on("click", function(e){ //목록으로 버튼 
			var curPage = getParameterByName('curPage');
			var searchOption = getParameterByName('searchOption');
			var keyword = getParameterByName('keyword');
			location.href="${path}/sample/board.do?curPage="+curPage+"&searchOption="+searchOption+"&keyword="+keyword;
		}); 
		
		$("#update").on("click", function(e){ 
			e.preventDefault(); 
			fn_openBoardUpdate(); 
		}); 
	}); 
	function fn_openBoardList(){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/sample/board.do' />"); 
		comSubmit.submit(); 
	} 
	
	function fn_openBoardUpdate(){ 
		var idx = "${dto.IDX}"; 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/sample/updateScreen.do' />"); 
		comSubmit.addParam("IDX", idx); 
		comSubmit.submit(); 
	} 
	
	function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

	
	</script>
</body>
</html>

