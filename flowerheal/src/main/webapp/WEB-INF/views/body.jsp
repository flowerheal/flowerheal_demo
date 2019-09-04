<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="main" class="album py-5">
    <div class="container row">
			<h1 class="col-md-12 my-3 d-flex justify-content-center">Product</h1>
        <div class="col-md-6 my-md-2 col-lg-5 m-lg-4">
          <div class="card mb-4 shadow-sm">
          	<a href="${pageContext.request.contextPath }/product/1">
          	<img src="${pageContext.request.contextPath }/resources/img/product/product1/product1_banner.jpg"
          			 class="bd-placeholder-img card-img-top" width="100%" height="100%" alt="#" />
          			 </a>
            <div class="card-body">
              <p class="card-title h4">코코낸내 허니잠 세트</p>
              <div class="row d-flex justify-content-between align-items-center">
              <p class="card-text">10월의 주제 : 레드벨벳<br/> 붉은 융단을 타고 잠의 나라로</p>
                <div class="btn-group row mr-0"> 
                  <!-- <button type="button" class="btn btn-sm btn-outline-secondary"> -->
            
                  <!-- </button> -->
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6 my-md-2 col-lg-5 m-lg-4">
          <div class="card mb-4 shadow-sm">
            <img src="${pageContext.request.contextPath }/resources/img/product/blank.png"
          			 class="bd-placeholder-img card-img-top" width="100%" height="100%" alt="#" />
            <div class="card-body">
              <p class="card-title h4"> </p>
              <div class="row d-flex justify-content-between align-items-center">
              <p class="card-text"> <br/>  </p>
                <div class="btn-group row mr-0">
                  <button type="button" class="btn btn-sm btn-outline-secondary">더보기</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6 my-md-2 col-lg-5 m-lg-4">
          <div class="card mb-4 shadow-sm">
           	<img src="${pageContext.request.contextPath }/resources/img/product/blank.png"
          			 class="bd-placeholder-img card-img-top" width="100%" height="100%" alt="#" />
            <div class="card-body">
              <p class="card-title h4"> </p>
              <div class="row d-flex justify-content-between align-items-center">
              <p class="card-text">  <br/>  </p>
                <div class="btn-group row mr-0">
                  <button type="button" class="btn btn-sm btn-outline-secondary">더보기</button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-md-6 my-md-2 col-lg-5 m-lg-4">
          <div class="card mb-4 shadow-sm">
            <img src="${pageContext.request.contextPath }/resources/img/product/blank.png"
          			 class="bd-placeholder-img card-img-top" width="100%" height="100%" alt="#" />
            <div class="card-body">
              <p class="card-title h4"> </p>
              <div class="row d-flex justify-content-between align-items-center">
              <p class="card-text">  <br/>  </p>
                <div class="btn-group row mr-0">
                  <button type="button" class="btn btn-sm btn-outline-secondary">더보기</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
</section>
<jsp:include page="slider.jsp" />

</main>