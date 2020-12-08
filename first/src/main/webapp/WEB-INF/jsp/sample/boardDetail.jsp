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
				<td colspan="4">${dto.CONTENTS }</td>
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
        //listReply2(); // ** json 리턴방식
        
        // ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
        /* $("#btnReply").click(function(){
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
        }); */
        
        
        
		// 1. 댓글 입력
        $("#btnReply").click(function(){
            //reply(); // 폼데이터 형식으로 입력
            replyJson(); // json 형식으로 입력
        });
        
        // 2. 댓글 목록
        //listReply("1"); // 댓글 목록 불러오기
        //listReply2(); // json 리턴방식
        listReplyRest(); // rest방식
        
        
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
	
	
	// 1_2. 댓글 입력 함수(json방식)
    function replyJson(){
        var replytext=$("#replytext").val();
        var IDX="${dto.IDX}"
        // 비밀댓글 체크여부
        var secretReply = "n";
        // 태그.is(":속성") 체크여부 true/false
        if( $("#secretReply").is(":checked") ){
            secretReply = "y";
        }
        $.ajax({                
            type: "post",
            url: "${path}/reply/insertRest.do",
            headers: {
                "Content-Type" : "application/json"
            },
            dateType: "text",
            // param형식보다 간편
            data: JSON.stringify({
                IDX : IDX,
                replytext : replytext,
                secretReply : secretReply
            }),
            success: function(){
                alert("댓글이 등록되었습니다.");
                // 댓글 입력 완료후 댓글 목록 불러오기 함수 호출
                //listReply("1");     // 전통적인 Controller방식
                //listReply2();     // json리턴 방식
                listReplyRest(); // Rest 방식
            }
        });
    }
	
	
	
	function listReply2(){
        $.ajax({
            type: "get",
            //contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
            url: "${path}/reply/listJson.do?IDX=${dto.IDX}",
            success: function(result){ // 인자 result에는 서버에서 리턴해준 배열이 들어감
         			// 배열이 들어온 이유는 dataType속성을 JSON으로 했기 때문에 리턴되는 데이터가 텍스트더라도 내부적으로 그 데이터를                                     
         			// JSON으로 해석하여 배열로 변환
                    // 그래서 배열에 있는 result값을 체크하면 result가 true라면 성공 이벤트 관련 로직을 출력한다.
                    // 서버와의 통신이 성공하면 호출되는 이벤트 핸들러인 function(result)
                    // result 인자에는 서버가 리턴해주는 데이터가 들어감
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
    
    
 // 2_3. 댓글 목록 - Rest방식
    function listReplyRest(){
        $.ajax({
            type: "get",
            url: "${path}/reply/list/${dto.IDX}.do",
            success: function(result){
            // responseText가 result에 저장됨.
                $("#listReply").html(result);
            }
        });
    }    
    
    
    
 // **댓글 수정화면 생성 함수
    function showReplyModify(replyidx){
        $.ajax({
            type: "get",
            url: "${path}/reply/detail/"+replyidx+".do",
            success: function(result){
                $("#modifyReply").html(result);
                // 태그.css("속성", "값")
                $("#modifyReply").css("visibility", "visible");
            }
        })
 }
	
	</script>
</body>
</html>

