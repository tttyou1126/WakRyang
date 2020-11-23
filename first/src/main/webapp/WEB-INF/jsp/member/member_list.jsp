<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!------ Include the above in your HEAD tag ---------->
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
    
body {
	margin : 0;
	padding : 0;
}
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

.table>thead>tr>th {
	text-align: center;
	color: black;
	background-color: white;
}


.table-hover>tbody>tr:hover {
	background-color: #ffffff;
}

.table>tbody>tr>td {
	text-align: left;
	color: black;
	background-color: white;
}

.table>tbody>tr>#title {
	text-align: left;
}    
 </style>

<body>
<%@ include file="/WEB-INF/jsp/home/homeMenu.jsp"%>
 		
 		
			<div id="banner">
				<div class="inner">

<form name="form1"  method="post">
<div id="container"  >
    <table class="table table-striped table-bordered table-hover">
        <tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>회원가입일자</th>
			<th>수정일자</th>
			<th>수정/삭제</th>
		</tr>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.userId}</td>
				<td>${row.userName}</td>
				<td>${row.userEmail}</td>
				<td>${row.userRegdate}</td>
				<td>${row.userUpdatedate}</td>
				<td>
					<a href="${path}/member/view.do?userId=${row.userId}" name="modify"><i class="icon-pencil"></i></a>
              		<a href="${path}/member/delete.do?userId=${row.userId}" id="delete" role="button" data-toggle="modal"><i class="icon-remove"></i></a>
                </td>
			</tr>
		</c:forEach>
    </table>
</div>
</form>


					</div>
				<video autoplay loop muted playsinline src="/images/banner.mp4"></video>
			</div> 
			</body>


<script>
    $(document).ready(function(){
        $("#delete").click(function(){
            // 확인 대화상자 
            if(confirm("삭제하시겠습니까?")){
                document.form1.action = "${path}/member/delete.do";
                document.form1.submit();
            }
        });
    });
</script>
	