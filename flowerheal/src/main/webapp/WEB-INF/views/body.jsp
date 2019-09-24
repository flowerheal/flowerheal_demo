<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="main" class="album py-5">

  <div class="row my-5">
	<div class="col-md-12">
  <%--  <img src="${pageContext.request.contextPath }/resources/img/" 
   alt="정기구독방법 이미지" />
 --%>
  <h3 class="text-center">당신에게 맞는 구독상품은 ?</h3>
  </div>
  </div>

   
    <div class="container row">
			<h2 class="col-md-12 my-3 d-flex justify-content-center">정기구독 패키지</h2>
        <div class="col-md-6 my-md-2 col-lg-5 m-lg-4">
          <div class="card mb-4 shadow-sm">
          	<a href="${pageContext.request.contextPath }/product/1">
          	<img src="${pageContext.request.contextPath }/resources/img/product/product1/product-1.jpg"
          			 class="bd-placeholder-img card-img-top" width="100%" height="100%" alt="#" />
          			 </a>
            <div class="card-body">
              <p class="card-title">코코낸내 허니잠 패키지</p>
              <div class="row d-flex justify-content-between align-items-center">
              <p class="card-text">10월의 주제 : 레드벨벳<br/> 붉은 융단을 타고 잠의 나라로</p>
                <!-- <div class="btn-group row mr-0"> 
                  <button type="button" class="btn btn-sm btn-outline-secondary">
            
                  </button>
                </div> -->
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6 my-md-2 col-lg-5 m-lg-4">
          <div class="card mb-4 shadow-sm">
          <a href="${pageContext.request.contextPath }/product/2">
            <img src="${pageContext.request.contextPath }/resources/img/product/product1/product-2.jpg"
          			 class="bd-placeholder-img card-img-top" width="100%" height="100%" alt="#" />
          			 </a>
            <div class="card-body">
              <p class="card-title">활력뿜뿜 치어업 패키지</p>
              <div class="row d-flex justify-content-between align-items-center">
              <p class="card-text">10월의 주제 : 붉은 노을처럼 난 너를 사랑해<br/> 을날의 아름다운 붉은 노을을 꽃다발에 담았습니다.  </p>
                <!-- <div class="btn-group row mr-0">
                  <button type="button" class="btn btn-sm btn-outline-secondary">더보기</button>
                </div> -->
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6 my-md-2 col-lg-5 m-lg-4">
          <div class="card mb-4 shadow-sm">
          <a href="${pageContext.request.contextPath }/product/3" >
           	<img src="${pageContext.request.contextPath }/resources/img/product/product1/product-3.jpg"
          			 class="bd-placeholder-img card-img-top" width="100%" height="100%" alt="#" />
          			 </a>
            <div class="card-body">
              <p class="card-title">피부리셋 무지개 패키지 </p>
              <div class="row d-flex justify-content-between align-items-center">
              <p class="card-text">10월의 주제 : Over the Rainbow  <br/>눈으로, 입으로, 피부로 즐기는 당신만을 위한 무지개 </p>
                <!-- <div class="btn-group row mr-0">
                  <button type="button" class="btn btn-sm btn-outline-secondary">더보기</button>
                </div> -->
              </div>
            </div>
          </div>
        </div>

        <div class="col-md-6 my-md-2 col-lg-5 m-lg-4">
          <div class="card mb-4 shadow-sm">
          <a href="${pageContext.request.contextPath }/product/4" >
            <img src="${pageContext.request.contextPath }/resources/img/product/product1/product-4.jpg"
          			 class="bd-placeholder-img card-img-top" width="100%" height="100%" alt="#" />
          			 </a>
            <div class="card-body">
              <p class="card-title">나만의 공간 패키지 </p>
              <div class="row d-flex justify-content-between align-items-center">
              <p class="card-text">10월의 주제: Make clean air and my space  <br/>
                나만의 공간을 힐링해보세요.  </p>
                <!-- <div class="btn-group row mr-0">
                  <button type="button" class="btn btn-sm btn-outline-secondary">더보기</button>
                </div> -->
              </div>
            </div>
          </div>
        </div>
      </div>
</section>
<jsp:include page="slider.jsp" />

</main>