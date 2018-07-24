<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/include/header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h1>MY 주문내역</h1>
 o.oid, p.pMethod, p.pPrice, p.pStatus, o.oWriteday 
<form name="frm">
<table border="1" width="80%" style="text-align: center;">
		<!-- 속성 이름 -->
		<tr>
			<th>주문번호</th>
			<th>결제방법</th>
			<th>결제금액</th>
			<th>결제상태</th>
			<th>주문날짜</th>
		</tr>
		
		<c:forEach var="opvo" items="${myOrderList}" varStatus ="status">
		<!-- 속성 값 -->
		<tr>
			<td>${opvo.oid}</td>
			<td>${opvo.pMethod}</td>
			<td>${opvo.pPrice}</td>
			<td>${opvo.pStatus}</td>
			<td>${opvo.oWriteday}</td>
		</tr>

		</c:forEach>
	</table>
	
	<br>

	<br>



</form>




</body>
</html>

<%@ include file="/include/footer.jsp" %> 