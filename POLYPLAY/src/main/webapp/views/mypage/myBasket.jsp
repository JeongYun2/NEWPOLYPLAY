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


<script type="text/javascript">

function orderCheck() {
	
	
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

<input type="hidden" id="midx" name="midx" value="${sMemberMidx}"/>
<table class="table table-striped table-bordered table-hover" >
		<!-- 속성 이름 -->
		<tr>
			<th></th>
			<th>썸네일</th>
			<th>제목</th>
			<th>금액</th>
			<th></th>
			<th></th>
	
		</tr>
		<c:forEach var="blvo" items="${basketList}" varStatus ="status">
		<!-- 속성 값 -->
		<tr>
			<td><input type="checkbox" id="cidx${status.count}" name="cidx" value="${blvo.cidx}"></td>
			<td><div class="col-md-4"><img src="/polyplay/resources/contents${blvo.cImage}" class="img-fluid" /></div></td>
			<td>${blvo.cSubject}</td>
			<td>${blvo.cPrice}</td>
			<td><a href="<%=request.getContextPath()%>/FromBaToWish?midx=${sMemberMidx}&cidx=${blvo.cidx}">찜하기</a></td>	
			<td><a href="<%=request.getContextPath()%>/MyBasketDelete?midx=${sMemberMidx}&cidx=${blvo.cidx}">삭제</a></td>
		</tr>
		</c:forEach>
	</table>

<input  class="btn btn-primary" type="button"  id="order" name="order" value="구매하기" onclick="orderCheck();"  />



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