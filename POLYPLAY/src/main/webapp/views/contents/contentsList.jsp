<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/include/header.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<section class="service-sec" id="benefits">
  <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="heading text-md-center text-xs-center">
      <h2>장르별 영화 리스트</h2>
    </div>
        </div>
	
		<!-- 속성 이름 -->
		 <c:forEach items="${alist}" var="cvo">
      <div class="col-md-3 blog-box">
        <div class="blog-image-block"> <a href="${pageContext.request.contextPath}/ContentsInfo?cidx=${cvo.cidx}"><img src="displayFile?fileName=${cvo.cImage}" alt="" class="img-fluid"></a> </div>
		<h3 class="blog-title"><a href="${pageContext.request.contextPath}/ContentsPlay?cidx=${cvo.cidx}">${cvo.cSubject}"</a></h3>
        
      </div>
     </c:forEach>
</div>
	

</div>
</section>
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
</body>
</html>

<%@ include file="/include/footer.jsp" %> 