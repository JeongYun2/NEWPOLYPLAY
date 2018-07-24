<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

var nickCk = false;		//nickname 체크여부 확인 (중복일 경우 = false , 중복이 아닐경우 = true)

$(function() {
	// 닉네임 중복 체크
	$.nickCheck();
});

$.nickCheck = function(){
	
	// nickCheck 버튼을 눌렀을 때
	$("#nickCheck").click(function() {
		
		var userNick = $("#mNickname").val();
		alert(userNick);
		
		
			$.ajax({
				type : 'POST',
				async: true,
				/* url : "${pageContext.request.contextPath}/MemberNickCheck/"+userNick, */
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
		                
		                nickCk = false;
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
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/MemberModifyAction" method="post">
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
			<td><input type="text" id="mEmail" name="mEmail" value="${mvo.getmEmail() }" readonly></td>
			<td><input type="text" id="mPhone" name="mPhone" value="${mvo.getmPhone() }"></td>	
		</tr>
	</table>
	<input type="submit" value="수정">
	</form>
</body>
</html>