<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
.item {
	height: 21rem;
	background: #4DC7A0;
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
.instaCarousel{
	width: 80%;
}
}
</style>

<section class="instaCarousel mx-auto my-3">
	<div class="owl-carousel owl-theme">
	    <div class="item"><h4>1</h4></div>
	    <div class="item"><h4>2</h4></div>
	    <div class="item"><h4>3</h4></div>
	    <div class="item"><h4>4</h4></div>
	    <div class="item"><h4>5</h4></div>
	    <div class="item"><h4>6</h4></div>
	    <div class="item"><h4>7</h4></div>
	    <div class="item"><h4>8</h4></div>
	    <div class="item"><h4>9</h4></div>
	    <div class="item"><h4>10</h4></div>
	    <div class="item"><h4>11</h4></div>
	    <div class="item"><h4>12</h4></div>
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
		stagePadding: 50,
	    center:true,
	    dots: false,
	    loop:true,
	    nav:true,
	    margin:10,
	    autoplay:true,
	    autoplayTimeout:2500,
	    autoplayHoverPause:true,
	    responsiveClass:true,
	    responsive:{
	        0:{
	            items:1,
	            //nav:true
	        },
	        // 600:{
	        //     items:3,
	        //     //nav:false
	        // },
	        1000:{
	            items:3,
	            //nav:true,
	            //loop:false
	        }
	    }
	});

});
</script>