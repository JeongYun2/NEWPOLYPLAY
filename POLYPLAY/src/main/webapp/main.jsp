<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href=" ">
<title>Poly Play</title>

<!-- Bootstrap core CSS -->
<link href="resources/plugins/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/plugins/css/custom.css" rel="stylesheet">

<!-- Helper Styles -->
<link href="resources/plugins/css/loaders.css" rel="stylesheet">
<link href="resources/plugins/css/swiper.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/plugins/css/animate.min.css">
<link rel="stylesheet" href="resources/plugins/css/nivo-lightbox.css">
<link rel="stylesheet" href="resources/plugins/css/nivo_themes/default/default.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<!-- Font Awesome Style -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<body>
<div class="loader loader-bg">
  <div class="loader-inner ball-clip-rotate-pulse">
    <div></div>
    <div></div>
  </div>
</div>

<!-- Top Navigation -->
    <nav class="navbar navbar-toggleable-md mb-4 top-bar navbar-static-top sps sps--abv">
        <div class="container">
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarCollapse1" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <a class="navbar-brand1" href="${pageContext.request.contextPath}/MainList">Poly<span>Play</span></a>
      <div class="collapse navbar-collapse" id="navbarCollapse1">
        <ul class="navbar-nav ml-auto">
         <li class="nav-item active"> <a class="nav-link1" href="${pageContext.request.contextPath}/MainList">Home<span class="sr-only">(current)</span></a> </li>
        <li class="dropdown nav-item">
                      <a href="#pablo" class="dropdown-toggle nav-link1" data-toggle="dropdown">장르</a>
                      <div class="dropdown-menu">
                        <a href="${pageContext.request.contextPath}/ContentsList?gidx=1" class="dropdown-item">액션</a> 
                        <a href="${pageContext.request.contextPath}/ContentsList?gidx=2" class="dropdown-item">스릴러</a>
                        <a href="${pageContext.request.contextPath}/ContentsList?gidx=3" class="dropdown-item">SF판타지</a>
                        <a href="${pageContext.request.contextPath}/ContentsList?gidx=4" class="dropdown-item">공포</a>
                        <a href="${pageContext.request.contextPath}/ContentsList?gidx=5" class="dropdown-item">코미디</a>
                        <a href="${pageContext.request.contextPath}/ContentsList?gidx=6" class="dropdown-item">로맨스</a>
                        <a href="${pageContext.request.contextPath}/ContentsList?gidx=7" class="dropdown-item">드라마</a>
                        <a href="${pageContext.request.contextPath}/ContentsList?gidx=8" class="dropdown-item">애니메이션</a>
                     
                      </div>
                    </li>
 		<li class="nav-item"> <a class="nav-link1" ></a></li>
        <li class="nav-item"> <a class="nav-link1" ></a></li>
        <li class="nav-item"> <a class="nav-link1" ></a></li>
       	<li class="nav-item"> <a class="nav-link1" ></a></li>
        <li class="nav-item"> <a class="nav-link1" ></a></li>
        <li class="nav-item"> <a class="nav-link1" ></a></li>
        <li class="nav-item"> <a class="nav-link1" ></a></li>
        <li class="nav-item"> <a class="nav-link1" ></a></li>
        <li class="dropdown nav-item">
                      <a href="#pablo" class="dropdown-toggle nav-link1" data-toggle="dropdown">마이페이지</a>
                      <div class="dropdown-menu">
                        <a href="${pageContext.request.contextPath}/MyBasketList" class="dropdown-item">장바구니</a> 
                        <a href="${pageContext.request.contextPath}/MyWishList" class="dropdown-item">찜한작품</a>
                        <a href="${pageContext.request.contextPath}/MyContentsList" class="dropdown-item">구입한작품</a>
                        <a href="${pageContext.request.contextPath}/MyOrderList" class="dropdown-item">주문내역</a>
                        <a href="${pageContext.request.contextPath}/MemberModify" class="dropdown-item">회원정보수정</a>
                     
                     
                      </div>
                    </li>
         <c:set var="midx" value="${sMemberMidx}" />
        <c:choose>
    	<c:when test='${sMemberMidx == null}'>            
        <li class="nav-item"> <a class="nav-link1" href="${pageContext.request.contextPath}/MemberLogin">로그인</a></li>
        </c:when>
   		
    	<c:when test='${sMemberMidx != null}'>  
    	<li class="nav-item"> <a class="nav-link1" href="${pageContext.request.contextPath}/MemberLogout">로그아웃</a></li>
        </c:when>
		</c:choose>
        </ul>
      </div>
            </div>
    </nav>

    
<!-- Swiper Silder
    ================================================== --> 
<!-- Slider main container -->
<!--배너 파트  -->
<div class="swiper-container main-slider" id="myCarousel">
  <div class="swiper-wrapper">
    <div class="swiper-slide slider-bg-position" style="background:url('resources/image/1111.jpg')" data-hash="slide1">
     
    </div>
    <div class="swiper-slide slider-bg-position" style="background:url('resources/image/2222.jpg')" data-hash="slide2">
      
    </div>
    <div class="swiper-slide slider-bg-position" style="background:url('resources/image/3333.jpg')" data-hash="slide3">
      
    </div>
  </div>
  <!-- Add Pagination -->
  <div class="swiper-pagination"></div>
  <!-- Add Navigation -->
  <div class="swiper-button-prev"><i class="fa fa-chevron-left" ></i></div>
  <div class="swiper-button-next"><i class="fa fa-chevron-right"></i></div>
