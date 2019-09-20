<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath }/resources/css/index.css" rel="stylesheet">
<style>
.carousel,
.carousel-inner,
.carousel-item,
.carousel-item img {
  min-height: 20rem; 
  max-height: 30rem; 
}

@media (max-width: 768px) {

	.carousel-item img{
	  width: 160%;
	}
	
	.carousel-caption h1,
	.carousel-caption  p{
		background-color: rgba(255, 255, 255, 0.5);
	}
}
</style>
<main role="main">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
       <div class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
       
        <img src="${pageContext.request.contextPath }/resources/img/main1.jpg" width="100%" height="100%" />
      </div>
        <div class="container">
          <div class="carousel-caption">
            <h1 class="text-warning">꽃미힐미에서 힐링하세요.</h1>
            <p class="text-muted"> 저희 꽃미힐미는 고객의 1:1 맞춤으로 최적의 구독상품을 제공합니다.<br> 매달 몸상태와 정신이 맑아지는 경험을 해보세요.</p>
           <!--  <p><a class="btn btn-lg btn-primary" href="#" role="button">구독상품보러가기</a></p> -->
          </div>
        </div>
      </div>
      <div class="carousel-item">
       <div class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
          <img src="${pageContext.request.contextPath }/resources/img/main4.jpg" width="100%" height="100%" />       
        </div>
        <div class="container">
          <div class="carousel-caption text-left">
            <h1>꽃미힐미 One-Day Class</h1>
            <p>가정의 마음의 평화를 위해 꽃꽃이 클래스를 해보아요.</p>
           <!--  <p><a class="btn btn-lg btn-primary" href="#" role="button"> One-Day Class</a></p> -->
          </div>
        </div>
      </div>
      <div class="carousel-item">
      <div class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777">
         <img src="${pageContext.request.contextPath }/resources/img/main2.jpg" width="100%" height="100%" /> 
       </div>
        <div class="container">
          <div class="carousel-caption">
            <h1 style="color:#8C8C8C;">이제 인테리어도 꽃미힐미에서</h1>
            <p class="text-muted">마음의 평화는 주거공간으로 부터 시작입니다.<br> 소소한 상품으로 집에게도 힐링을 해주세요.</p>
          <!--   <p><a class="btn btn-lg btn-primary" href="#" role="button">인테리어 소품보러가기</a></p> -->
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

		

<section class="row" id="recommendBanner ">
	<div class="row col-md-10 col-lg-9 col-xl-8 my-5">
		<a href="${pageContext.request.contextPath }/product/3">
		<img class="col p-0 m-0" src="${pageContext.request.contextPath }/resources/img/banner.jpg" alt="추천배너" /></a>
	</div>
</section>

<div id="arrowToProduct" class="m-4 text-center">
	<a href="#main">
		<i	class="fas fa-arrow-circle-down h2 rounded-circle"></i>
	</a>
</div>

<script>
$("a[href^='#main']").click(function(e){
	e.preventDefault();
	let target = $(this.hash);
	$('html,body').animate({scrollTop: target.offset().top},500);
});
</script>
