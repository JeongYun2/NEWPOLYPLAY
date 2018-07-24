<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>idFined</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
</head>
<body>
	<h1>아이디 찾기</h1>
	<form action="${pageContext.request.contextPath}/MemberIdFindAction" method="post">
	<div>
		<div class="form-group" >
			<label class="control-label">이름</label>			
			<input type="text" class="form-control" id="mName" name="mName">	
		</div>
		<div class="form-group" >
			<label class="control-label">이메일</label>
			<input type="text" class="form-control" id="mEmail" name="mEmail">
		</div>
		<input type="submit" value="아이디 찾기">
	</div>
	</form>
	<div id="idFined"></div>
</body>
</html>