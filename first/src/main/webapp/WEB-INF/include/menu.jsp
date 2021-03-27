<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<a href="#this" class="btn1" id="main">메인</a>
<a href="#this" class="btn1" id="list">게시판</a>
<c:choose>
	<c:when test="${sessionScope.userId == null}">
		<a href="#this" class="btn1" id="login">로그인</a>
	</c:when>
	<c:otherwise>
        ${sessionScope.userName}님이 로그인중입니다.
        <a href="${path}/member/logout.do">로그아웃</a>
	</c:otherwise>
</c:choose>

<a href="#this" class="btn1" id="member">회원관리</a>



<hr>

<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript"> 
	$(document).ready(function(){
		$("#list").on("click", function(e){ //목록으로 버튼 
			e.preventDefault(); 
			fn_openBoardList(); 
		}); 
		
		$("#login").on("click", function(e){  
			e.preventDefault(); 
			fn_login(); 
		}); 
		
		$("#member").on("click", function(e){ 
			e.preventDefault(); 
			fn_member(); 
		}); 
		
		$("#main").on("click", function(e){ 
			e.preventDefault(); 
			fn_main(); 
		}); 
	}); 
	function fn_openBoardList(){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />"); 
		comSubmit.submit(); 
	} 
	
	function fn_login(){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/sample/login.do' />"); 
		comSubmit.submit(); 
	} 
	
	function fn_member(){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/member/list.do' />"); 
		comSubmit.submit(); 
	} 
	function fn_main(){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/sample/main.do' />"); 
		comSubmit.submit(); 
	} 
	</script>


