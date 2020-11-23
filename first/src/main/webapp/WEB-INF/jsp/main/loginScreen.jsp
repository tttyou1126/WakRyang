<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>

	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="/image/png" href="/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/login_util.css">
	<link rel="stylesheet" type="text/css" href="/css/login_main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/images/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Account Login
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5" name="form1" method="post">

					<div class="wrap-input100 validate-input" data-validate = "Enter userId">
						<input class="input100" type="text" name="userId" placeholder="User Id">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="userPw" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>

					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn" id="btnLogin">
							로그인
						</button>	
						&nbsp;&nbsp;
						<button class="login100-form-btn" id="register">
							회원가입
						</button>
						<br/><br/><br/>
						<button class="login100-form-btn" id="main">
							메인으로
						</button>
						
					</div>
					<br/>
						<c:if test="${msg == 'logout'}">
							<div align="center" style="color: red">
								로그아웃되었습니다.
							</div>
					    </c:if>	
					    <c:if test="${msg == 'failure'}">
					         <div align="center" style="color: red">
					                        아이디 또는 비밀번호가 일치하지 않습니다.
					         </div>
					    </c:if>	
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/bootstrap/js/popper.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/daterangepicker/moment.min.js"></script>
	<script src="/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="/js/login_main.js"></script>
	
<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#register").on("click", function(e){
			e.preventDefault(); 
			fn_register(); 
		}); 
		$("#main").on("click", function(e){
			e.preventDefault(); 
			fn_main(); 
		});
		
		 $("#btnLogin").click(function(){
	            // 태크.val() : 태그에 입력된 값
	            // 태크.val("값") : 태그의 값을 변경 
	            var userId = $("#userId").val();
	            var userPw = $("#userPw").val();
	            if(userId == ""){
	                alert("아이디를 입력하세요.");
	                $("#userId").focus(); // 입력포커스 이동
	                return; // 함수 종료
	            }
	            if(userPw == ""){
	                alert("아이디를 입력하세요.");
	                $("#userPw").focus();
	                return;
	            }
	            // 폼 내부의 데이터를 전송할 주소
	            document.form1.action="${path}/member/loginCheck.do"
	            // 제출
	            document.form1.submit();
	        });
	});
	
	function fn_register(){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/member/register.do' />"); 
		comSubmit.submit(); 
	} 
	function fn_main(){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/home/sunhome.do' />"); 
		comSubmit.submit(); 
	} 
	</script>	
	
	
</body>
</html>

