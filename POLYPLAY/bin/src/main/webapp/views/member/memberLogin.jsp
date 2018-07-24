<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

$.check = function(){
	// idCheck 버튼을 눌렀을 때
	 $("#login").click(function(){
		if($("#mId").val() == ""){
			alert("아이디를 입력하시지 않으셨습니다.");
			$("#mId").focus();
			return;
		} else if($("#mPassword").val() == ""){
			alert("비밀번호를 입력하시지 않으셨습니다.");
			$("#mPassword").focus();
			return;
		}
	});
	
	var res; 
	res = confirm("가입하시겠습니까?");
	var su  = document.frm;
  
  	if (res == true) {
  		alert("확인");
  		su.method ="post";
  		su.action ="${pageContext.request.contextPath}/MemberLoginAction";
  		su.submit();
	}
  	
  	return;
}; 
</script>
</head>
<body>
	<form name="frm">
	
			<label>id</label><br>
			<input type="text" id="mId" name="mId"><br>
			<label>password</label><br>
			<input type="password" id="mPassword" name="mPassword"><br>
			<!-- <input type="checkbox" name="useCookie" id="useCookie" /><br> -->
			<input type="button" value="Login" id="login" onclick="$.check();"><br>
			<a href="/MemberIdFind">아이디 찾기</a> <br>
			<a href="/MemberPwFind">비밀번호 찾기</a><br>
			<a href="/MemberJoin">회원 가입</a><br>
		
	
	</form>
</body>
</html>