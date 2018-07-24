<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.polyplay.pp.domain.BoardVo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1문의 </title>
<%
		ArrayList<BoardVo> alist =(ArrayList<BoardVo>)request.getAttribute("alist");
%>

</head>

<body>
<h1>FAQ </h1>
<h1>FAQ 결제</h1>
<a href="<%=request.getContextPath() %>/BoardFAQUserList">회원 </a>
<a href="<%=request.getContextPath() %>/BoardFAQPlayerList">플레이어 </a>
<a href="<%=request.getContextPath() %>/BoardFAQPayList">결제 </a>
<a href="<%=request.getContextPath() %>/BoardFAQEtcList">기타</a><br>
	<table border=1>
		<tr>
			<td>번호</td>
		
			<td>제목</td>
			
		</tr>
		<%
			for (BoardVo bvo : alist) {
		%>
		<tr>
		    <td><%=bvo.getBidx() %>
			
			<td><a href="<%=request.getContextPath() %>/BoardFAQContent?bidx=<%=bvo.getBidx()%>"><%=bvo.getbSubject()%></a></td>
			
		</tr>
		<%} %>

	</table>
	


</body>
</html>