<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디찾기</title>

	<!-- Bootstrapk CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Bootstrapk JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
$(function() {

	$.idFine();
});


$.idFine = function(){

	
	$("#idFine_btn").click(function() {
	
		
		if($("#mName").val() == ""){
			return;
		} else if($("#mEmail").val() == ""){
			return;
		}
		
		var mName = $("#mName").val();
		var mEmail = $("#mEmail").val();
		
		
        $.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/MemberIdFindAction",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			data : JSON.stringify({
				mName :  mName, 
				mEmail : mEmail
			}),
			dataType : "json",
			success : function(data) {
				
				var sId = null;
				
				if(data.mId == null){

					sId = "<p class='help-block'>존재 하지 않는 회원님입니다.</p>";
				} else {
					
					sId = "<p class='help-block'>회원님의 ID는"+data.mId+"입니다.</p>"
					+"<p class='help-block'><a href='${pageContext.request.contextPath}/MemberLogin'>로그인하기</a></p>";
				}
				
				$("#idFined").html(sId);
			},
			error : function(error) {
				alert("error : " + error);
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
          <h1>아이디 찾기</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form id="frm">

            <div class="form-group">
                    <label for="username">이름</label>
                    <input type="text" class="form-control" id="mName" name="mName" placeholder="이름을 입력해 주세요">
            </div>
            <div id="nameText" class="red"></div>

            <div class="form-group">
              <label for="InputEmail">이메일</label>
              <input type="email" class="form-control" id="mEmail" name="mEmail" placeholder="이메일을 입력해 주세요">
            </div>
            <div id="emailText" class="red"></div>
            
            <div class="form-group text-center">
              <input class="btn btn-info" type="button" id="idFine_btn" value="아이디 찾기">
			  <input class="btn btn-warning" type="button" value="취소하기" onclick="location='${pageContext.request.contextPath}/MainList'">
            </div>
          </form>
          
          <div class="form-group text-center" id="idFined">
          </div>
          
        </div>
      </article>
</body>
</html>

