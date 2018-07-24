<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 수정</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    
<style type="text/css">
	.red {
		color: red;
	}
</style>
<script>

var nickCk = false;		//nickname 체크여부 확인 (중복일 경우 = false , 중복이 아닐경우 = true)

$(function(){ 
	$.nickCheck();
	$.check();
});

$.nickCheck = function(){
	
	// nickCheck 버튼을 눌렀을 때
	$("#nickCheck").click(function() {
		
		$.clearAll();
		
		var userNick = $("#mNickname").val();
		
			$.ajax({
				type : "POST",
				async: true,
				url : "${pageContext.request.contextPath}/MemberNickCheck",
				data : userNick,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					
					if(data > 0) {
						$("#nickText").html("중복된 닉네임입니다. 다른 닉네임를 입력해주세요.");
		                $("#mNickname").focus();
		                nickCk = false;
		            } else {
		            	$("#nickText").html("사용 가능한 닉네임입니다.");
		                nickCk = true;
		            }
				},
				error : function() {
					$("#nickText").html("오류가 일어났습니다.");
				}
			});
		
	});
}

$.check = function(){
		 
	$("#modi").click(function() {
	$.clearAll();
	
		if($("#mPassword").val() == ""){
			$("#passwordText").html("기존 비밀번호를 입력하시지 않으셨습니다.");
			$("#mPassword").focus();
			return;
		} else if($("#mNewPassword").val() == ""){
			$("#newPasswordText").html("새 비밀번호를 입력하시지 않으셨습니다.");
			$("#mNewPassword").focus();
			return;
		} else if($("#mNewPasswordConfirm").val() == ""){ 
			$("#newPasswordConfirmText").html("새 비밀번호 확인을 입력하시지 않으셨습니다.");
			$("#mNewPasswordConfirm").focus();
			return;
		} else if($("#mNewPassword").val() != $("#mNewPasswordConfirm").val()){
			$("#newPasswordText").html("새 비밀번호가 일치하지 않습니다.");
			$("#mNewPassword").focus();
			return;
		} else if($("#mNickname").val() == ""){
			$("#nickText").html("닉네임을 입력하시지 않으셨습니다.");
			$("#mNickname").focus();
			return;
		} else if($("#mEmail").val() == ""){
			$("#emailText").html("이메일을 입력하시지 않으셨습니다.");
			$("#mEmail").focus();
			return;
		} else if($("#mPhone").val() == ""){
			$("#phoneText").html("전화번호를 입력하시지 않으셨습니다.");
			$("#mPhone").focus();
			return;
		}
		
		var res; 
		res = confirm("수정 하시겠습니까?");
		
	  	if (res == true) {
	  		$('#modiForm').attr('method', 'post');
	        $('#modiForm').attr('action', '${pageContext.request.contextPath}/MemberModifyAction');
	        $('#modiForm').submit();
		}
	});
	  	
	  	return;
}

$.clearAll = function(){
	
	$("#passwordText").empty();
	$("#newPasswordText").empty();
	$("#newPasswordConfirmText").empty();
	$("#nickText").empty();
	$("#emailText").empty();
	$("#phoneText").empty();
	
	return;
}
</script>

</head>
<body>

<article class="container">
        <div class="page-header">
          <h1>회원수정</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form id="modiForm">
            <div class="form-group">
                <label for="username">아이디</label>
                <div class="input-group">
                  <input type="text" class="form-control" id="mId" name="mId" value="${mvo.getmId() }" readonly>
              </div>
            </div>
            <div id="idText" class="red"></div>
            
            <div class="form-group">
                <label for="username">기존 비밀번호</label>
                <input type="password" class="form-control" id="mPassword" name="mPassword" >
                <p class="help-block">6~12자리 영문 또는 숫자</p>
            </div>
            <div id="passwordText" class="red"></div>
            
            <div class="form-group">
                <label for="username">새 비밀번호</label>
                <input type="password" class="form-control" id="mNewPassword" name="mNewPassword" >
                <p class="help-block">6~12자리 영문 또는 숫자</p>
            </div>
            <div id="newPasswordText" class="red"></div>

            <div class="form-group">
                    <label for="username">새 비밀번호 확인</label>
                    <input type="password" class="form-control" id="mNewPasswordConfirm" name="mNewPasswordConfirm">
                    <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            <div id="newPasswordConfirmText" class="red"></div>

            <div class="form-group">
                    <label for="username">이름</label>
                    <input type="text" class="form-control" id="mName" name="mName" value="${mvo.getmName() }" readonly>
            </div>

            <div class="form-group">
                    <label for="username">닉네임</label>
                    <div class="input-group">
                      <input type="text" class="form-control" id="mNickname" name="mNickname" value="${mvo.getmNickname() }">
                      <span class="input-group-btn">
                      <input type="button" class="btn btn-success"  id="nickCheck" name="nickCheck" value="닉네임 중복체크">
                    </span>
                  </div><p class="help-block">6~12자리 영문 또는 숫자</p>
            </div>
            <div id="nickText" class="red"></div>

            <div class="form-group">
              <label for="InputEmail">이메일</label>
              <input type="email" class="form-control" id="mEmail" name="mEmail" value="${mvo.getmEmail() }">
              <p class="help-block">6~12자리 영문 또는 숫자</p>
            </div>
            <div id="emailText" class="red"></div>
            
            <div class="form-group">
              <label for="username">전화번호</label>
              <div class="input-group">
                <input type="tel" class="form-control" id="mPhone" name="mPhone" value="${mvo.getmPhone() }">
              </div>
            </div>
            <div id="phoneText" class="red"></div>

            
            <div class="form-group text-center">
              <input class="btn btn-info" type="button" id="modi" value="수정하기">
			  <input class="btn btn-warning" type="button" value="취소하기" onclick="location='${pageContext.request.contextPath}/MainList'">
            </div>
          </form>
        </div>
      </article>

<%-- 
	<form id="modiForm">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>기존 비밀번호</td>
			<td>새 비밀번호</td>
			<td>새 비밀번호 확인</td>
			<td>이름</td>
			<td>닉네임</td>
			<td>이메일</td>
			<td>전화번호</td>	
		</tr>
		<tr>
			<td><input type="text" id="mId" name="mId" value="${mvo.getmId() }" readonly></td>
			<td><input type="text" id="mPassword" name="mPassword"></td>
			<td><input type="text" id="mNewPassword" name="mNewPassword"></td>
			<td><input type="text" id="mNewPasswordConfirm" name="mNewPasswordConfirm"></td>
			<td><input type="text" id="mName" name="mName" value="${mvo.getmName() }" readonly></td>
			<td>
				<input type="text" id="mNickname" name="mNickname" value="${mvo.getmNickname() }">
				<input type="button" id="nickCheck" value="닉네임 중복 체크">
			</td>
			<td><input type="text" id="mEmail" name="mEmail" value="${mvo.getmEmail() }"></td>
			<td><input type="text" id="mPhone" name="mPhone" value="${mvo.getmPhone() }"></td>	
		</tr>
	</table>
	<input type="submit" value="수정">
	</form> --%>
</body>
</html>