</div>

<!-- Benefits
    ================================================== -->
<section class="service-sec" id="benefits">
  <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="heading text-md-center text-xs-center">
      <h2><small>최근 업데이트 된 작품</small>지금 구매하세요</h2>
    </div>
        </div>
        
       
    <c:forEach items="${alist1}" var="cvo">
      <div class="col-md-3 blog-box">
        <div class="blog-image-block"> <a href="${pageContext.request.contextPath}/ContentsInfo?cidx=${cvo.cidx}"><img src="resources/contents${cvo.cImage}" class="img-fluid"></a> </div>
		<h3 class="blog-title"><a href="${pageContext.request.contextPath}/ContentsPlay?cidx=${cvo.cidx}">${cvo.cSubject}"</a></h3>
        
      </div>
     </c:forEach>
     
    </div>
    <!-- /.row --> 
  </div>
  
</section>
<section class="service-sec" id="benefits">
  <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="heading text-md-center text-xs-center">
      <h2><small>요즘 뜨는 컨텐츠</small>지금 구매하세요</h2>
    </div>
        </div>


    <c:forEach items="${alist2}" var="cvo">
      <div class="col-md-3 blog-box">
        <div class="blog-md-4"> <a href="${pageContext.request.contextPath}/ContentsInfo?cidx=${cvo.cidx}"><img src="${pageContext.request.contextPath}/displayFile?fileName=${cvo.cImage}" alt="" class="img-fluid" ></a> </div>
		<h3 class="blog-title"><a href="${pageContext.request.contextPath}/ContentsPlay?cidx=${cvo.cidx}">${cvo.cSubject}"</a></h3>
        
      </div>
     </c:forEach>
     
    </div>
    <!-- /.row --> 
  </div>
  
</section>

<section class="service-sec" id="benefits">
  <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="heading text-md-center text-xs-center">
      <h2><small>평가가 높은 영화</small>지금 구매하세요</h2>
    </div>
        </div>
        
       
    <c:forEach items="${alist3}" var="cvo">
      <div class="col-md-3 blog-box">
        <div class="blog-image-block"> <a href="${pageContext.request.contextPath}/ContentsInfo?cidx=${cvo.cidx}"><img src="${pageContext.request.contextPath}/displayFile?fileName=${cvo.cImage}" alt="" class="img-fluid"></a> </div>
		<h3 class="blog-title"><a href="${pageContext.request.contextPath}/ContentsPlay?cidx=${cvo.cidx}">${cvo.cSubject}"</a></h3>
        
      </div>
     </c:forEach>
     
    </div>
    <!-- /.row --> 
  </div>
  
</section>
<section class="service-sec" id="benefits">
  <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="heading text-md-center text-xs-center">
      <h2><small>폴리 회원들이 많이 시청하는 영화</small>지금 구매하세요</h2>
    </div>
        </div>
        
       
    <c:forEach items="${alist4}" var="cvo">
      <div class="col-md-3 blog-box">
        <div class="blog-image-block"> <a href="${pageContext.request.contextPath}/ContentsInfo?cidx=${cvo.cidx}"><img src="${pageContext.request.contextPath}/displayFile?fileName=${cvo.cImage}" alt="" class="img-fluid"></a> </div>
		<h3 class="blog-title"><a href="${pageContext.request.contextPath}/ContentsPlay?cidx=${cvo.cidx}">${cvo.cSubject}"</a></h3>
        
      </div>
     </c:forEach>
     
    </div>
    <!-- /.row --> 
  </div>
  
</section>

<footer>
  <div class="container">
   
    <div class="row copy-footer">
      <div class="col-sm-6 col-md-3"><a href="${pageContext.request.contextPath}/BoardNoticeList">고객센터</a></div>	
      <div class="col-sm-6 col-md-3"> &copy;<script type="text/javascript">document.write(new Date().getFullYear());</script> <a target="_blank" rel="nofollow" href="https://grafreez.com/"></a> TEAM POLYPLAY </div>
      <div class="col-sm-6 col-md-3 pull-right text-xs-right">Created with <i class="fa fa-heart"></i></div>
    </div>
  </div>
</footer>

<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="resources/plugins/js/jquery.min.js" ></script> 
<script src="resources/plugins/js/bootstrap.min.js"></script> 
<script src="resources/plugins/js/scrollPosStyler.js"></script> 
<script src="resources/plugins/js/swiper.min.js"></script> 
<script src="resources/plugins/js/isotope.min.js"></script> 
<script src="resources/plugins/js/nivo-lightbox.min.js"></script> 
<script src="resources/plugins/js/wow.min.js"></script> 
<script src="resources/plugins/js/core.js"></script> 

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug --> 
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
