<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>


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
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<%@ include file="/WEB-INF/jsp/home/homeMenu.jsp"%>
<form id="frm">
<div id="container">
	<input type="hidden" id="CREA_ID" name="CREA_ID" value="${sessionScope.userName}">
		<table class="table table-striped table-bordered table-hover" style="table-layout: fixed">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" width="5%">제목</th>
					<td><input type="text" id="TITLE" name="TITLE" class="wdp_90" ></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text"><textarea rows="20"
							cols="170" title="내용" id="CONTENTS" name="CONTENTS"></textarea></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${sessionScope.userName}</td>
				</tr>
			</tbody>
		</table>
		<div align="right">
		<a href="#this"  id="write"><font color = "white">작성하기</font></a> 
		<a href="#this"  id="list"><font color = "white">목록으로</font></a>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e){ // 목록으로
				e.preventDefault();
				fn_openBoardList();
			});

		$("#write").on("click", function(e){ // 작성하기
			e.preventDefault();
			fn_insertBoard();
		});
	});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value = '/sample/board.do' />");
			comSubmit.submit();
		}

		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value = '/sample/writeBoard.do' />");
			comSubmit.submit();
		}
		
	</script>
</body>
</html>