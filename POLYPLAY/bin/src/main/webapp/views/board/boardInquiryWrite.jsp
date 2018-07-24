<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<script type="text/javascript">


function check() {	
  
  var formname = document.frm;
  
  if (formname.bSubcate.value =="") {
	  alert("카테고리고르세요");
	  formname.bSubcate.focus();	  
	  return ;
  } else if (formname.bWriter.value ==""){	
	  alert("작성자를 입력하세요");
	  formname.content.focus();	  
	  return ;
  } else if (formname.bSubject.value ==""){	
	  alert("제목을 입력하세요");
	  formname.bSubject.focus();	  
	  return ;
  } else if (formname.bContent.value ==""){	
	  alert("내용을 입력하세요");
	  formname.bContent.focus();	  
	  return ;
  } else if (formname.bPassword.value ==""){	  
	  alert("비밀번호를 입력하세요");
	  formname.password.focus();	  
	  return ;
  } 
    var res;
  	res = confirm("등록하시겠습니까?");
  
  	if (res == true) {
	   	formname.method ="post";
	   	formname.action ="<%=request.getContextPath() %>/BoardInquiryWriteAction";
	   	formname.submit();  
  	}
  	return ;
}	



</script>
</head>
<body>
<form name="frm" method="post" action="<%=request.getContextPath() %>/BoardInquiryWriteAction">
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
<!-- <input type="hidden" name="bSubcate" value="sub"/> -->
</tr>

<tr>
<td>작성자</td>
<td>
<input type="text" name="bWriter"  size="20"  />
</td>
</tr>
<tr>
<td>제목</td>
<td>
<input type="text" name="bSubject" id="bSubject" size="20" maxlength="20" />
</td>
</tr>
<tr>
<td>내용</td>
<td>
<textarea name="bContent" rows=20 cols=100 ></textarea>
</td>
</tr>
<tr>
<td>비밀번호</td>
<td>
<input type="Password" name="bPassword" id="bPassword" size="10" maxlength="10" />
</td>
</tr>
<tr>
<td>비밀글여부</td>
<td>
비밀글<input type="radio" name="bSecret_yn" id="bSecret_yn" value="Y" checked> 
공개글<input type="radio" name="bSecret_yn" id="bSecret_yn" value="N"></td>


 

</td>
</tr>
<tr>
<td></td>
<td align="center">
<input type="button" name="button" value="확인" onclick="javascript:check();" />
<a href="<%=request.getContextPath() %>/BoardInquiryList"> 취소 </a><br>

</td>
</tr>
</table>
</form>
</body>
</html>