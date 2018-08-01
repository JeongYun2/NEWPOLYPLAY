<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<!-- Bootstrapk CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Bootstrapk JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    

<script type="text/javascript">

$.check = function(){
	 
	
	if($("#mId").val() == ""){
		alert("아이디를 입력하시지 않으셨습니다.");
		$("#mId").focus();
		return;
	} else if($("#mPassword").val() == ""){
		alert("비밀번호를 입력하시지 않으셨습니다.");
		$("#mPassword").focus();
		return;
	}
	
	var res; 
	res = confirm("로그인하시겠습니까?");
  
  	if (res == true) {
  		$('#loginForm').attr('method', 'post');
        $('#loginForm').attr('action', '${pageContext.request.contextPath}/MemberLoginAction');
        $('#loginForm').submit();
	}
  	
	
  	return;
}
</script>

    <style>
        body{
	margin:0;
	color:#6a6f8c;
	background:#c8c8c8;
	font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
	width:100%;
	margin:auto;
	max-width:525px;
	min-height:670px;
	position:relative;
	background:url(https://raw.githubusercontent.com/khadkamhn/day-01-login-form/master/img/bg.jpg) no-repeat center;
	box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
	width:100%;
	height:100%;
	position:absolute;
	padding:90px 70px 50px 70px;
	background:rgba(40,57,101,.9);
}
.login-html .sign-in-htm,
.login-html .sign-up-htm{
	top:0;
	left:0;
	right:0;
	bottom:0;
	position:absolute;
	transform:rotateY(180deg);
	backface-visibility:hidden;
	transition:all .4s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
	display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
	text-transform:uppercase;
}
.login-html .tab{
	font-size:22px;
	margin-right:15px;
	padding-bottom:5px;
	margin:0 15px 10px 0;
	display:inline-block;
	border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
	color:#fff;
	border-color:#1161ee;
}
.login-form{
	min-height:345px;
	position:relative;
	perspective:1000px;
	transform-style:preserve-3d;
}
.login-form .group{
	margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
	width:100%;
	color:#fff;
	display:block;
}
.login-form .group .input,
.login-form .group .button{
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
}
.login-form .group input[data-type="password"]{
	text-security:circle;
	-webkit-text-security:circle;
}
.login-form .group .label{
	color:#aaa;
	font-size:12px;
}
.login-form .group .button{
	background:#1161ee;
}
.login-form .group label .icon{
	width:15px;
	height:15px;
	border-radius:2px;
	position:relative;
	display:inline-block;
	background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
	content:'';
	width:10px;
	height:2px;
	background:#fff;
	position:absolute;
	transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
	left:3px;
	width:5px;
	bottom:6px;
	transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
	top:6px;
	right:0;
	transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
	color:#fff;
}
.login-form .group .check:checked + label .icon{
	background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
	transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
	transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
	transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
	transform:rotate(0);
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
}
    </style>
    
<script type="text/javascript">

$.check = function(){
	
	if($("#mId").val() == ""){
		alert("아이디를 입력하시지 않으셨습니다.");
		$("#mId").focus();
		return;
	} else if($("#mPassword").val() == ""){
		alert("비밀번호를 입력하시지 않으셨습니다.");
		$("#mPassword").focus();
		return;
	}
	
	
  		$('#loginForm').attr('method', 'post');
        $('#loginForm').attr('action', '${pageContext.request.contextPath}/MemberLoginAction');
        $('#loginForm').submit();
  	
  	return;
}; 
</script>
    
</head>
<body>
    <div class="login-wrap">
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
            <div class="login-form">
            <form id="loginForm">
                <div class="sign-in-htm">
                    <div class="group">
                        <label for="user" class="label">아이디</label>
                        <input id="mId" name="mId" placeholder="아이디" class="input">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">비밀번호</label>
                        <input id="mPassword" name="mPassword" placeholder="비밀번호" type="password" class="input" data-type="password">
                    </div>
                    <!-- <div class="group">
                        <input name="useCookie" id="useCookie" type="checkbox" class="check">
                        <label for="check"><span class="icon"></span> 자동 로그인</label>
                    </div> -->
                    <div class="group">
                        <input type="button" id="login" class="button" value="로그인" onclick="$.check();">
                    </div>
                    <div class="hr"></div>
                    
                    <div class="foot-lnk">
                        <a href="${pageContext.request.contextPath}/MemberIdFind">아이디 찾기</a>
                    </div>
                    <div class="foot-lnk">
                        <a href="${pageContext.request.contextPath}/MemberPwFind">비밀번호 찾기</a>
                    </div>
                    <div class="foot-lnk">
                        <a href="${pageContext.request.contextPath}/MemberJoin">회원 가입</a>
                    </div>
                </div>
            </form>
            </div>
        </div>
    </div>
</body>
</html>