<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="com.polyplay.pp.domain.BoardVo" %>
<%
BoardVo bvo = (BoardVo)request.getAttribute("bvo"); 
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
    $(document).ready(function(){
        $("#Modify").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "<%=request.getContextPath()%>/BoardInquiryModify?bidx=<%=bvo.getBidx()%>";
        });
    });


    $(document).ready(function(){
        $("#Delete").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "<%=request.getContextPath()%>/BoardInquiryContentDelete?bidx=<%=bvo.getBidx()%>";
           
        });
    });
</script>
<title>Insert title here</title>
</head>
<body>
<form name=frm>
	  
        <button type="button" id="Modify">수정</button>
  
   
        <button type="button" id="Delete">삭제</button>
       
<h1>1:1문의 내용</h1>

번호:<%=bvo.getBidx() %><br>
카테고리 : <%=bvo.getbSubcate() %> <br>
글쓴이 : <%=bvo.getbWriter() %> <br>
제목: <%=bvo.getbSubject() %> <br>
내용 : <%=bvo.getbContent() %><br>
</form>
</body>
</html> 


