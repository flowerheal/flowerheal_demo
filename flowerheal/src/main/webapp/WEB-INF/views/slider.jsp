<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
.item {
	background: #fff;
	padding: 1rem;
}
.owl-nav{
    position: absolute;
    top: 10rem;
    margin: 0 !important;
		display: flex;
		width: 100%;
    justify-content: space-between;
}
.owl-nav i{
    font-size: 2rem;
}


@media (min-width: 768px) {	
	.owl-nav{
		width : 105%;
	}
.instaCarousel{
	width: 80%;
}
}
</style>

<section class="instaCarousel mx-auto my-3">
<h3 class="text-center">패키지 정기구독 후기</h3>

	<div class="owl-carousel owl-theme">
	
	
	    <div class="item"><h4><a href="#"><img src="${pageContext.request.contextPath}/resources/img/instar/instar1.jpg"></a></h4></div>
	    <div class="item"><h4><a href=""><img src="${pageContext.request.contextPath }/resources/img/instar/instar2.jpg"></a></h4></div>
	    <div class="item"><h4><a href=""><img src="${pageContext.request.contextPath }/resources/img/instar/instar3.jpg"></a></h4></div>
	    <div class="item"><h4><a href=""><img src="${pageContext.request.contextPath }/resources/img/instar/instar4.jpg"></a></h4></div>
	    <div class="item"><h4><a href=""><img src="${pageContext.request.contextPath }/resources/img/instar/instar5.jpg"></a></h4></div>
	    <div class="item"><h4><a href=""><img src="${pageContext.request.contextPath }/resources/img/instar/instar6.jpg"></a></h4></div>
	    <div class="item"><h4><a href=""><img src="${pageContext.request.contextPath }/resources/img/instar/instar7.jpg"></a></h4></div>
	    <div class="item"><h4><a href=""><img src="${pageContext.request.contextPath }/resources/img/instar/instar8.jpg"></a></h4></div>
	    <div class="item"><h4><a href=""><img src="${pageContext.request.contextPath }/resources/img/instar/instar9.jpg"></a></h4></div>
	    <div class="item"><h4><a href=""><img src="${pageContext.request.contextPath }/resources/img/instar/instar10.jpg"></a></h4></div>
	</div>
</section>
<script>
$(document).ready(function(){
	//default settings:
	autoplay:false
	autoplayTimeout:5000
	autoplayHoverPause:false
	
	var owl = $('.owl-carousel');
	owl.owlCarousel({
/* 		stagePadding: 50, */
	    center:false,
	    dots: false,
	    loop:true,
	    nav:true,
	    margin:10,
	    autoWidth:true,
	    autoplay:true,
	    autoplayTimeout:2500,
	    autoplayHoverPause:true,
	    responsiveClass:true,
	    responsive:{
	        0:{
	            items:1,
	            //nav:true
	        },
	         600:{
	             items:2,
	         },
	        1000:{
	            items:3,
	            loop:true
	        }
	    }
	});

});
</script>