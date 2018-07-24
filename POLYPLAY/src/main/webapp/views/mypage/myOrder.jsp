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
<div class="container">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h1>MY 주문내역</h1>
<c:choose>
	<c:when test="${sMemberMidx != null}">
		<c:set var="midx" value="${sMemberMidx}" />
	</c:when>
	
	<c:otherwise>
		<c:set var="midx" value="0" />
	</c:otherwise>

</c:choose>

<input type="text" id="midx" name="midx" value="${sMemberMidx}"/>

<form name="frm">
<table class="table table-striped table-bordered table-hover" style="text-align: center;">
		<!-- 속성 이름 -->
		<tr>
			<td>주문번호</td>
			<td>결제방법</td>
			<td>결제금액</td>
			<td>결제상태</td>
			<td>주문날짜</td>
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



</div>
</body>
</html>

<%@ include file="/include/footer.jsp" %> 