<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.polyplay.pp.domain.*" %>
<% BoardVo bvo = (BoardVo)request.getAttribute("bvo"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정페이지</title>
<script type="text/javascript">
function check() {	
  //히히히히
  //호호호호
  //왜안되느냐
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

</script>
</head>
<body>
<form name="frm">
<input type="hidden" name="bidx" value="<%=bvo.getBidx() %>" />
<table border=1 width="100%" height="600px">
<tr>
<td>카테고리</td>
<td>
<select name="bSubcate">
 <option value="1">회원</option>
 <option value="2">플레이어</option>
 <option value="3">결제</option>
 <option value="4">기타</option>
 <option value="5">작품제안</option>
 <option value="6">신고하기</option>
 </select>
</td>
</tr>
<tr>
<td>글쓴이</td>
<td>
<input type="text" name="bWriter"  size="20" value="<%=bvo.getbWriter() %>"readonly disabled />
</td>
</tr>
<tr>
<td>제목</td>
<td>
<input type="text" name="bSubject"  size="20" value="<%=bvo.getbSubject() %>" />
</td>

</tr>
<tr>
<td>내용</td>
<td>
<textarea name="bContent" rows=20 cols=100 >
<%=bvo.getbContent() %>
</textarea>
</td>
</tr>

<tr>
<td></td>
<td align="center">
<input type="button" name="button" value="확인" onclick="javascript:check();" />

</td>
</tr>
</table>
</form>
</body>
</html>