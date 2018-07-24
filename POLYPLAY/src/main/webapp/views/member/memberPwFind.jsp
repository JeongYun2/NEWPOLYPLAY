<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>

	<!-- Bootstrapk CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Bootstrapk JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
$(function() {

	$.pwFine();
});


$.pwFine = function(){

	
	$("#pwFine_btn").click(function() {
	
		
		if($("#mId").val() == ""){
			return;
		} else if($("#mEmail").val() == ""){
			return;
		} else if($("#mPhone").val() == ""){
			return;
		}
		
		var mId = $("#mId").val();
		var mEmail = $("#mEmail").val();
		var mPhone = $("#mPhone").val();
		
		
        $.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/MemberPwFindAction",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			data : JSON.stringify({
				mId :  mId, 
				mEmail : mEmail,
				mPhone : mPhone
			}),
			dataType : "json",
			success : function(data) {
				
				var sId = null;
				
				if(data.mPw == null){
					
					sId = "<p class='help-block'>존재 하지 않는 회원님입니다.</p>";
				} else {
					
					sId = "<p class='help-block'>회원님의 비밀번호는"+data.mPw+"입니다.</p>"
					+"<p class='help-block'><a href='${pageContext.request.contextPath}/MemberLogin'>로그인하기</a></p>";
				}
				
				$("#pwFined").html(sId);
			},
			error : function(error) {
				alert("정보를 입력해 주세요.");
			}
		});
        
        return;
		
	});

}
</script>


</head>
<body>

<article class="container">
        <div class="page-header">
          <h1>비밀번호 찾기</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form id="frm">
            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" class="form-control" id="mId" name="mId">
            </div>

            <div class="form-group">
              <label for="InputEmail">이메일</label>
              <input type="email" class="form-control" id="mEmail" name="mEmail">
            </div>
            
            <div class="form-group">
              <label for="username">전화번호</label>
              <div class="input-group">
                <input type="tel" class="form-control" id="mPhone" name="mPhone" placeholder="- 없이 입력해 주세요">
              </div>
            </div>
            
            <div class="form-group text-center">
              <input class="btn btn-info" type="button" id="pwFine_btn" value="비민번호 찾기">
			  <input class="btn btn-warning" type="button" value="취소하기" onclick="location='${pageContext.request.contextPath}/MainList'">
            </div>
          </form>
          
          <div class="form-group text-center" id="pwFined">
          </div>
          
        </div>
      </article>
</body>
</html>