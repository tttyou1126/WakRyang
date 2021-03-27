<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
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
	<form name="form1" method="post">
	<div id="container">
		<table class="table table-striped table-bordered table-hover" style="table-layout: fixed">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${dto.IDX } <input type="hidden" id="IDX" name="IDX"
						value="${dto.IDX }">
					</td>
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
					<td colspan="3"><input type="text" id="TITLE" name="TITLE"
						class="wdp_90" value="${dto.TITLE }" /></td>
				</tr>
				<tr>
					<td colspan="4" class="view_text"><textarea rows="20"
							cols="170" title="내용" id="CONTENTS" name="CONTENTS">${dto.CONTENTS }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<div align="right">
			<a href="#this" id="list"><font color = "white">목록으로</font></a>
			<a href="#this" id="update"><font color = "white">저장하기</font></a>
			<a href="${path}/sample/deleteBoard.do?IDX=${dto.IDX}" id="delete"><font color = "white">삭제하기</font></a>
		</div>	
		</div>
	</form>
	</div>
	<video autoplay loop muted playsinline src="/images/Stars19642.mp4"></video>
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#list").on("click", function(e){ //목록으로 버튼
			e.preventDefault(); 
			fn_openBoardList(); 
		}); 
		
		$("#update").on("click", function(e){ // 목록으로
			document.form1.action = "${path}/sample/updateBoard.do";
	        document.form1.submit();
		});
		
		$("#delete").click(function(){
            // 확인 대화상자 
            if(confirm("삭제하시겠습니까?")){
                document.form1.action = "${path}/sample/deleteBoard.do";
                document.form1.submit();
            }
		}); 
	});
	
	function fn_openBoardList(){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/sample/board.do' />"); 
		comSubmit.submit(); 
	} 
	
	
	</script>
</body>
</html>

