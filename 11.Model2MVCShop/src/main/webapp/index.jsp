<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
<c:if test="${ ! empty user }">
	<jsp:forward page="main.jsp" />
</c:if>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<link rel="favicon" href="favicon.ico">
<link rel="icon" href="favicon.ico" type="image/x-icon" sizes="16x16">
<!-- 참조 : http://getbootstrap.com/css/   -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="/assets/vendor/aos/aos.css" rel="stylesheet" type="text/css">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

 <!-- Template Main CSS File -->
 <link href="assets/css/style.css" rel="stylesheet">


<!--  ///////////////////////// CSS ////////////////////////// -->
<style></style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript"></script>

</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />
  <section id="hero" class="clearfix">
    <div class="container d-flex h-100">
      <div class="row justify-content-center align-self-center" data-aos="fade-up">
        <div class="col-lg-6 intro-info order-lg-first order-last" data-aos="zoom-in" data-aos-delay="100">
          <h2>당신 근처의<br>중고 거래<span>  기프티콘의 민족</span></h2>
          <div>
            <a href="#" class="btn-get-started scrollto">중고거래 시작</a>
          </div>
        </div>

        <div class="col-lg-6 intro-img order-lg-last order-first" data-aos="zoom-out" data-aos-delay="200">
          <img src="/assets/img/baemin_sns.jpg" alt="" class="img-fluid" style="max-width: 85%; height: auto;">
        </div>
      </div>

    </div>
  </section><!-- End Hero -->


 <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container" data-aos="fade-up">
        <div class="row g-5">
          <div class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100">
            <div class="box">
              <div class="icon" style="background: #fcfaee;">
                <!-- <i class="bi bi-briefcase" style="color: #ff689b;"></i> -->
                <i class="bi bi-cup-fill" style="color: #473d1a;"></i>
              </div>
              <h4 class="title"><a href="">COFFEE</a></h4>
              <!-- <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p> -->
            </div>
          </div>
          <div class="col-md-6 col-lg-4" data-aos="zoom-in" data-aos-delay="200">
            <div class="box">
              <div class="icon" style="background: #daffdd;">
                <!-- <i class="bi bi-card-checklist" style="color: #e98e06;"></i> -->
                <img src="assets/img/starbucks.png" style="height: 36px; width: 36px;"/>
              </div>
              <h4 class="title"><a href="">STARBUCKS</a></h4>
              <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="box">
              <div class="icon" style="background: #e6fdfc;">
                <!-- <i class="bi bi-bar-chart" style="color: #3fcdc7;"></i> -->
                <img src="assets/img/twosomeplace.png" style="height: 36px; width: 36px;"/>
              </div>
              <h4 class="title"><a href="">TWOSOME PLACE</a></h4>
              <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 wow" data-aos="zoom-in" data-aos-delay="100">
            <div class="box">
              <div class="icon" style="background: #fff4b4;">
                <!-- <i class="bi bi-binoculars" style="color:#41cf2e;"></i> -->
                <img src="assets/img/chicken-leg.png" style="height: 36px; width: 36px;"/>
              </div>
              <h4 class="title"><a href="">CHICKEN</a></h4>
              <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-4" data-aos="zoom-in" data-aos-delay="200">
        <div class=" box">
            <div class="icon" style="background: #e1eeff;">
              <!-- <i class="bi bi-brightness-high" style="color: #2282ff;"></i> -->
              <img src="assets/img/bhc.png" style="height: 38px; width: 38px;"/>
            </div>
            <h4 class="title"><a href="">BHC</a></h4>
            <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
          </div>
        </div>

        <div class="col-md-6 col-lg-4" data-aos="zoom-in" data-aos-delay="300">
          <div class="box">
            <div class="icon" style="background: #ecebff;">
              <!-- <i class="bi bi-calendar4-week" style="color: #8660fe;"></i> -->
              <img src="assets/img/bbq.png" style="height: 38px; width: 38px;"/>
            </div>
            <h4 class="title"><a href="">BBQ</a></h4>
            <p class="description">Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi</p>
          </div>
        </div>

      </div>

      </div>
    </section><!-- End Services Section -->	
  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>	
</body>

</html>