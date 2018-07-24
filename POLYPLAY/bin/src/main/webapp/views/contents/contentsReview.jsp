<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/include/header.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	
	//alert("작동");
	$.reviewList();
    
/*  	$(".like-Unlike").click(function(e){
		
		alert("버튼작동");
		
	    if ($(this).html() == "싫어요"){
	        $(this).html('좋아요');
	    }
	    else {
	        $(this).html('싫어요');
	    }
	    return false;
	});  */
    
    

	
    
}); //다큐먼트레디끝





$.reviewList = function(){

	//alert("리뷰리스트불러짐?");
	
		var str = '';
		
		var cidx = ${cidx};
		alert(cidx);

		$.ajax({
			type : "GET",
			url  : "${pageContext.request.contextPath}/ReviewListAjax/"+cidx,
			datatype : "json",
			cache : false,
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       },
			success : function(data){
				
				//alert(data);
				
				$(data).each(function(){		
					
					str += "<tr style='text-align:center;'>"
					 	+ "<td>"+this.ridx+"</td>"
						+ "<td width='50%'>"+this.rContent+"</td>" 
						/* + "<td>"+this.rLike+"<span><a class='like-Unlike' href='''>추천</a></span></td>" */
						
						+"<td>"+this.rLike+"<button class='btn btn-danger' onclick='$.likeUpdate("+this.ridx+")'>추천</button></td>"
						
				     	+ "<td>"+this.rPoint+"</td>" 
					 	+ "</tr>";					
				});

				$('#tbl').html("<table border='1' width='100%' style='text-align:center;'>"
							 + "<tr style='text-align:center;background-color:skyblue;'>"
				 			 + "<td>ridx</td>"
				 			 + "<td width='50%'>100자평</td>" 
				 			 + "<td>추천수</td>"
				 			 + "<td>별점</td>" 
				   		 	 + "</tr>" 
				 			 + str
				 			 + "</table>");				

				} 
				
		
				
		});	  //ajax끝

		} //리뷰리스트끝


		
	$.likeUpdate = function(ridx){ //추천수업데이트
			
			var ridx = ridx;
			var cidx = $("#cidx").val();
			alert("ridx: "+ridx);
			
	        $.ajax({
	            type : "get", 
	            url  : "${pageContext.request.contextPath}/ReviewLikePlus/"+ridx+"/"+cidx,

	            datatype : "text",
	            
	            cache : false,
	            error : function(){            
	               alert("error");
	            },
	            success : function(data){
	              // alert(data);

	               $.reviewList();
	               

	            }         
	         });   
	        
			
		}		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
        function del(){	
        	var formname = document.frm;
        	var res;
        	res = confirm("삭제 하시겠습니까?");
        	if (res == true){
        		
        		formname.action ="<%=request.getContextPath()%>/ReviewDelete";
        		formname.method ="POST";
        		formname.submit();
        	}
        		return;

        		}
    </script>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

 <input type="hidden" name="cidx" id="cidx" value="${cidx}" />

<div id="tbl"></div>












<%-- 	<form name =frm>
	<table>
		<!-- 속성 이름 -->
		<tr>
			<th>번호</th>
			<th>회원번호(테스트)</th>
			<th>컨텐츠 번호</th>
			<th>별점</th>
			<th>리뷰내용</th>
			<th>좋아요</th>
			<th>리뷰작성날자</th>	
			<th>아이피</th>		
		</tr>
		<tr>
			<td>${rv.ridx}</td>
			<td>${rv.midx}</td>
			<td>${rv.cidx}</td>
			<td>${rv.rPoint}</td>
			<td>${rv.rContent}</td>
			<td>${rv.rLike}</td>
			<td>${rv.rWriteday}</td>
			<td>${rv.rIp}</td>
		</tr>	
		<input type='button' value='삭제' onclick='javascript:del();'></button>
		
	</table>
	</form>
	<table>
		<!-- 속성 이름 -->
		<tr>
			<th>번호</th>
			<th>회원번호(테스트)</th>
			<th>컨텐츠 번호</th>
			<th>별점</th>
			<th>리뷰내용</th>
			<th>좋아요</th>		
		</tr>
		<c:forEach items="${alist}" var="rvo">
		<!-- 속성 값 -->
		<tr>
			<td>${rv.ridx}</td>
			<td>${rv.midx}</td>
			<td>${rv.cidx}</td>
			<td>${rv.rPoint}</td>
			<td>${rv.rContent}</td>
			<td>${rv.rLike}<span><a class="like-Unlike" href="">싫어요</a></span></td>
		</tr>	
		</c:forEach>
	</table> --%>
	
	
	
</body>
</html>

<%@ include file="/include/footer.jsp" %> 