<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="com.polyplay.pp.domain.BoardVo" %>
<%
BoardVo bvo = (BoardVo)request.getAttribute("bvo"); 
%>
<title>Insert title here</title>
<script type="text/javascript">


$(document).ready(function(){
    $("#List").click(function(){
        // 페이지 주소 변경(이동)
        location.href = "<%=request.getContextPath()%>/BoardNoticeList";
    });
});

</script>
</head>
<body>
<br><br><br>
<h1>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
공지사항</h1>
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
<table class=table1_1  width="1000" height="100"   style="margin-left: auto; margin-right: auto;">
<tr>
	<th width="50">제목</th> 
	<th width="950" colspan="3"  style="text-align:left"><%=bvo.getbSubject() %></th>
	
</tr>
<tr>
	<th width="100">작성자</th>
	<th width="600" style="text-align:left"><%=bvo.getbWriter() %></th>
	<th width="200"><%=bvo.getbWriteday() %></th>
	<th width="100"><%=bvo.getBidx() %></th>
</tr>

<tr>	
	<td colspan="4" height="600" style="text-align:left" ><%=bvo.getbContent()%></a></td>
</tr>
<tr>
	<td colspan="4"  style="text-align:right"><input type="button" id="List" name="List" value="목록">
	</td>
</tr>
</table>


</body>
</html>
<%@ include file="/include/footer.jsp" %> 






