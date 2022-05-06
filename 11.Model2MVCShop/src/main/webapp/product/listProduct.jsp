<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<head>
<title>상품 목록조회</title>

<meta charset="EUC-KR">
<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="/assets/vendor/aos/aos.css" rel="stylesheet" type="text/css">
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/assets/css/style.css" rel="stylesheet">
<script type="text/javascript">
 $(document).ready(function() {
	var maxP =  ${resultPage.maxPage};
	var totalCnt = ${resultPage.totalCount};
	console.log("tt"+totalCnt+${resultPage.currentPage});
	
	$(document).scroll(function(){
		var currentPage = ${resultPage.currentPage};
		var windowHeight = window.innerHeight; 
		var pageHeight = document.documentElement.scrollHeight;		
		var scroller = $(document).scrollTop();
		var isBottom = (scroller + windowHeight) + 2 >= pageHeight;

		//console.log(windowHeight);
		//console.log(pageHeight);
		console.log(scroller);
		//console.log(isBottom);
		
		// json
		/* if(isBottom) {
			var currentP = ${resultPage.currentPage};
			var cur = $("#currentPage").val();
			fncGetList(currentP++);
			$("#currentPage").val(cur+1);	
			console.log("cur:"+cur);
		} */
		
		if(isBottom) {
			var currentPage = ${resultPage.currentPage};
			fncGetList(currentPage+1);
		}
		
		if(scroller < 1 && currentPage !== 1) {
			var currentPage = ${resultPage.currentPage};
			fncGetList(currentPage-1);
		}
		
		
		/* var windowHeight = window.innerHeight; 
		var pageHeight = document.documentElement.scrollHeight;		
		var scroller = $(document).scrollTop(); */
		
		/* if(	((scroller + windowHeight) >= pageHeight)) {
			var currentP = ${resultPage.currentPage};
			var cur = $("#currentPage").val();
				fncGetList(currentP++);
				cur = currentP+1;
		} */
		
		// 위로 표시 만들 곳
		 if((scroller <= 1) && (currentPage !== 1)) {
			var displayValue = "<a href='javascript:navTop()'><h2>TOP</h2></a>"
				$("#pageNav").html(displayValue);
		} 
		
	})
	
	getProdEvent();
	
});	 
 
 	function navTop() {
		window.scrollTo(0,0);		
	} 
	// list
