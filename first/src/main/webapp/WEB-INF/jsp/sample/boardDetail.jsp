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
    position: fixed;
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
<form name="form1" method="post">
<font color ="white"><caption>게시글 상세</caption>
	<table class="table table-striped table-bordered table-hover">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		
		<tbody>
			<tr>
				<th scope="row">글 제목</th>
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
				
				<td colspan="4"><div align="left">${dto.CONTENTS }</div></td>
				
			</tr>
			<!-- 210503 첨부파일 보여주기 -->
			<tr>
				<th scope="row">첨부파일</th>
				<td colspan="3">
				<div align="left">
				
					<c:forEach var="row" items="${file }">
					<input type="hidden" name="fullname" id="fullname" value="${row.fullname }"> 
					<a href="#this" class="file" value="${row.fullname }">${row.originalname }</a> <!-- id는 유니크 값이어야 하므로 class값으로 해야됨 -->
					(${row.filesize }kb)
					</c:forEach>
				</div>	
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	


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




	<div align="left">
        <br>
        <!-- **로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
        <c:if test="${sessionScope.userId != null}">  
        comments
        <br>  
        <textarea rows="3" cols="70" id="replytext" placeholder="댓글을 작성해주세요"></textarea>
        <br>
        <!-- **비밀댓글 체크박스 -->
        <input type="checkbox" id="secretReply">비밀 댓글
        <button type="button" class="btn" id="btnReply">댓글 작성</button>
        <br>
        </c:if>
        
    <!-- **댓글 목록 출력할 위치 -->
    <br>
    <div id="listReply"></div>	
    <br> <br>  <br>  <br>
    <div align="center">
    <a href="#top"><font color="white", size="5"> TOP </font></a>
    </div>
	</div>
</font>	
	

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
		
		
		//listReply(); // **댓글 목록 불러오기
        listReply2(); // ** json 리턴방식
        
        // ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
        $("#btnReply").click(function(){
            var replytext=$("#replytext").val();
            var idx="${dto.IDX}"
            // ** 비밀댓글 체크여부
            var secretReply = "n";
            // 태그.is(":속성") 체크여부 true/false
            if( $("#secretReply").is(":checked") ){
                secretReply = "y";
            }            
            var param="replytext="+replytext+"&IDX="+idx+"&secretReply="+secretReply;
            $.ajax({                
                type: "post",
                url: "${path}/reply/insert.do",
                data: param,
                datatype: 'json',
                success: function(data){ // reply/insert 컨트롤러에 @ResponseBody 붙여줘야 404 에러로 안탐
                    alert("댓글이 등록되었습니다.");
                    listReply2();
                },
                error:function(request,status,error){
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                   }
            });
        });
        
        $(".file").on("click", function(e){ // 210503 파일 다운로드
        	e.preventDefault(); 
        	fn_downloadFile($(this).attr('value')); 
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
	
	function listReply2(){
        $.ajax({
            type: "get",
            //contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
            url: "${path}/reply/listJson.do?IDX=${dto.IDX}",
            success: function(result){
                console.log(result);
                var output = "<table>";
                for(var i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].userName;
                    output += "("+changeDate(result[i].regdate)+")<br>";
                    output += result[i].replytext;
                    output += "<hr width = 300, color='white' align='left'>";
                    output += "</td>"
                    
                    output += "<tr>";
                }
                output += "</table>";
                $("#listReply").html(output);
            }
        });
        $("#replytext").val('');
    }
    // **날짜 변환 함수 작성
    function changeDate(date){
        date = new Date(parseInt(date));
        year = date.getFullYear();
        month = date.getMonth();
        day = date.getDate();
        hour = date.getHours();
        minute = date.getMinutes();
        second = date.getSeconds();
        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
        return strDate;
    }
    
    function fn_downloadFile(fullname1){ // 210504 파일 다운로드 
    	var fullname = fullname1;
    	var comSubmit = new ComSubmit(); 
    	comSubmit.empty(); // addparam할 시 뒤에 파일명 덧붙여지므로 초기화 필요
    	comSubmit.setUrl("<c:url value='/sample/downloadFile.do' />"); 
    	comSubmit.addParam("fullname", fullname); 
    	comSubmit.submit(); 
    }
	
	</script>
</body>
</html>

