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
                            <div class="card-header">Modify</div> <!-- 210315 유저 상세 보기 화면 타이틀 Register->Modify로 수정 -->
                            <div class="card-body">

                                <form name="form1" class="form-horizontal" method="post" action="${path}/member/insert.do">

                                    <div class="form-group">
                                        <label for="userName" class="cols-sm-2 control-label">Your Name</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="userName" id="userName" value="${dto.userName}" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="userEmail" class="cols-sm-2 control-label">Your Email</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="userEmail" id="userEmail" value="${dto.userEmail}" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="userId" class="cols-sm-2 control-label">UserId</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="userId" id="userId" value="${dto.userId}" readonly="readonly" />
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
                                    <div class="form-group">
                                        <label for="Auth" class="cols-sm-2 control-label">Authority</label> <!-- 210315 유저 상세 보기 화면에서 권한 부여할 수 있도록 개선 -->
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="confirm" id="confirm" placeholder="Confirm your Password" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <button type="submit" id="modify" class="btn btn-primary btn-lg btn-block login-button">Modify</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$("#modify").on("click", function(e){ // 목록으로
		document.form1.action = "${path}/member/update.do";
        document.form1.submit();
	});
});	
</script>