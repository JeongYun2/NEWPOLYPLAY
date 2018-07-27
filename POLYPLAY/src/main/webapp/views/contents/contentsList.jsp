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
            
            <c:set var="gName" value="" />
            <c:choose>
				<c:when test="${gidx == 1}">
					<c:set var="gName" value="액션" />
				</c:when>
				<c:when test="${gidx == 2}">
					<c:set var="gName" value="스릴러" />
				</c:when>
				<c:when test="${gidx == 3}">
					<c:set var="gName" value="SF/판타지" />
				</c:when>
				<c:when test="${gidx == 4}">
					<c:set var="gName" value="공포" />
				</c:when>
				<c:when test="${gidx == 5}">
					<c:set var="gName" value="코미디" />
				</c:when>
				<c:when test="${gidx == 6}">
					<c:set var="gName" value="로맨스" />
				</c:when>
				<c:when test="${gidx == 7}">
					<c:set var="gName" value="드라마" />
				</c:when>
				<c:when test="${gidx == 8}">
					<c:set var="gName" value="애니메이션" />
				</c:when>
			</c:choose>
			
			
      <h2><c:out value="${gName}"/></h2>
    </div>
        </div>
	
		<!-- 속성 이름 -->
		 <c:forEach items="${alist}" var="cvo">
      <div class="col-md-3 blog-box">
        <div class="blog-image-block"> <a href="${pageContext.request.contextPath}/ContentsInfo?cidx=${cvo.cidx}"><img src="/polyplay/resources/contents${cvo.cImage}" class="img-fluid"></a> </div>
		<h3 class="blog-title"><a href="${pageContext.request.contextPath}/ContentsPlay?cidx=${cvo.cidx}">${cvo.cSubject}</a></h3>
        
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