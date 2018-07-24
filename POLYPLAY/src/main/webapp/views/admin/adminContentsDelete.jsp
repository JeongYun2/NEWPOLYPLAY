<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
 function check(){	
		//alert(1+"1");
	var formname = document.frm;
	var res;
		res = confirm("삭제 하시겠습니까");
		if (res == true){
			formname.action ="${pageContext.request.contextPath}/AdminContentsDeleteAction";
			formname.method ="post";
			formname.submit();
		}
		return;
		
	} 
</script> 
</head>
<body>
<Form name="frm">
<input type="hidden" name="cidx" value="${cv.cidx}" />
<h5>컨텐츠 관리</h5>
<h1>컨텐츠 등록</h1>
<table>
<tr>
<td>
컨텐츠 함부로 삭제 하면 안되는데... ㅠㅠㅠ
</td>
</tr>
<tr>
<td>
<input type="button"name="button" value="삭제" onclick="javascript:check();" />
</td>
</tr>



</table>


</Form>
</body>
</html>