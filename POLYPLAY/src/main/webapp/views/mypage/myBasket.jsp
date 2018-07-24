<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.polyplay.pp.domain.MemberVo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/include/header.jsp" %>

<%-- <%@ page import="com.polyplay.pp.domain.BasketListVo" %> --%>

<%-- <% BasketListVo blvo = (BasketListVo)request.getAttribute("basketList"); %> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function orderCheck() {
	
//	alert("뭐여");
	
	var formname = document.frm;

	var res;
	res = confirm("선택한 상품을 구매하시겠습니까?");

	if (res == true) {
		
		formname.method = "post";
		formname.action = "<%=request.getContextPath()%>/OrderPay";
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

<!-- 장바구니->찜할때 selectWishListCheck하기 Ajax로  -->

<form name="frm" method="post" action="<%=request.getContextPath()%>/OrderPay">

<h1>MY장바구니</h1>

<c:choose>
	<c:when test="${sMemberMidx != null}">
		<c:set var="midx" value="${sMemberMidx}" />
	</c:when>
	
	<c:otherwise>
		<c:set var="midx" value="0" />
	</c:otherwise>

</c:choose>

<input type="text" id="midx" name="midx" value="${sMemberMidx}"/>
<table border="1" width="80%" style="text-align: center;">
		<!-- 속성 이름 -->
		<tr>
			<th></th>
			<th>썸네일</th>
			<th>제목</th>
			<th>금액</th>
			<th></th>
	
		</tr>
		<c:forEach var="blvo" items="${basketList}" varStatus ="status">
		<!-- 속성 값 -->
		<tr>
			<td><input type="checkbox" id="cidx${status.count}" name="cidx" value="${blvo.cidx}"></td>
			<td>${blvo.cImage}||${blvo.cidx}</td>
			<td>${blvo.cSubject}</td>
			<td>${blvo.cPrice}</td>
		<%-- 	<input type="hidden" id="baPrice${status.count}" name="baPrice" value="${blvo.cPrice}"/> --%>
			<td>
			
			
				<a href="<%=request.getContextPath()%>/FromBaToWish?midx=1&cidx=${blvo.cidx}">찜하기</a>
				<a href="<%=request.getContextPath()%>/MyBasketDelete?midx=1&cidx=${blvo.cidx}">삭제</a>
				<!-- <input type="button" name="addToWish" value="찜하기" onclick=";" />
				<button id="addToWish" >삭제</button> -->
		</tr>
		</c:forEach>
	</table>

<input type="button"  id="order" name="order" value="구매하기" onclick="orderCheck();"  />



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