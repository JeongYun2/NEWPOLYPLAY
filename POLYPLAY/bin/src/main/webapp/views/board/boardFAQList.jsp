<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.polyplay.pp.domain.BoardVo"  %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% ArrayList <BoardVo> alist =  (ArrayList<BoardVo>)request.getAttribute("alist");%>
<table>
<tr>
<td>회원로그인</td>
<td>플레이어</td>
<td>결제</td>
<td>기타</td>
</tr>
<tr>
<td>서브카테고리</td>
<td>제목</td>

<% for (BoardVo bvo : alist ) { %>
<tr>
<td><%=bvo.getbSubcate()%>
<td><%=bvo.getbSubject() %>

</tr>	
 <% } %>
 
 
 </table>


</body>
</html>