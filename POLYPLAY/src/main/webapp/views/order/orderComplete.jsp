<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.polyplay.pp.domain.OrderPayVo" %>

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
<h1>주문결제완료페이지</h1>

<c:choose>
	<c:when test="${sMemberMidx != null}">
		<c:set var="midx" value="${sMemberMidx}" />
	</c:when>
	
	<c:otherwise>
		<c:set var="midx" value="0" />
	</c:otherwise>

</c:choose>

<form name="frm">

<input type="text" id="midx" name="midx" value="${sMemberMidx}"/>

<table class="table table-striped table-bordered table-hover" style="text-align: center;">
		<!-- 속성 이름 -->
		<tr>
			<th>cidx</th>
			<th>썸네일</th>
			<th>제목</th>
			<th>금액</th>
			<th>주문일</th>
			<th>결제방법</th>
			<th>입금자명</th>
			<th>결제금액</th>
	
		</tr>
		
		<c:forEach var="oclvo" items="${orderCompleteList}" varStatus ="status">
		<!-- 속성 값 -->
		<tr>
			<td>${oclvo.cidx} ${status.count}</td>
			<td>${oclvo.cImage}</td>
			<td>${oclvo.cSubject}</td>
			<td>${oclvo.oPrice}</td>
			<td>${oclvo.oWriteday}</td>
			<td>${oclvo.pMethod}</td>
			<td>${oclvo.pDepositor}</td>
			<td>${oclvo.pPrice}</td>
		</tr>

		</c:forEach>
	</table>
	
	<br>

	<br>
	
<a href="<%=request.getContextPath() %>/GoToHome?midx=${sMemberMidx}">메인페이지가기</a>
<br>
<a href="<%=request.getContextPath() %>/MyOrderList?midx=${sMemberMidx}">나의주문내역확인</a>



</form>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</div>
</body>
</html>

<%@ include file="/include/footer.jsp" %> 