<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.polyplay.pp.domain.BoardVo" %>
<%@ include file="/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <% BoardVo bvo = (BoardVo)request.getAttribute("bvo");  %> 

<script type="text/javascript">


    function Content() {
    	 var formname=document.frm;
        var res;
        res= confirm("게시글을 열람합니다");
        
       	if(res==true){
       	formname.method="post";                            
       	formname.action="<%=request.getContextPath() %>/BoardInquiryCheckContent?bidx=<%=bvo.getBidx()%>";
        formname.submit();
       	}
        return;
    }

    
</script>
<title>글컨텐츠비밀번호</title>
</head>
<body>
<br><br><br>
<h1>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
1:1문의</h1>
<center>
<a href="<%=request.getContextPath() %>/BoardNoticeList "> <font size="5" >공지사항</font></a>&emsp;&emsp;&emsp;
<a href="<%=request.getContextPath() %>/BoardFAQUserList "><font size="5" > FAQ</font></a>&emsp;&emsp;&emsp;
<a href="<%=request.getContextPath() %>/BoardInquiryList "> <font size="5" color="red">1:1문의</font></a>
</center>
<br><br><br><br>
<center><h1>
비밀번호를 입력하세요</h1></center>
<form name=frm>


<br>

<br>
<center>
<input type="password" name="bPassword" id="bPassword" size=20 maxlength="20"/>
<input type="button"  value="입력" onclick="Content()" />
</center>
</form>
</body>
</html>
<%@ include file="/include/footer.jsp" %> 