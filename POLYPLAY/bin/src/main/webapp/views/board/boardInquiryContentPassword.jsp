<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.polyplay.pp.domain.BoardVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <% BoardVo bvo = (BoardVo)request.getAttribute("bvo");  %> 

<script type="text/javascript">


    function Content() {
    	 var formname=document.frm;
        var res;
        res= confirm("글을보아요");
        
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
<form name=frm>
<h4>작성하신 글을 볼건가요 ?</h4>

<br>
<h1>비밀번호를 입력 하고 누르세요</h1>
<br>
<input type="password" name="bPassword" id="bPassword" size=10 maxlength="20"/>
<input type="button"  value="보기" onclick="Content()" />
</form>
</body>
</html>