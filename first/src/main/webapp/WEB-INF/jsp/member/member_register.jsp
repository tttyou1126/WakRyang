<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
<div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">Register</div>
                            <div class="card-body">

                                <form name="form1" class="form-horizontal" method="post" >

                                    <div class="form-group">
                                        <label for="userName" class="cols-sm-2 control-label">Your Name</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="userName" id="userName" placeholder="Enter your Name" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="userEmail" class="cols-sm-2 control-label">Your Email</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="userEmail" id="userEmail" placeholder="Enter your Email" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="userId" class="cols-sm-2 control-label">UserId</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="userId" id="userId" placeholder="Enter your UserId" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="userPw" class="cols-sm-2 control-label">Password</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="userPw" id="userPw" placeholder="Enter your Password" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="confirm" id="confirm" placeholder="Confirm your Password" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <button type="submit" class="btn btn-primary btn-lg btn-block login-button" id="register">Register</button>
                                    </div>
                                    <div class="login-register">
                                        <a href="${path}/main/loginScreen.do">Login</a>
                                    </div>
                                    <input type="hidden" id="checkId" value="">
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		$("#register").on("click", function(e){
			var userName = $("#userName").val();
			var userEmail = $("#userEmail").val();
			var emailregExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var userId = $("#userId").val();
			var pw = $("#userPw").val();
            var pwConfirm = $("#confirm").val();
            var checkId = $('#checkId').val();
            if(userName == ''){
                alert("이름을 입력해주세요.");
                $("#userName").focus(); // 입력포커스 이동
                return false; // 함수 종료
            }
            if(userEmail == ''){
                alert("이메일을 입력해주세요.");
                $("#userEmail").focus(); // 입력포커스 이동
                return false; // 함수 종료
            }
            if(userId == ''){
                alert("아이디를 입력해주세요.");
                $("#userId").focus(); // 입력포커스 이동
                return false; // 함수 종료
            }
            if(pw == ''){
                alert("비밀번호를 입력해주세요.");
                $("#pw").focus(); // 입력포커스 이동
                return false; // 함수 종료
            }
            if(pwConfirm == ''){
                alert("확인 비밀번호를 입력해주세요.");
                $("#pwConfirm").focus(); // 입력포커스 이동
                return false; // 함수 종료
            }
            if(pw.length < 8 || pw.length > 20){
            	alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
            	return false;
           	}else if(pw.search(/\s/) != -1){
            	alert("비밀번호는 공백 없이 입력해주세요.");
            	return false;
            }
            if(checkId=="NULL"){
            	alert("아이디를 입력해주세요.");
                  $('#id').val('');
                  $('#id').focus();
                  return false;
            }
            if(checkId=="NO"){
            	alert("중복된 아이디입니다.");
                  $('#id').val('');
                  $('#id').focus();
                  return false;
            }
            if(userEmail.match(emailregExp) == null){
            	alert("이메일이 형식에 맞지 않습니다.");
                  $('#userEmail').val('');
                  $('#userEmail').focus();
                  return false;
            }

            document.form1.action="${path}/member/insert.do"
            document.form1.submit();
            
		});
		
		//아이디 중복체크
	    $('#userId').blur(function(){
			var checkId = "";
	        $.ajax({
		     type:"POST",
		     url:"checkSignup.do",
		     async:false,
		     data:{
		            "id":$('#userId').val()
		     },
		     success:function(data){	//data : checkSignup에서 넘겨준 결과값
		    	 checkId = data;
		            if($.trim(data)=="YES"){
		             if($('#id').val()!=''){ 
		               	alert("사용가능한 아이디입니다.");
		               }
		           	}else if($.trim(data)=="NO"){
		               if($('#id').val()!=''){
		                  alert("중복된 아이디입니다.");
		                  $('#id').val('');
		                  $('#id').focus();
		               }
		            }else{
		            	alert("아이디를 입력해주세요.");
		                  $('#id').val('');
		                  $('#id').focus();
		            }
		         }
		    }) 
		    $('#checkId').val(checkId);
	     });
		
	});


	

</script>