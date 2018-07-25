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

	 if(formname.rContent.value == ""){
		alert("영화평을 입력하세요");
		formname.rContent.focus();
		return;
	
	 } 
		

		var res;
		res = confirm("영화평을 등록하시겠습니까?");
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
<div class="container">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<Form name="frm">
 <input type="hidden" name="cidx" id="cidx" value="${cidx}" />
  <input type="hidden" name="midx" id="midx" value="${midx}" />
<table>
<tr>
<td> 
	<select name="rPoint">
	 <option value="0">별점을 선택하세요.</option>
	 <option value="1">★☆☆☆☆</option>
	 <option value="2">★★☆☆☆</option>
	 <option value="3">★★★☆☆</option>
	 <option value="4">★★★★☆</option>
	 <option value="5">★★★★★</option>
	</select>
</td>
<tr>
<td>
<textarea name="rContent" id="rContent" class="comment_text" style="width:600px; height: 300px; font-size: 14px; line-height: 18px; border: 5px solid #dddddd; padding: 10px;" placeholder="내용을 입력하세요."></textarea>
</td>
</tr>               
<tr>	
<td>
<input type="button"name="button" value="등록하기" onclick="javascript:check();" />
<input type="button"name="button2" value="취소" onclick="javascript:back();" />
<td>
<tr>
</table>
</Form>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</div>

</body>
</html>

<%@ include file="/include/footer.jsp" %> 