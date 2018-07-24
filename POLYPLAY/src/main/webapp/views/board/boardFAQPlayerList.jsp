<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.polyplay.pp.domain.BoardVo" %>
<%@ include file="/include/header.jsp" %>
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
<br><br><br>
<h1>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
FAQ</h1>
<center>
<a href="<%=request.getContextPath() %>/BoardNoticeList "> <font size="5" >공지사항</font></a>&emsp;&emsp;&emsp;
<a href="<%=request.getContextPath() %>/BoardFAQUserList "><font size="5" color="red"> FAQ</font></a>&emsp;&emsp;&emsp;
<a href="<%=request.getContextPath() %>/BoardInquiryList "> <font size="5">1:1문의</font></a>
</center>
<form name=frm>
<br>
 <style>
.table1_1 table {
	width:100%;
	margin:15px 0
}
.table1_1 th {
	background-color:#93DAFF;
	color:#000000
}
.table1_1,.table1_1 th,.table1_1 td
{
	font-size:0.95em;
	text-align:center;
	padding:4px;
	border:1px solid #dddddd;
	border-collapse:collapse
}
.table1_1 tr:nth-child(odd){
	background-color:#dbf2fe;
}
.table1_1 tr:nth-child(even){
	background-color:#fdfdfd;
}
</style>
<table class=table1_1  width="800" height="100"   style="margin-left: auto; margin-right: auto;
	text-align: center;">
<tr>
	<th width="200"><a href="<%=request.getContextPath() %>/BoardFAQUserList">회원 </a></th>
	<th width="200"><a href="<%=request.getContextPath() %>/BoardFAQPlayerList"><font color="red">플레이어</font> </a></th>
	<th width="200"><a href="<%=request.getContextPath() %>/BoardFAQPayList">결제 </a></th>
	<th width="200"><a href="<%=request.getContextPath() %>/BoardFAQEtcList">기타</a></th>
</tr>
<%
for (BoardVo bvo : alist) {
%>
<tr>
	<td>번호</td>
	<td colspan="3">제목</td>
</tr>
<tr>
	<td><%=bvo.getBidx() %></td>
	<td colspan="3">
	<a href="<%=request.getContextPath() %>/BoardFAQContent?bidx=<%=bvo.getBidx()%>"><%=bvo.getbSubject()%></a></td>
</tr>

	<%} %>
</table>

</body>
</html>
<%@ include file="/include/footer.jsp" %> 