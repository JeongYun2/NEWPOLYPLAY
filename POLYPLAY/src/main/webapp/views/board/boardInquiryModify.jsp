<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.polyplay.pp.domain.*" %>
<%@ include file="/include/header.jsp" %>
<% BoardVo bvo = (BoardVo)request.getAttribute("bvo"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정페이지</title>
<script type="text/javascript">
function check() {	
  var formname = document.frm;
    var res;
  	res = confirm("수정하시겠습니까?");
  
  	if (res == true) {
	   	formname.method ="post";
	   	formname.action ="<%=request.getContextPath() %>/BoardInquiryModifyAction";
	   	formname.submit();  
  	}
  	return ;
}	

$(document).ready(function(){
    $("#Cancle").click(function(){
        // 페이지 주소 변경(이동)
        location.href = "<%=request.getContextPath()%>/BoardInquiryList";
    });
});

</script>
</head>
<body>
<br><br><br>
<h1>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
1:1문의 수정</h1>
<center>
<a href="<%=request.getContextPath() %>/BoardNoticeList "> <font size="5" >공지사항</font></a>&emsp;&emsp;&emsp;
<a href="<%=request.getContextPath() %>/BoardFAQUserList "><font size="5" > FAQ</font></a>&emsp;&emsp;&emsp;
<a href="<%=request.getContextPath() %>/BoardInquiryList "> <font size="5" color="red">1:1문의</font></a>
</center>
<form name=frm>
<input type="hidden" name="bidx" value="<%=bvo.getBidx() %>" />
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
	<th width="50">카테고리</th> 
	<th width="950" colspan="3"  style="text-align:left">
	<select name="bSubcate" >
 <option value="1">회원</option>
 <option value="2">플레이어</option>
 <option value="3">결제</option>
 <option value="4">기타</option>
 <option value="5">작품제안</option>
 <option value="6">신고하기</option>
 </select>
	</th>	
</tr>
<tr>
	<th width="250">작성자</th>
	<th width="750" colspan="3"  style="text-align:left">
	<input type="text" name="bWriter"  size="20" value="<%=bvo.getbWriter() %>"readonly disabled />
	</th>
</tr>
<tr>
	<th width="50">제목</th> 
	<th width="950" colspan="3"  style="text-align:left">
	<input type="text" name="bSubject" id="bSubject" value="<%=bvo.getbSubject() %>" size="105" maxlength="105" />
	</th>	
</tr>
<tr>	
	<td colspan="4" height="200" style="text-align:left" >
	<textarea name="bContent" rows=25  cols=140>
	<%=bvo.getbContent() %>
	</textarea>
	</td>
</tr>
<tr>
<td colspan="4" style="text-align:right">
	<input type="button" name="button" value="수정" onclick="javascript:check();" />
	<input type="button" id="Cancle" name="Cancle" value="취소">
	
</td>
</tr>
</table>
</form>
</body>
</html>
<%@ include file="/include/footer.jsp" %> 



<%-- 
<input type="button" name="button" value="확인" onclick="javascript:check();" />

<textarea name="bContent" rows=20 cols=100 >
<%=bvo.getbContent() %>
</textarea>

<input type="text" name="bSubject"  size="20" value="<%=bvo.getbSubject() %>" />
<input type="text" name="bWriter"  size="20" value="<%=bvo.getbWriter() %>"readonly disabled />

<select name="bSubcate">
 <option value="1">회원</option>
 <option value="2">플레이어</option>
 <option value="3">결제</option>
 <option value="4">기타</option>
 <option value="5">작품제안</option>
 <option value="6">신고하기</option>
 </select>
<input type="hidden" name="bidx" value="<%=bvo.getBidx() %>" /> --%>