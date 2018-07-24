<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<h1>비밀번호</h1>
	<form action="${pageContext.request.contextPath}/MemberPwFindAction" method="post">
	<div>
		<div class="form-group" >
			<label class="control-label">아이디</label>			
			<input type="text" class="form-control" id="mId" name="mId">	
		</div>
		<div class="form-group" >
			<label class="control-label">이메일</label>
			<input type="text" class="form-control" id="mEmail" name="mEmail">
		</div>
		<div class="form-group" >
			<label class="control-label">전화번호</label>
			<input type="text" class="form-control" id="mPhone" name="mPhone">
		</div>
		<input type="submit" value="비밀번호 찾기">
	</div>
	</form>
</body>
</html>