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

<script type="text/javascript">

function payCheck() {
	
	
	var formname = document.frm;

	var res;
	res = confirm("결제를 진행하시겠습니까?");

	if (res == true) {
		
		formname.method = "post";
		formname.action = "<%=request.getContextPath()%>/OrderPayAction";
		formname.submit();
	}
	return;

}





</script>

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
<h1>주문결제페이지</h1>

<c:choose>
	<c:when test="${sMemberMidx != null}">
		<c:set var="midx" value="${sMemberMidx}" />
	</c:when>
	
	<c:otherwise>
		<c:set var="midx" value="0" />
	</c:otherwise>

</c:choose>


<form name="frm" method="post" action="<%=request.getContextPath()%>/OrderPayAction">


<input type="hidden" id="midx" name="midx" value="${sMemberMidx}"/>

<!-- <form name="frm"> -->
<table class="table table-striped table-bordered table-hover" >
		<!-- 속성 이름 -->
		<tr>
			
			<th>썸네일</th>
			<th>제목</th>
			<th>금액</th>
			<th></th>
	
		</tr>
		<c:set var="i" value="0"/>
		<c:forEach var="opvo" items="${orderList}" varStatus ="status">
		<!-- 속성 값 -->
		<tr>
			
			<td><img src="displayFile?fileName=${opvo.cImage}" class="img-fluid" /></td>
			<td>${opvo.cSubject}</td>
			<td>${opvo.oPrice}</td>
		<%-- 	<input type="hidden" id="baPrice${status.count}" name="baPrice" value="${blvo.cPrice}"/> --%>
			<td>${opvo.oid}</td>
			<c:set var="j" value="${opvo.oid}"/>
			
			<input type="hidden" id="oPrice${status.count}" name="oPrice" value="${opvo.oPrice}"/>
			<c:set var="i" value="${i=i+opvo.oPrice}"/>
			
		</tr>
		</c:forEach>
	</table>
	총 결제금액 : <c:out value="${i} "/>
	<input type="hidden" name="pPrice" value="${i}">
		<br>
	<br>
	주문번호 : <c:out value="${j} "/>
	<input type="hidden" name="oid" value="${j}">
	
	<br>
	<br>
	<br>
	***결제주의사항***<br>
무통장 입금은 pc뱅킹,인터넷뱅킹 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다<br>
주문시 입력한 임금자명과 실제 입금자의 성명이 반드시 일치하여야 하면, 7일 이내로 입금을 하셔야 하고 입금 되지 않은 주문은 
자동취소 됩니다.<br><br>

카드 결제의 경우 안전을 위해 카드사에서 확인 전화를 드릴 수 있습니다<br> 확인 과정에서 도난 카드의 사용이나 타인 명의의 주문 등
정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.<br>
	<br>
	<br>
	
	
	
	<br>
	결제방법선택
	<br>
	<input type="radio" name="pMethod" value="C"/>카드결제
	<input type="radio" name="pMethod" value="B" checked/>무통장입금
	<br>
	<br>
	입금자명 : <input type="text" name="pDepositor" id="pDepositor" size="20" maxlength="20"/>

<button type="submit"  class="btn btn-primary" id="pay" name="pay">결제하기</button>


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