<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<form id="frm">
	<input type="hidden" id="CREA_ID" name="CREA_ID" value="${sessionScope.userName}">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text"><textarea rows="20"
							cols="100" title="내용" id="CONTENTS" name="CONTENTS"></textarea></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${sessionScope.userName}</td>
				</tr>
			</tbody>
		</table>
		<a href="#this" class="btn" id="write">작성하기</a> 
		<a href="#this" class="btn" id="list">목록으로</a>
	</form>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
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
			comSubmit.setUrl("<c:url value = '/main/main.do' />");
			comSubmit.submit();
		}

		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value = '/sample/insertBoard.do' />");
			comSubmit.submit();
		}
		
	</script>
</body>
</html>