/* 	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
		var maxP =  ${resultPage.maxPage};

		if( $("#currentPage").val() == "") {
			 $("#currentPage").val(null);
		} 

		var searchCondition = $("select[name='searchCondition']").val();
		var searchKeyword = $("input[name='searchKeyword']").val();
		var currentPage = $("#currentPage").val();
		console.log(currentPage+"currentPage====");
		
		$.ajax({
			url : "/product/json/listProduct",
			method : "POST",
			data : JSON.stringify({
				searchCondition : searchCondition,
				searchKeyword : searchKeyword,
				currentPage : ${ resultPage.currentPage } +1,
				pageSize : 3, 
				endRowNum: 0, 
				startRowNum:0,
			}),
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData) {
				console.log(currentPage);
				var currentP = ${resultdPage.currentPage};
				var cur = $("#currentPage").val();
				
				getProdEvent();
				
				console.log(JSONData);
				var list = JSONData.list;
				
				console.log(list);
				
				if($(".card").length < Number(JSONData.totalCount) ) {
					console.log(typeof JSONData.totalCount)
					console.log(JSONData.totalCount+"---*-");
					console.log($(".card").length);
					var display = ""; 
					
					for(var i=0; i < list.length; i++) {
						
						//var listJson = JSON.stringify(list[i]);
						//console.log("listJson" + listJson);
						var display = ""; 
						var product = list[i];
						
						var fileArr = product.fileName.split(",");
						
						function thumbnail(fileArr) {
							var str="";
							for(var file of fileArr) {
								str += "<img src='/images/uploadFiles/";
								str += file + `' class='img-fluid rounded thumbnail-image'/>`;
							}
							return str;
						}
						
						display += 
							`<div class="col-md-3">
								<div class="card" data-prodNo=`+product.prodNo+`>
									<div class="image-container  d-flex justify-content-between align-items-center">
										<div class="first mx-auto d-block" >
											<div class="d-flex justify-content-between align-items-center">
												<span class="discount">`;
						
						display += Math.round((product.cost-product.price)/product.cost*100)+"%</span>";
						display += `	<span class="wishlist"><i class="bi bi-bookmark-heart"></i></span>
									</div>
									<div class="">`;
									
						display += product.fileName !== null ? 
							thumbnail(fileArr)
							: `<img src="/images/uploadFiles/pensoo.jpg" class="img-fluid rounded thumbnail-image">`;
						
						display += `</div></div></div>
									<div class="product-detail-container p-2">
										<div class="d-flex justify-content-between align-items-center">`
					
						display += `<h5 class="prodName">`+product.prodName+`</h5>`;
						display += `<div class="d-flex flex-column mb-2">
										<span class="price">`+product.price+`</span> 
										<small class="cost text-right">`+product.cost+`</small>
									</div>
									</div>
									<div class="d-flex justify-content-between align-items-center pt-1">
									<div class="dueDate" dueDate=`+product.dueDate+`>`+product.dueDate.substring(0,4)+`년 `+
																			product.dueDate.substring(4,6)+`월 `+
																			product.dueDate.substring(6)+`일까지</div>
									<div class="buy"><i class="bi bi-bag-check"></i>BUY +</div>
									</div></div></div></div>`;

						display = `<div class="container">`+display+`</div>`;
						
						$("section").append(display);						
					}
				$("#currentPage").val(cur+1);
				}
				
				
				
				//$("#cards").text(JSON.stringify(JSONData));
				
				
			},
			error : function(request,status, error) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
			
		})}
	 */
 	
	// list
	 function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
		var result = $("form").attr("method", "POST").attr("action", "/product/listProduct?menu=manage").submit();
	 }
				
	// 검색
	$(function() {
		$("button:contains('검색')").on("click", function() {
			fncGetList(1);
		})
		
		$("input[name='searchKeyword']").on("keydown", function(key) {
			if( key.keyCode == 13 ){
				fncGetList(1);
			}
		})
	});

	
	// getProduct
	/* $(function() {
		$("div.card").on("click", function() {
			var prodNo = $(this).attr("data-prodNo");
			console.log("눌림");
			$(self.location).attr("href","/product/getProduct?prodNo="+prodNo+"&menu=search");
		})		
	}) */
	
	// event :: getProduct 이동
	const getProdEvent = function() {
		$("div.card").on("click", function() {
			var prodNo = $(this).attr("data-prodNo");
			console.log("눌림");
			$(self.location).attr("href","/product/getProduct?prodNo="+prodNo+"&menu=search");
		})	
	}
	

	// 상품명
	$(function() {
		$("h5.prodName").on(
				"click",
				function() {
					//self.location ="/product/getProduct?prodNo="+$(this).attr('prodNo')+"&menu=search";
					var prodNo = $(this).attr('prodNo');
					$.ajax({
						url : "/product/json/getProduct/" + prodNo,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							const dueDate = JSONData.dueDate.substring(0,4)+"년 "+JSONData.dueDate.substring(4,6)+"월 "+JSONData.dueDate.substring(6)+"일";
							const fileArr = JSONData.fileName.split(",");
							
							function thumbnail(fileArr) {
								var str="";
								for(var file of fileArr) {
									str += "<img src='../images/uploadFiles/";
									str += file + "'/>";
								}
								return str;
							}
							
							var displayValue = "<h3>" + "상품명 : "
									+ JSONData.prodName + "<br/>" + "가격 : "
									+ JSONData.price + "<br/>" + "상세정보 : "
									+ JSONData.prodDetail + "<br/>" + "유효기간 : "
									+ dueDate + "<br/>" + "사진 : "
									+ thumbnail(fileArr) + "<br/>" + "판매자 ID: "
									+ JSONData.sellerId + "<br/>" 
									+ "<a href='/product/getProduct?prodNo="+JSONData.prodNo+"&menu=search'><h1>상세보기</h1></a>" 
									+								
									"</h3>"
									;
							$("h3").remove();
							$("#" + prodNo + "").html(displayValue);
						}
					}
					)
				})
			});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">
	<jsp:include page="/layout/toolbar.jsp" />

		<form name="detailForm">
			<div class="container">			
				<div class="row center-block justify-content-around">
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 100px;">
					<tr>
						<td align="right">
						<div class="d-flex justify-content-end align-items-center pb-3">
						<select class="form-select-sm" name="searchCondition" style="width: 80px">
								<option value="0"
									${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품명</option>
								<option value="1"
									${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품번호</option>
						</select> 
						
						<input type="text" placeholder="Search" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  class="form-control rounded"
							style="width: 200px; height: 30px">
							<button type="button" class="btn btn-secondary btn-sm"><i class="bi bi-search"></i>검색</button> <br /></td>
						</div>
					</tr>
				</table>
				<hr/>
				<div class="d-flex justify-content-end align-items-center">
					<p class="text-secondary">전체</p><p class="text-info">${resultPage.totalCount}</p><p class="text-secondary">건</p>
				</div>
				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<div class="col-md-3">
						<div class="card" data-prodNo="${product.prodNo}" style="width: 18rem; height: 20rem;">
							<div class="image-container  d-flex justify-content-between align-items-center">
								<div class="first mx-auto d-block" >
									<div style="height: 10rem;">
									<c:choose>
									<c:when test="${!empty product.fileName}">
									<c:forEach items="${product.fileName}" var="file">
									<div style="height: 10rem; ">
										<img src="/images/uploadFiles/${file}" class="mh-100 img-fluid rounded thumbnail-image"/>
										</div>
										<div class="card-img-overlay">
    									<h5 class="card-title">
	    									<div class="d-flex justify-content-between align-items-center">
											<span class="discount">
											<fmt:formatNumber var="discount" pattern="###" value="${(product.cost-product.price)/product.cost*100}" />
												<div class="btn btn-danger">${discount}%</div>
											</span>
											<span class="wishlist"><i class="bi bi-bookmark-heart"></i></span>
											</div>
    									</h5>
  										</div>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<img src="../images/uploadFiles/pensoo.jpg" class="img-fluid rounded thumbnail-image">
										<div class="card-img-overlay">
    									<h5 class="card-title">
	    									<div class="d-flex justify-content-between align-items-center">
											<span class="discount">
											<fmt:formatNumber var="discount" pattern="###" value="${(product.cost-product.price)/product.cost*100}" />
												<div class="btn btn-danger">${discount}%</div>
											</span>
											<span class="wishlist"><i class="bi bi-bookmark-heart"></i></span>
											</div>
    									</h5>
  										</div>
									</c:otherwise>
									</c:choose>
									</div>
									
								</div>
								
							</div>
							<div class="product-detail-container p-2">
								<div class="d-flex justify-content-between align-items-center">
									<h5 class="prodName" prodNo="${product.prodNo}">${product.prodName}</h5>
									<div class="d-flex flex-column mb-2">
										<span class="price">${product.price}</span> 
										<small	class="cost text-right">${product.cost}</small>
									</div>
								</div>
								<div class="d-flex justify-content-between align-items-center pt-1">
										<div class="dueDate" dueDate="${product.dueDate }">${product.dueDate.substring(0,4)}년
																							${product.dueDate.substring(4,6)}월
																							${product.dueDate.substring(6)}일까지</div>
										<div class="buy"><i class="bi bi-bag-check"></i>BUY +</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>

			<section id="scrollCard">
			<!-- json 받으면 넣을 곳 -->
			</section>
			
			<div id="pageNav"></div>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
					<input type="hidden" id="currentPage" name="currentPage" value="" />
					<jsp:include page="../common/pageNavigator_new.jsp"/>	
				</tr>
			</table>
			<!--  페이지 Navigator 끝 -->
		</form>

	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	<script>
    AOS.init();
  </script>
</body>
</html>
