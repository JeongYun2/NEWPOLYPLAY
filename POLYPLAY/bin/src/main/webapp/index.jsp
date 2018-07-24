<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="service-sec" id="benefits">
  <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="heading text-md-center text-xs-center">
      <h2><small>최근 업데이트 된 작품</small>지금 구매하세요</h2>
    </div>
        </div>
      <div class="col-md-8">
        <div class="row">
            <div class="col-md-6 text-sm-center service-block"> <i class="fa fa-plus" aria-hidden="true"></i>
          <h3>Better Sleep</h3>
          <p>Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe.</p>
        	<p>
        
        </div>
        <div class="col-md-6 text-sm-center service-block"> <i class="fa fa-leaf" aria-hidden="true"></i>
          <h3>Reduces Weight</h3>
          <p>Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe.</p>
        </div>
        <div class="col-md-6 text-sm-center service-block"> <i class="fa fa-leaf" aria-hidden="true"></i>
          <h3>Improves Mood</h3>
          <p>Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe.</p>
        </div>
        <div class="col-md-6 text-sm-center service-block"> <i class="fa fa-bell" aria-hidden="true"></i>
          <h3>Boosts Energy</h3>
          <p>Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe.</p>
        </div>
        </div>
      </div>
      <div class="col-md-4"> <img src="img/side-01.jpg" class="img-fluid" /> </div>
    </div>
    <!-- /.row --> 
  </div>
</section>
<div class="container">

<a href="<%=request.getContextPath() %>/MyBasketList"> 장바구니 고고 </a>

<br>
<br>

<a href="<%=request.getContextPath() %>/MyWishList"> 위시리스트 고고 </a>

<br>
<br>

<a href="<%=request.getContextPath() %>/MyContentsList"> 구입한작품 고고 </a>


<br>
<br>

<a href="<%=request.getContextPath() %>/MyOrderList"> 주문내역 고고 </a>



<br>
<a href="<%=request.getContextPath() %>/ContentsInfo"> 컨텐츠 상세정보 </a>


<br>
<a href="<%=request.getContextPath() %>/ReviewList?cidx=8"> 컨텐츠 리뷰정보  </a>

<br>
<a href="<%=request.getContextPath() %>/MainList"> 홈으로 가기 </a>
<br>
<a href="<%=request.getContextPath() %>/ContentsList"> 장르별 컨텐츠 리스트 </a>

<br>
<a href="<%=request.getContextPath() %>/AdminContentsWrite"> 컨텐츠 등록 </a>
<br>
<a href="<%=request.getContextPath() %>/AdminContentsModify"> 컨텐츠 수정 </a>
<br>
<a href="<%=request.getContextPath() %>/AdminContentsDelete"> 컨텐츠 삭제 </a>
<br>
<a href="<%=request.getContextPath() %>/ContentsPlay"> 컨텐츠 실행 </a>

<br><br><br><br><br>




<a href="<%=request.getContextPath() %>/MemberLogin"> 로그인 </a><br>

<a href="<%=request.getContextPath() %>/MemberJoin"> 회원 가입 </a><br>

<a href="<%=request.getContextPath() %>/MemberIdFind"> 아이디 찾기 </a><br>

<a href="<%=request.getContextPath() %>/MemberPwFind"> 비빌번호 찾기 </a><br>

<a href="<%=request.getContextPath() %>/MemberModify"> 회원 수정 </a><br>

<a href="<%=request.getContextPath() %>/MemberDelete"> 회원 삭제 </a><br>

<br><br>
<a href="<%=request.getContextPath() %>/BoardNoticeList "> 공지사항리스트 </a>
<br>
<a href="<%=request.getContextPath() %>/BoardFAQUserList "> FAQ 리스트 </a>
<br>
<a href="<%=request.getContextPath() %>/BoardInquiryList "> 1:1문의 리스트 </a>
<br>
<a href="<%=request.getContextPath() %>/BoardInquiryWrite "> 1:1문의 작성하기 </a>
</div>
<br>
<br>
</body>
</html>
<%@ include file="../include/footer.jsp" %>