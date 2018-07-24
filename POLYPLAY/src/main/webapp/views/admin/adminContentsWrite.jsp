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
<style>
.fileDrop1 {
width: 30%;
height: 200px;
border: 1px dotted blue;
}
small1{
margin-left: 3px;
font-weight: bold;
color: gray;
}
.fileDrop2 {
width: 30%;
height: 200px;
border: 1px dotted blue;
}
small2{
margin-left: 3px;
font-weight: bold;
color: gray;
}
.fileDrop3 {
width: 30%;
height: 200px;
border: 1px dotted blue;
}
small3{
margin-left: 3px;
font-weight: bold;
color: gray;
}
</style> 
<script type="text/javascript">
function back(){
	history.back(-1);
}
  
 function check(){	
		//alert(1+"1");
	var formname = document.frm;
	if(formname.cSubject.value == ""){
		alert("작품명을 입력하세요");
		formname.cSubject.focus();
		return;
	
	 } else if (formname.cOpenYear.value ==""){	
		  alert("개봉연도를 입력하세요");
		  formname.cOpenYear.focus();	  
		  return ;
	}else if (formname.cRuntime.value ==""){	
		  alert("러닝타임을 입력하세요");
		  formname.cRuntime.focus();	  
		  return ;
	}else if (formname.cDirector.value ==""){	
		  alert("감독을 입력하세요");
		  formname.cDirector.focus();	  
		  return ;
	}else if (formname.cPrice.value ==""){	
		  alert("금액을 입력하세요");
		  formname.cPrice.focus();	  
		  return ;
	}else if (formname.cActor.value ==""){	
		  alert("감독을 입력하세요");
		  formname.cActor.focus();	  
		  return ;
	}else if (formname.cStory.value ==""){	
		  alert("감독을 입력하세요");
		  formname.cStory.focus();	  
		  return ;
	}      
		var res;
		res = confirm("확인을 눌러주세요");
		if (res == true){
			formname.action ="${pageContext.request.contextPath}/AdminContentsWriteAction";
			formname.method ="post";
			formname.submit();
		}
		return;
		
	} 
	
  
  
 
function addFilePath(msg){
	  alert(msg);
  } 

function checkImageType(fileName){

	var pattern = /jpg$|gif$|png$|jpeg$|wmv|mp4$/i;

	return fileName.match(pattern);
}

function getImageLink(fileName){
	if(!checkImageType(fileName)){
		return;
	} 
	var front = fileName.substr(0,12);
	var end = fileName.substr(14);
	
	return front + end;
}

function getLink(fileName){
	if(!checkImageType(fileName)){
		return;
	} 
	var front = fileName.substr(0,12);
	var end = fileName.substr(54);
	
	return front + end;
}


function getOriginalName(fileName){
	//alert("들어옵니다1");
	if(checkImageType(fileName)){
		return;
		
	}
	
	var idx = fileName.indexOf("_") + 1 ;
	return fileName.substr(idx);
	
}  



$(function(){
  
$(".fileDrop1").on("dragenter dragover", function(event){
	event.preventDefault();
});

$(".fileDrop1").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];
	
	var formData = new FormData();
	
	formData.append("file", file);
	
	$.ajax({
		url: 'uploadAjax',
		data: formData,
		dataType: 'text',
		processData: false,
		contentType: false,
		type: 'POST',
		success: function(data){
			alert(data);
			
			$("#cImage").val(data);
		
			
			var str ="";
			
			console.log(data);
			console.log(checkImageType(data));
			
			if(checkImageType(data)){
				str ="<div>"
					+ "<a href='displayFile?fileName="+getImageLink(data)+"'>"
					+"<img src='displayFile?fileName="+data+"'/>"
					+ "</a><small data-src="+data+">"+getLink(data)+"</small></div>";
						
					
			}else{
				
				str = "<div><a href='displayFile?fileName="+data+"'>"
				+ getOriginalName(data)+"</a>"
				+ "<small data-src="+data+">X</small></div></div>";
				
			}
			
			$(".uploadedList1").append(str);
				
		}
		
	});
	 
 });  


$(".uploadedList1").on("click", "small", function(event){
	var that = $(this);

	$.ajax({
		url:"deleteFile",
		type:"post",
		data: {fileName:$(this).attr("data-src")},
		dataType:"text",
		success:function(result){
			if(result == 'deleted'){
				alert("deleted");
				that.parent("div").remove();
			}
		}
		
	})
	
})

$(".fileDrop2").on("dragenter dragover", function(event){
	event.preventDefault();
});

$(".fileDrop2").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];
	
	var formData = new FormData();
	
	formData.append("file", file);
	
	$.ajax({
		url: 'uploadAjax',
		data: formData,
		dataType: 'text',
		processData: false,
		contentType: false,
		type: 'POST',
		success: function(data){
			alert(data);
			
			$("#cPreVideo").val(data);
			
			
			var str ="";
			
			console.log(data);
			console.log(checkImageType(data));
			
			if(checkImageType(data)){
				str ="<div>"
					+ "<a href='displayFile?fileName="+getImageLink(data)+"'>"
					+"<img src='displayFile?fileName="+data+"'/>"
					+ "</a><small data-src="+data+">"+getLink(data)+"</small></div>";
						
					
			}else{
				
				str = "<div><a href='displayFile?fileName="+data+"'>"
				+ getOriginalName(data)+"</a>"
				+ "<small data-src="+data+">X</small></div></div>";
				
			}
			
			$(".uploadedList2").append(str);
				
		}
		
	});
	 
 });  


