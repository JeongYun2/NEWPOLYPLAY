<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function back(){
		history.back(-1);
	}
  
  
  function check(){	
		//alert(1+"1");
		
    var formname = document.frm;

	 if(formname.content.value == ""){
		alert("영화평을 입력하세요");
		formname.content.focus();
		return;
	
	 } 
		

		var res;
		res = confirm("확인을 눌러주세요");
		if (res == true){
			formname.action ="${pageContext.request.contextPath}/ReviewWriteAction";
			formname.method ="post";
			formname.submit();
		}
		return;
		
	}
</script>
</head>
<body>
<Form name="frm">
<table>
<tr>
<td>
<textarea name="content" cols="200" rows="10" placeholder= "영화 평을 등록해주세요(100자 이내)"></textarea>
</td>
</tr>
<tr>	
<td>
<input type="button"name="button" value="등록하기" onclick="javascript:check();" />
<input type="button"name="button" value="취소" onclick="javascript:back();" />
<td>
<tr>
</table>
</Form>
</body>
</html>

<%@ include file="/include/footer.jsp" %> 