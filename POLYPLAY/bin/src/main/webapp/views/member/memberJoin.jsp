<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>memberJoin</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

var idCk = false;			//ID 체크여부 확인 (중복일 경우 = false , 중복이 아닐경우 = true)
var nickCk = false;		//nickname 체크여부 확인 (중복일 경우 = false , 중복이 아닐경우 = true)

$(function() {
	$.idCheck();
	$.nickCheck();
});

$.idCheck = function(){
	
	// idCheck 버튼을 눌렀을 때
	$("#idCheck").click(function() {
		
		var userID = $("#mId").val();
		alert(userID);
		
		$.ajax({
			type : "POST",
			async: true,
			url : "${pageContext.request.contextPath}/MemberIdCheck",
			data: userID,
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success : function(data) {
				alert("ajax return: "+data);
				if(data > 0) {

	            	alert("중복된 아이디입니다. 다른 아이디를 입력해주세요.");
	              	// 성공(파랑)에서 실패(빨강)로 변경
	              	$("#divId").removeClass("has-success");
	                $("#divId").addClass("has-error");
	                $("#mId").focus();
	                
	            } else {				
	            	
	                alert("사용 가능한 아이디입니다.");
	             	// 실패(빨강)에서 성공(파랑)로 변경
					$("#divId").removeClass("has-error");
	                $("#divId").addClass("has-success");
	                 
	                idCk = true;
	            }
			},
			error : function(error) {
				alert("error : " + error);
			}
		});
	});
}

$.nickCheck = function(){
	
	// nickCheck 버튼을 눌렀을 때
	$("#nickCheck").click(function() {
		
		var userNick = $("#mNickname").val();
		alert(userNick);
		
		
			$.ajax({
				type : "POST",
				async: true,
				url : "${pageContext.request.contextPath}/MemberNickCheck",
				data : userNick,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					alert("ajax return: "+data);
					if(data > 0) {
						
						alert("중복된 닉네임입니다. 다른 닉네임를 입력해주세요.");
						// 성공(파랑)에서 실패(빨강)로 변경
		              	$("#divNick").removeClass("has-success");
		                $("#divNick").addClass("has-error");
		                $("#mNick").focus();
		                
		            } else {				
		            	
		                alert("사용 가능한 닉네임입니다.");
		             	// 실패(빨강)에서 성공(파랑)로 변경
						$("#divNick").removeClass("has-error");
		                $("#divNick").addClass("has-success");
		                 
		                nickCk = true;
		            }
				},
				error : function(error) {
					alert("error : " + error);
				}
			});
		
	});
}

$.check = function(){
	
	
	 $("#join").click(function(){
		 
		if($("#mId").val() == ""){
			alert("아이디를 입력하시지 않으셨습니다.");
			return;
		} else if($("#mPassword").val() == ""){
			alert("비밀번호를 입력하시지 않으셨습니다.");
			return;
		} else if($("#mPasswordConfirm").val() == ""){
			alert("비밀번호 확인을 입력하시지 않으셨습니다.");
			return;
		} else if($("#mPassword").val() != $("#mPasswordConfirm").val()){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		} else if($("#mPhone").val() == ""){
			alert("전화번호를 입력하시지 않으셨습니다.");
			return;
		} else if($("#mName").val() == ""){
			alert("이름을 입력하시지 않으셨습니다.");
			return;
		} else if($("#mNickname").val() == ""){
			alert("닉네임을 입력하시지 않으셨습니다.");
			return;
		}
	
	
		var res; 
		res = confirm("가입하시겠습니까?");
		var su  = document.frm;
	  
	  	if (res == true) {
	  		alert("확인");
	  		su.method ="post";
	  		su.action ="${pageContext.request.contextPath}/MemberJoinAction";
	  		su.submit();
		}
	  	
	  	return;
	});
  	
  	return;
}
</script>
</head>
<body>
	<h1>회원가입</h1>
	<form>
	<div>
		<div class="form-group" >
			<label class="control-label">아이디</label>
			<div class="form-inline" id="divId">
				<input type="text" class="form-control" id="mId" name="mId">
				<input type="button" class="btn btn-primary btn-sm" id="idCheck" name="idCheck" value="아이디 중복체크">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label">비밀번호</label>
			<input type="text" class="form-control" id="mPassword" name="mPassword">
		</div>
		<div class="form-group">
			<label class="control-label">비밀번호 확인</label>
			<input type="text" class="form-control" id="mPasswordConfirm" name="mPasswordConfirm">
		</div>
		<div class="form-group">
			<label class="control-label">이메일</label>
			<input type="text" class="form-control" id="mEmail" name="mEmail">
			
		</div>
		<div class="form-group">
			<label class="control-label">전화번호</label>
			<input type="text" class="form-control" id="mPhone" name="mPhone">
		</div>
		<div class="form-group">
			<label class="control-label">이름</label>
			<input type="text" class="form-control" id="mName" name="mName">
		</div>
		<div class="form-group">
			<label class="control-label">닉네임</label>
			<div class="form-inline">
				<input type="text" class="form-control" id="mNickname" name="mNickname">
				<input type="button" class="btn btn-primary btn-sm" id="nickCheck" name="nickCheck" value="닉네임 중복체크">
			</div>
		</div>
	</div>
	<div>
		<input class="btn btn-primary btn-sm" type="button" id="join" value="가입" onclick="$.check();">
	</div>
	</form>
</body>
</html>