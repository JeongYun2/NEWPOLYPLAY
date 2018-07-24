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
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h1>주문결제페이지</h1>

<!-- 장바구니->찜할때 selectWishListCheck하기 Ajax로  -->

<form name="frm" method="post" action="<%=request.getContextPath()%>/OrderPayAction">
<!-- <form name="frm"> -->
<table border="1" width="80%" style="text-align: center;">
		<!-- 속성 이름 -->
		<tr>
			<th></th>
			<th>썸네일</th>
			<th>제목</th>
			<th>금액</th>
			<th></th>
	
		</tr>
		<c:set var="i" value="0"/>
		<c:forEach var="opvo" items="${orderList}" varStatus ="status">
		<!-- 속성 값 -->
		<tr>
			<td>${opvo.cidx} ${status.count}</td>
			<td>${opvo.cImage}</td>
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
	<c:out value="${i} "/>
	<input type="text" name="pPrice" value="${i}">
	
	<c:out value="${j} "/>
	<input type="text" name="oid" value="${j}">

	<br>
	**결제주의사항
	<br>
	
	결제방법선택
	<br>
	<input type="radio" name="pMethod" value="C"/>카드결제
	<input type="radio" name="pMethod" value="B"/>무통장입금
	<br>
	
	입금자명 : <input type="text" name="pDepositor" id="pDepositor" size="20" maxlength="20"/>

<input type="submit"  id="pay" name="pay" value="결제하기"  />
<!-- <input type="submit"  id="pay" name="pay" value="결제하기"  /> -->
<%-- <input type="hidden" name="midx" value="${midx}"/> --%>
<input type="hidden" name="midx" value="1"/>



</form>
</body>
</html>

<%@ include file="/include/footer.jsp" %> 