<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<%@ include file="/WEB-INF/jsp/home/homeMenu.jsp"%>
<div id="banner">
				<div class="inner">
<form id="frm" method="post" enctype="multipart/form-data">
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
				<tr>
					<td colspan="2" style="text-align: left;">
				        <input type="file" name="file"> 
					</th>
				</tr>				
			</tbody>
		</table>
		<div align="right">
		<a href="#this"  id="write"><font color = "white">작성하기</font></a> 
		<a href="#this"  id="list"><font color = "white">목록으로</font></a>
	
		</div>
	</div>
	</form>
	
	
	
    	
    	

    	
	
	</div>
	<video autoplay loop muted playsinline src="/images/Stars19642.mp4"></video>
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
		
		
		
		
		
		
		
		$(".fileDrop").on("drop", function(event) {
		    event.preventDefault(); 
		    var files = event.originalEvent.dataTransfer.files;
		    var file = files[0];
		    console.log(file);
		    var formData = new FormData();
		    formData.append("file", file);

		    $.ajax({
		        type: "post",
		        url: "${path}/upload/uploadAjax",
		        data: formData,
		        dataType: "text",
		        processData: false,
		        contentType: false,
		        // 업로드 성공하면
		        success: function(data) {
		            var str = "";
		            // 이미지 파일이면 썸네일 이미지 출력
		            if(checkImageType(data)){ 
		                str = "<div><a href='${path}/upload/displayFile?fileName="+getImageLink(data)+"'>";
		                str += "<img src='${path}/upload/displayFile?fileName="+data+"'></a>";
		            // 일반파일이면 다운로드링크
		            } else { 
		                str = "<div><a href='${path}/upload/displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a>";
		            }
		            // 삭제 버튼
		            str += "<span data-src="+data+">[삭제]</span></div>";
		            $(".uploadedList").append(str);
		        }
		    });
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