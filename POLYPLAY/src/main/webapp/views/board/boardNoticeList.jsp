<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.polyplay.pp.domain.BoardVo" %>
<%@ include file="/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1문의 </title>
</head>

 
<%
		ArrayList<BoardVo> alist =(ArrayList<BoardVo>)request.getAttribute("alist");
%>

<body>
<br><br><br>
<h1>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
공지사항</h1>
<br>
<center>
<a href="<%=request.getContextPath() %>/BoardNoticeList "> <font size="5" color="red">공지사항</font></a>&emsp;&emsp;&emsp;
<a href="<%=request.getContextPath() %>/BoardFAQUserList "><font size="5"> FAQ</font></a>&emsp;&emsp;&emsp;
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
	<th width="100">번호</th>
	<th width="500">제목</th>
	<th width="200">등록일</th>
</tr>

<%
for (BoardVo bvo : alist) {
		%>
<tr>
	<td><%=bvo.getBidx() %></td>
	<td><a href="<%=request.getContextPath() %>/BoardNoticeContent?bidx=<%=bvo.getBidx()%>"><%=bvo.getbSubject()%></a></td>
	<td><%=bvo.getbWriteday() %></td>
</tr>
	<%} %>
</table>

</form>

</body>
</html>
<%@ include file="/include/footer.jsp" %> 