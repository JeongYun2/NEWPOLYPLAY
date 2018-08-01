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
<h1>구입한 작품 </h1>



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

<table class="table table-striped table-bordered table-hover" >
		<!-- 속성 이름 -->
		<tr>
			<th>　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　</th>
	
		</tr>
		<c:forEach var="opvo" items="${myContentsList}" varStatus ="status">
		<!-- 속성 값 -->
		<tr>
			<div class="col-md-4"><td><a href="<%=request.getContextPath()%>/ContentsPlay?cidx=${opvo.cidx}"><img src="/polyplay/resources/contents${opvo.cImage}" class="img-fluid" /></a></td></div>
	
		</tr>
		</c:forEach>
	</table>


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