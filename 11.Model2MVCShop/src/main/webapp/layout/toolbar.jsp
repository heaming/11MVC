<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header id="header"
	class="fixed-top d-flex align-items-center header-transparent"
	style="background-color: white;">
	<div class="container d-flex align-items-center">

		<h1 class="logo me-auto">
			<a href="/index.jsp">MVC v.11</a>
		</h1>
		<!-- Uncomment below if you prefer to use an image logo -->
		<!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

		<nav id="navbar" class="navbar order-last order-lg-0">
			<ul>
				<li><a class="nav-link scrollto active" href="/index.jsp">Home</a></li>
				<c:if test="${ !empty user }">
					<!-- :: admin  :: -->
					<c:if test="${user.role == 'admin'}">
						<li class="dropdown"><a href="#"><span>USERS</span> <i
								class="bi bi-chevron-down"></i></a>
							<ul>
								<li><a href="#">회원 정보 조회</a></li>
								<li class="dropdown"><a href="#"><span>Deep Drop
											Down</span> <i class="bi bi-chevron-right"></i></a>
									<ul>
										<li><a href="#">Deep Drop Down 1</a></li>
										<li><a href="#">Deep Drop Down 2</a></li>
									</ul></li>
							</ul></li>
					</c:if>
				</c:if>
				<!-- user 아닌 경우 -->
				<c:if test="${ empty user }">
					<li class="dropdown"><a href="#"><span>PRODUCT</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li class="dropdown"><a href="#"><span>상품 검색</span> <i
									class="bi bi-chevron-right"></i></a>
								<ul>
									<li><a href="#">모든 카테고리</a></li>
									<li><a href="#">커피</a></li>
									<li><a href="#">치킨</a></li>
									<li><a href="#">전자기기</a></li>
								</ul></li>
						</ul>
				</c:if>
				<!-- user 경우 -->
				<c:if test="${ !empty user }">
					<li class="dropdown"><a href="#"><span>PRODUCT</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="#">상품 등록</a></li>
							<li class="dropdown"><a href="#"><span>상품 검색</span> <i
									class="bi bi-chevron-right"></i></a>
								<ul>
									<li><a href="#">모든 카테고리</a></li>
									<li><a href="#">커피</a></li>
									<li><a href="#">치킨</a></li>
									<li><a href="#">전자기기</a></li>
								</ul></li>
							<li><a href="#">찜 목록</a></li>
							<c:if test="${user.role == 'admin'}">
								<li><a href="#">상품 관리</a></li>
							</c:if>
						</ul></li>

					<li class="dropdown"><a href="#"><span>PURCHASE</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<c:if test="${user.role == 'user'}">
								<li><a href="#">내가 판매한 상품</a></li>
								<li><a href="#">내가 구입한 상품</a></li>
							</c:if>
							<c:if test="${user.role == 'admin'}">
								<li><a href="#">모든 거래 내역</a></li>
							</c:if>
						</ul></li>
					<li><a class="nav-link scrollto" href="#">마이페이지</a></li>
					<li><a class="nav-link scrollto" href="#"><i
							class="bi bi-box-arrow-right"></i>logout</a></li>
				</c:if>
				<c:if test="${ empty user }">
					<li><a class="nav-link scrollto" href="#">회원가입</a></li>
					<li><a class="nav-link scrollto" href="#"><i
							class="bi bi-box-arrow-right"></i>login</a></li>
				</c:if>
			</ul>
			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav>
		<!-- .navbar -->

		<div class="social-links">
			<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
				href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
				href="#" class="linkedin"><i class="bi bi-linkedin"></i></a> <a
				href="https://www.instagram.com/mia_imaeh/" class="instagram"><i class="bi bi-instagram"></i></a>
		</div>

	</div>
</header>
<!-- End Header -->


<script type="text/javascript">
	
	  	//============= 회원가입 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('회원가입')").on("click" , function() {
				self.location = "/user/addUser"
			});
			
			$("a[href='#' ]:contains('중고거래 시작')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('login')").on("click" , function() {
				self.location = "/user/login"
			});
		});
	   	
   	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('logout')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원 정보 조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회 Event  처리 =============	
	 	$( "a:contains('마이페이지')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
		//=============  상품등록 Event  처리 =============	
	 	$( "a:contains('상품 등록')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/product/addProduct");
		});
		
		//=============  상품관리 Event  처리 =============	
	 	$( "a:contains('상품 관리')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/product/listProduct?");
		});
		
		//=============  모든 카테고리 vent  처리 =============	
	 	$( "a:contains('모든 카테고리')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/product/listProduct");
		});
		
		//============= 내가 판매한 상품 Event  처리 =============	
	 	$( "a:contains('내가 판매한 상품')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/purchase/listSale");
		});
		
		//=============  내가 구입한 상품 Event  처리 =============	
	 	$( "a:contains('내가 구입한 상품')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/purchase/listPurchase?menu=manage");
		});
		
		//=============  모든 거래 내역 Event  처리 =============	
	 	$( "a:contains('모든 거래 내역')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/purchase/listSale");
		});
		
		
	</script>
