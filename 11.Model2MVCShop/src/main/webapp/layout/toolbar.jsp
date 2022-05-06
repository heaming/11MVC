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
								<li><a href="#">ȸ�� ���� ��ȸ</a></li>
								<li class="dropdown"><a href="#"><span>Deep Drop
											Down</span> <i class="bi bi-chevron-right"></i></a>
									<ul>
										<li><a href="#">Deep Drop Down 1</a></li>
										<li><a href="#">Deep Drop Down 2</a></li>
									</ul></li>
							</ul></li>
					</c:if>
				</c:if>
				<!-- user �ƴ� ��� -->
				<c:if test="${ empty user }">
					<li class="dropdown"><a href="#"><span>PRODUCT</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li class="dropdown"><a href="#"><span>��ǰ �˻�</span> <i
									class="bi bi-chevron-right"></i></a>
								<ul>
									<li><a href="#">��� ī�װ�</a></li>
									<li><a href="#">Ŀ��</a></li>
									<li><a href="#">ġŲ</a></li>
									<li><a href="#">���ڱ��</a></li>
								</ul></li>
						</ul>
				</c:if>
				<!-- user ��� -->
				<c:if test="${ !empty user }">
					<li class="dropdown"><a href="#"><span>PRODUCT</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="#">��ǰ ���</a></li>
							<li class="dropdown"><a href="#"><span>��ǰ �˻�</span> <i
									class="bi bi-chevron-right"></i></a>
								<ul>
									<li><a href="#">��� ī�װ�</a></li>
									<li><a href="#">Ŀ��</a></li>
									<li><a href="#">ġŲ</a></li>
									<li><a href="#">���ڱ��</a></li>
								</ul></li>
							<li><a href="#">�� ���</a></li>
							<c:if test="${user.role == 'admin'}">
								<li><a href="#">��ǰ ����</a></li>
							</c:if>
						</ul></li>

					<li class="dropdown"><a href="#"><span>PURCHASE</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<c:if test="${user.role == 'user'}">
								<li><a href="#">���� �Ǹ��� ��ǰ</a></li>
								<li><a href="#">���� ������ ��ǰ</a></li>
							</c:if>
							<c:if test="${user.role == 'admin'}">
								<li><a href="#">��� �ŷ� ����</a></li>
							</c:if>
						</ul></li>
					<li><a class="nav-link scrollto" href="#">����������</a></li>
					<li><a class="nav-link scrollto" href="#"><i
							class="bi bi-box-arrow-right"></i>logout</a></li>
				</c:if>
				<c:if test="${ empty user }">
					<li><a class="nav-link scrollto" href="#">ȸ������</a></li>
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
	
	  	//============= ȸ������ ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('ȸ������')").on("click" , function() {
				self.location = "/user/addUser"
			});
			
			$("a[href='#' ]:contains('�߰�ŷ� ����')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= �α��� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('login')").on("click" , function() {
				self.location = "/user/login"
			});
		});
	   	
   	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('logout')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ�� ���� ��ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  ����������ȸ Event  ó�� =============	
	 	$( "a:contains('����������')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
		//=============  ��ǰ��� Event  ó�� =============	
	 	$( "a:contains('��ǰ ���')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/product/addProduct");
		});
		
		//=============  ��ǰ���� Event  ó�� =============	
	 	$( "a:contains('��ǰ ����')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/product/listProduct?");
		});
		
		//=============  ��� ī�װ� vent  ó�� =============	
	 	$( "a:contains('��� ī�װ�')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/product/listProduct");
		});
		
		//============= ���� �Ǹ��� ��ǰ Event  ó�� =============	
	 	$( "a:contains('���� �Ǹ��� ��ǰ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/purchase/listSale");
		});
		
		//=============  ���� ������ ��ǰ Event  ó�� =============	
	 	$( "a:contains('���� ������ ��ǰ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/purchase/listPurchase?menu=manage");
		});
		
		//=============  ��� �ŷ� ���� Event  ó�� =============	
	 	$( "a:contains('��� �ŷ� ����')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/purchase/listSale");
		});
		
		
	</script>
