
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />

 <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
		      
		/* Featurettes
		------------------------- */
		
		.featurette-divider {
		  margin: 5rem 0; /* Space out the Bootstrap <hr> more */
		}
		
		/* Thin out the marketing headings */
		.featurette-heading {
		  font-weight: 300;
		  line-height: 1;
		  letter-spacing: -.05rem;
		}
		
		
		/*h2 폰트 스타일*/
		.featurette-heading{
		font-weight:bold;
		color:#747474;
		}
		
		.eng{
		color:#D5D5D5;
		font-size:30px;
		}
		
	    .s-lead{ /* 회사 소개 내용글*/
	    
	    }
		
				
    </style>
    
     <!-- START THE FEATURETTES -->

     <hr class="featurette-divider" style="border-top: 1px solid #fff;"> 

    <div class="row pt-5 featurette center-block">
      <div class="col-md-7">
        <h2 class="featurette-heading" >우리 꽃미힐미와 함께 힐링하세요. <span class="eng">I hope you happiness.</span></h2>
       <br><br> <p class="lead"><span class="s-lead"> 이제 꽃도 구독하는 시대입니다.</span> 일상 생활이 무료하고 회사때문에 스트레스에 시달리는 당신을 위하여
                         우리 꽃미힐미가 당신에게 힘이되기위해 꽃을 준비했습니다.<br> 스트레스를 풀고싶지만 여행, 운동, 연애 ,공부도 회사일로 마음데로
                         시간낼 수 없어 스트레스만 쌓여가고 있지 않으신가요 ? 그래서 꽃미힐미는 <br><span class="s-lead">구독시스템으로 알아서 구독자분들에게
                         정기적으로 꽃을 보내드립니다.</span> 일일히 내가 신청하지않아도 선물처럼 꽃을 보내드립니다.
                          그냥 꽃이 아니라 과학적으로 증명된 재료로 계절마다 몸과 정신에 좋은 영향을 주는
                          꽃을 준비해서 구독자분에게 작은 행복을 드리고 싶습니다.</p>
      </div>
      <div class="col-md-4">
       <!--  <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg> -->
       <img src="${pageContext.request.contextPath }/resources/img/product/aboutus11.jpg" class="img-fluid" alt="Responsive image">
    
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette center-block">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading" >작은 소품으로 색다른 기분을 느껴보세요. <span class="eng">See for yourself.</span></h2>
       <br><br> <p class="lead"> 꽃다발과 함께 작은 소품들로 준비하여 구독자분들께 가성비 있게 행복을 좀더 커질 수 있게 준비했습니다.
                         저희 꽃미힐미는 꽃다발 디자인과 작은 소품들의 디자인도 직접하여 판매합니다.<br> <span class="s-lead">티백,미니화분,천연비누, 인테리어 소품</span> 등 모두
                         디자이너들을 두어 좋은 질의 재료와 신체에 접속해도 무해한<span class="s-lead"> 천연재료</span>들로만 판매상품을 만듭니다. 
                         임산부들과 어린아이들을 위해 저희 꽃미힐미를 이용해주세요.</p>
      </div>
      <div class="col-md-4 order-md-1 ">
        <!-- <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg> -->
      <img src="${pageContext.request.contextPath }/resources/img/product/aboutus22.jpg" class="img-fluid" alt="Responsive image">
    
     
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette center-block">
      <div class="col-md-7">
        <h2 class="featurette-heading" >당신이 마시는 물도 소중해야합니다.<span class="eng">How about your water?</span></h2>
        <br><br><p class="lead">음식처럼 마시는 것도 중요한것도 알고계신지요. 이제는 마실 물도 신경쓰는 시대입니다. <br>
                       정수기도 믿을 수 없는 시대에서 우리 꽃미힐미는 직접 만든 이너워터팩을 판매하여 구독자분들의 건강까지 신경씁니다.
                       카페인과 각종 화학제품들로 쌓여진 시중에 파는 티백과는 확연히 다르게 우리의 신체를 위해 조금이라도 더 좋은 물을 제공하고픈 마음에 계절마다 
                        각종 비타민이 풍부한 꽃차 과일차를 준비하였습니다. <span class="s-lead">방부제 NO! 카페인 NO! 각종 화학제품 NO!</span> <br> 홈페이지에 찾아오셔서 각 월마다 준비한 정기구독 패키지를
                        확인해보세요!</p>
      </div>
      <div class="col-md-4">
<%--         <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" data-src="${pageContext.request.contextPath }/resources/img/product/aboutus11.jpg"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
     --%>
     <img src="${pageContext.request.contextPath }/resources/img/product/aboutus33.jpg" class="img-fluid" alt="Responsive image">
    
      </div>
    </div>
    
    
   
    <hr class="featurette-divider" style="border-top: 1px solid #fff;">

    <!-- /END THE FEATURETTES -->

<jsp:include page="../footer.jsp" />