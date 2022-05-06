<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="EUC-KR">
<title>상품상세조회</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="/assets/vendor/aos/aos.css" rel="stylesheet" type="text/css">
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

 <!-- Template Main CSS File -->
<link href="/assets/css/style.css" rel="stylesheet">
<script type="text/javascript">

	// 확인
	$(function() {
		$( "button:contains('뒤로')" ).on("click" , function() {
			history.go(-1);
		})
	});

	// 수정 || 구매
	$(function() {
		$("#buyOrEdit:contains('수정')" ).on("click" , function() {
			console.log("수정");
			self.location = "/product/updateProduct?prodNo=${product.prodNo}&menu=${menu}";
		});
		
		$("#buyOrEdit:contains('구매')" ).on("click" , function() {
			console.log("구매");	
			self.location = "/purchase/addPurchase?prodNo=${product.prodNo}&menu=${menu}";
		});
	});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />


  <main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">${product.prodCode}</a></li>
          <li>상품 상세 정보</li>
        </ol>
        <h2>${product.prodName}</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-8">
            <div class="portfolio-details-slider swiper">
              <div class="swiper-wrapper align-items-center">
				<c:choose>
					<c:when test="${!empty product.fileName}">
					<c:forEach items="${product.fileName}" var="file">
						<div class="swiper-slide">
							<img src="/images/uploadFiles/${file}" class="img-fluid rounded thumbnail-image"/>
						</div>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<img src="/images/uploadFiles/pensoo.jpg" class="img-fluid rounded thumbnail-image">
					</c:otherwise>
				</c:choose>
              </div>
              <div class="swiper-pagination"></div>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="portfolio-info">
            	<fmt:formatNumber var="discount" pattern="###" value="${(product.cost-product.price)/product.cost*100}" />
				<h3>${discount}% 할인 중</h3>
              <ul>
                <li><strong>판매가</strong>: ${product.price}원</li>
                <li><strong>유효기간</strong>: ${product.dueDate.substring(0,4)}년 ${product.dueDate.substring(4,6)}월 ${product.dueDate.substring(6)}일까지</li>
                <li><strong>상세정보</strong>: ${product.prodDetail}</li>
                <li><strong>판매자</strong>: <a href="/user/getUser?userId=${ product.sellerId}">${product.sellerId }</a></li>
              </ul>
            </div>
            <div class="d-flex justify-content-end pt-3">
		 		<button id="buyOrEdit" class="btn btn-outline-info btn-sm ml-3">
		 			<c:if test="${user.userId.equals(product.sellerId)}">수정
					</c:if>
					<c:if test="${user.userId.equals(product.sellerId) == false}">구매					
					</c:if>
		 		</button>
		 		<button type="button" class="ml-3 btn btn-outline-secondary btn-sm ">뒤로</button>
      		</div>
        </div>  
        </div>
      </div>
    </section><!-- End Portfolio Details Section -->
  </main><!-- End #main -->


</body>
</html>