$(".uploadedList2").on("click", "small", function(event){
	var that = $(this);

	$.ajax({
		url:"deleteFile",
		type:"post",
		data: {fileName:$(this).attr("data-src")},
		dataType:"text",
		success:function(result){
			if(result == 'deleted'){
				alert("deleted");
				that.parent("div").remove();
			}
		}
		
	})
	
})

$(".fileDrop3").on("dragenter dragover", function(event){
	event.preventDefault();
});

$(".fileDrop3").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];
	
	var formData = new FormData();
	
	formData.append("file", file);
	
	$.ajax({
		url: 'uploadAjax',
		data: formData,
		dataType: 'text',
		processData: false,
		contentType: false,
		type: 'POST',
		success: function(data){
			alert(data);
			
			$("#cVideo").val(data);
			
			
			var str ="";
			
			console.log(data);
			console.log(checkImageType(data));
			
			if(checkImageType(data)){
				str ="<div>"
					+ "<a href='displayFile?fileName="+getImageLink(data)+"'>"
					+"<img src='displayFile?fileName="+data+"'/>"
					+ "</a><small data-src="+data+">"+getLink(data)+"</small></div>";
						
					
			}else{
				
				str = "<div><a href='displayFile?fileName="+data+"'>"
				+ getOriginalName(data)+"</a>"
				+ "<small data-src="+data+">X</small></div></div>";
				
			}
			
			$(".uploadedList3").append(str);
				
		}
		
	});
	 
 });  


$(".uploadedList3").on("click", "small", function(event){
	var that = $(this);

	$.ajax({
		url:"deleteFile",
		type:"post",
		data: {fileName:$(this).attr("data-src")},
		dataType:"text",
		success:function(result){
			if(result == 'deleted'){
				alert("deleted");
				that.parent("div").remove();
			}
		}
		
	})
	
})

});	
   </script>
</head>
<body>
<Form name="frm" enctype ="multipart/form-data" >
<input type="hidden" name="cImage" id="cImage"/>  
<input type="hidden" name="cPreVideo" id="cPreVideo"/>  
<input type="hidden" name="cVideo" id="cVideo"/>  
<h5>컨텐츠 관리</h5>
<h1>컨텐츠 등록</h1>
<table>
			<tr>
			<td>카테고리</td>
			<td  colspan = '4'> 
			<select name = "gidx">
			<option value ="1">액션</option>
			<option value ="2" >스릴러</option>
			<option value ="3" >SF판타지</option>
			<option value ="4" >공포</option>
			<option value ="5">코미디</option>
			<option value ="6">로맨스</option>
			<option value ="7">드라마</option>
			<option value ="8">애니메이션</option>
			</select>
			</td>
			</tr>

			<tr>
				<td colspan='1'>작품명</td>
				<td colspan='4'><input type="text" name="cSubject" value=""
					size="20" maxlength="20" /></td>
			</tr>
			<tr>
				<td colspan='1'>개봉연도</td>
				<td colspan='4'><input type="text" name="cOpenYear"
					value="" size="20" maxlength="20" /></td>
			</tr>
			<tr>
				<td colspan='1'>러닝타임</td>
				<td colspan='4'><input type="text" name="cRuntime" value=""
					size="20" maxlength="30"></td>
			</tr>
			<tr>
				<td colspan='1'>감독</td>
				<td colspan='4'><input type="text" name="cDirector" value=""
					size="20" maxlength="20" /></td>
			</tr>
			<tr>
				<td colspan='1'>금액</td>
				<td colspan='4'><input type="text" name="cPrice" value=""
					size="20" maxlength="20" /></td>
			</tr>
			<tr>
				<td colspan='1'>배우</td>
				<td colspan='4'><input type="text" name="cActor" value=""
					size="20" maxlength="20" /></td>
			</tr>
			<tr>
			<td>줄거리</td>
				
			</tr>
			<tr>
			
			<td colspan ="5"><textarea name="cStory" cols="200" rows="10"></textarea>
				</td>
			</tr>
			
			<tr>
			<td>
			<input type="button"name="button" value="등록하기" onclick="javascript:check();" />
			<input type="button"name="button" value="취소" onclick="javascript:back();" />
			</td>
			<tr>
			</table>
			 <div class='fileDrop1'>이미지</div>
			 <div class='uploadedList1'></div>
			 <div class='fileDrop2'>미리보기</div>
			 <div class='uploadedList2'></div>
			 <div class='fileDrop3'>풀영상</div>
			 <div class='uploadedList3'></div>	

</Form>
</body>
</html>