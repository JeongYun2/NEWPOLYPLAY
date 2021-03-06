<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/include/header.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>

<script type="text/javascript">
window.onload = function(){
	reviewList();
}



function reviewList(){

//	alert("리뷰리스트불러짐?");
	
		var str = '';
		
		var cidx = ${cidx};
//		alert(cidx);

		$.ajax({
			type : "GET",
			url  : "${pageContext.request.contextPath}/ReviewListAjax/"+cidx,
			datatype : "json",
			cache : false,
			error:function(request,status,error){
		       // alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       },
			success : function(data){
				
				//alert(data);
				
				$(data).each(function(){		
					
					//alert(this.mNickname);
					var star = null;
					
					if(this.rPoint == 1){
			     		 star = "★☆☆☆☆";
						} else if(this.rPoint == 2){
							star = "★★☆☆☆";
						} else if(this.rPoint == 3){
							star = "★★★☆☆";
						} else if(this.rPoint == 4){
							star ="★★★★☆";							
						} else if(this.rPoint == 5){
							star ="★★★★★";
						}
					
					
					str += "<tr style='text-align:center;'>"
					 	+ "<td>"+this.ridx+"</td>"
						+ "<td width='50%'>"+this.rContent+"</td>" 
						/* + "<td>"+this.rLove+"<span><a class='like-Unlike' href='''>추천</a></span></td>" */
						+ "<td>"+this.rLove+"</td>"
						+"<td><button class='btn btn-danger' onclick='likeUpdate("+this.ridx+");'>추천</button></td>"
																			
				     	+ "<td>"+star+"</td>"    	
				     	
				     	+ "<td>"+this.mNickname+"</td>" 
					 	+ "</tr>";					
				});

				$('#tbl').html("<table class='table table-striped table-bordered table-hover' style='text-align:center;'>"
							 + "<tr>"
				 			 + "<td>글번호</td>"
				 			 + "<td width='50%'>100자평</td>" 
				 			 + "<td>추천수</td>"
				 			 + "<td>추천하기</td>"
				 			 + "<td>별점</td>" 
				 			 + "<td>작성자</td>"
				   		 	 + "</tr>" 
				 			 + str
				 			 + "</table>");				

				} 
	
				
		});	  //ajax끝

		} //리뷰리스트끝


		
	function likeUpdate(ridx) { //추천수업데이트
			
			var ridx = ridx;
			var cidx = $("#cidx").val();
	//		alert("ridx: "+ridx);
			
	        $.ajax({
	            type : "get", 
	            url  : "${pageContext.request.contextPath}/ReviewLikePlus/"+ridx+"/"+cidx,

	            datatype : "text",
	            
	            cache : false,
	            error : function(){            
	              // alert("error");
	            },
	            success : function(data){
	              // alert(data);

	               reviewList();
	               

	            }         
	         });   
	        
			
		}		
		
		

		
		
		
 <%--        function del(){	
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
         --%>
        
         function reviewWrite(){
        	
        	var formname = document.frm;
        	var res;
        	res = confirm("리뷰를 작성하시겠습니까?");
        	if (res == true){
        		
        		formname.action ="<%=request.getContextPath()%>/ReviewWrite";
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
<br>
<br>
<br>
<br>
<div class="container">


  <div class="col-md-12">
            <div class="heading text-md-center text-xs-center" >
      <a href="${pageContext.request.contextPath}/ContentsInfo?cidx=${cidx}" ><font size="5">컨텐츠 정보   |</font></a>
   
      <a href="${pageContext.request.contextPath}/ReviewList?cidx=${cidx}"><font size="5">|   리뷰보기</font></a>
    </div>
        </div>

<form name="frm">
 <input type="hidden" name="cidx" id="cidx" value="${cidx}" />

<div id="tbl"></div>



</form>


<div style="text-align:right;">

<br><br>	
<button type="button" class="btn btn-primary" id="reviewWrite" name="reviewWrite" onclick="reviewWrite();">리뷰작성</button>
			<br>
			<br>
			<br>
			<br>
</div>




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
			<td>${rv.rLove}</td>
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
			<td>${rv.rLove}<span><a class="like-Unlike" href="">싫어요</a></span></td>
		</tr>	
		</c:forEach>
	</table> --%>
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