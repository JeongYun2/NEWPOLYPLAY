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

<input type="hidden" id="midx" name="midx" value="${sMemberMidx}"/>

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
			
			<c:choose>
				<c:when test="${opvo.pMethod eq 'B'}">
					<c:set var="pMethod" value="무통장입금" />
				</c:when>
				
				<c:otherwise>
					<c:set var="pMethod" value="카드결제" />
				</c:otherwise>
			</c:choose>
			<td><c:out value="${pMethod}"/></td>
			
			<td>${opvo.pPrice}</td>
			
			<c:choose>
				<c:when test="${opvo.pStatus eq 'N'}">
					<c:set var="pStatus" value="입금대기중" />
				</c:when>
				
				<c:when test="${opvo.pStatus eq 'Y'}">
					<c:set var="pStatus" value="결제완료" />
				</c:when>
			</c:choose>
			<td><c:out value="${pStatus}"/></td>
			
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