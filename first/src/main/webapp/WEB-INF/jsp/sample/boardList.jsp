<%@ page pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
               <!-- Bootstrap -->
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
#writeDisable {
	text-align: right;
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
	text-align: center;
	color: black;
	background-color: white;
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

/* 네이버 검색창 css*/
.green_window0 {
	display: inline-block;
	width: 126px;
	border: 2px solid #2db400;
}
.green_window {
	display: inline-block;
	width: 366px;
	border: 3px solid #2db400;
}
.input_text {
	width: calc( 100% - 14px );
	margin: 6px 7px;
	border: 0;
	font-weight: bold;
	font-size: 16px;
	outline: none;
}
.sch_smit {
	width: 54px; height: 40px;
	margin: 0; border: 0;
	vertical-align: top;
	background: #22B600;
	color: white;
	font-weight: bold;
	border-radius: 1px;
	cursor: pointer;
}
.sch_smit:hover {
	background: #56C82C;
}



</style>
</head>

<body>
<%@ include file="/WEB-INF/jsp/home/homeMenu.jsp"%>
 		
 		
			<div id="banner">
				<div class="inner">

		
 		
<form name="form1" method="post" action="${path}/sample/board.do">		
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
			<b><span style="background-color:#000000"><font color="WHITE" style="font-weight:bolder"> 게시판 (전체 글: ${count})</font></span></b>
		</div>
		
		
		<span class='green_window0'>
	    <select name="searchOption">
            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option value="all" <c:out value="${searchOption == 'all'?'selected':''}"/> >제목+ID+내용</option>
            <option value="CREA_ID" <c:out value="${searchOption == 'CREA_ID'?'selected':''}"/> >ID</option>
            <option value="CONTENTS" <c:out value="${searchOption == 'CONTENTS'?'selected':''}"/> >내용</option>
            <option value="TITLE" <c:out value="${searchOption == 'TITLE'?'selected':''}"/> >제목</option>
        </select>
        </span>
        <span class='green_window'>
        <input type='text' class='input_text' name="keyword" value=${keyword}>	
        </span>
		
		<button type="submit" class='sch_smit' name="test"> 조회 </button>

<c:choose>
	<c:when test="${sessionScope.userId == null}">
		<div id="writeDisable"><a href="javascript:writeDisable()"><span style="background-color:#000000"><font color="WHITE" style="font-weight:bolder">글쓰기</font></span></a></div>
	</c:when>
	<c:otherwise>
		<div id="write"> <a href="#this"  id="write"> <span style="background-color:#000000"><font color="WHITE" style="font-weight:bolder">글쓰기</font></span> </a></div>
	</c:otherwise>
</c:choose>		


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

							<td>${row.IDX}</td>
							<td id="title" class="title">
								<a href="${path}/sample/viewBoard.do?IDX=${row.IDX}&curPage=${boardPager.curPage}&searchOption=${searchOption}&keyword=${keyword}" name="title">${row.TITLE}</a>
								<c:if test="${row.recnt > 0}">
				                    <span style="color: red;">(${row.recnt})
				                    </span>
			                    </c:if>
								
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
			<tr>
            <td colspan="5">
                <!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
                <c:if test="${boardPager.curBlock > 1}">
                    <a href="javascript:list('1')">[처음]</a>
                </c:if>
                
                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${boardPager.curBlock > 1}">
                    <a href="javascript:list('${boardPager.prevPage}')">[이전]</a>
                </c:if>
                
                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
                <c:forEach var="num" begin="${boardPager.blockBegin}" end="${boardPager.blockEnd}">
                    <!-- **현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == boardPager.curPage}">
                            <span style="color: red">${num}</span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${boardPager.curBlock <= boardPager.totBlock}">
                    <a href="javascript:list('${boardPager.nextPage}')">[다음]</a>
                </c:if>
                
                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
                <c:if test="${boardPager.curPage <= boardPager.totPage}">
                    <a href="javascript:list('${boardPager.totPage}')">[끝]</a>
                </c:if>
            </td>
        </tr>		
					
					
				
						</tbody>
			</table>
			<!-- Paging 처리 -->
			<div id="paging"><font color="white"> ${pageCode}</font></div>
			
				<br />
</div>
</div>
	</form>
					</div>
				<video autoplay loop muted playsinline src="/images/Stars19642.mp4"></video>
			</div> 

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#write").on("click", function(e){ 
				e.preventDefault();
				fn_openBoardWrite();
			});
			
			
		});
		
			function fn_openBoardWrite(){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value = '/sample/writeScreen.do' />");
				comSubmit.submit();
			}
			
			function list(page){
		        location.href="${path}/sample/board.do?curPage="+page+"&searchOption-${searchOption}"+"&keyword=${keyword}";
		    }
			function writeDisable(){
		        alert("로그인 해주세요.");
		    }
			

	</script>
		
	

	</body>