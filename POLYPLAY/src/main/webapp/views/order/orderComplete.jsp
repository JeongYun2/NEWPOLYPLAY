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

<script type="text/javascript">
function goMain(){
	
//	alert("작동합니까?");
	var formname = document.frm;

		formname.method = "post";
		formname.action = "<%=request.getContextPath()%>/MainList";
		formname.submit();
	
	return;		
}


function goMyOrder(){
	

	var formname = document.frm;
		
		formname.method = "post";
		formname.action = "<%=request.getContextPath()%>/MyOrderList";
		formname.submit();

	return;	
}
</script>
	
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

<form name="frm">

<c:choose>
	<c:when test="${sMemberMidx != null}">
		<c:set var="midx" value="${sMemberMidx}" />
	</c:when>
	
	<c:otherwise>
		<c:set var="midx" value="0" />
	</c:otherwise>

</c:choose>



<input type="hidden" id="midx" name="midx" value="${sMemberMidx}"/>

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
	
<button type="button"  class="btn btn-primary" id="pay" name="pay" onclick="goMain();">메인페이지가기</button>
<button type="button"  class="btn btn-primary" id="pay" name="pay" onclick="goMyOrder();">나의주문내역확인</button>



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