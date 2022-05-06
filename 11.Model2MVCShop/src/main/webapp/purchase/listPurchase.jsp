<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
=====> EL / JSTL 
<%@ page import="java.util.List"  %>
<%@ page import="com.model2.mvc.servicemain.Purchase" %>
<%@ page import="com.model2.mvc.common.*" %>
<%@ page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	List<Purchase> list = (List<Purchase>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");	

	Search search = (Search)request.getAttribute("search");
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	
%>    
--%>
  
<!DOCTYPE html>
<html>
<head>
<title>구매 목록 조회</title>
<meta charset="EUC-KR">
<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->
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
function fncGetList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method", "POST").attr("action", "/purchase/listPurchase").submit();
}


$(function() {
	$( "#tranNo" ).on("click" , function() {
			var tranNo = $(this).attr("data-tranNo");
		$(self.location).attr("href","/purchase/getPurchase?tranNo="+tranNo);
	})
	
	$("#sellerId").on("click" , function() {
			var sellerId = $(this).attr("data-sellerId");
		$(self.location).attr("href","/user/getUser?userId="+sellerId);
	});	
	
	$( "#prodNo" ).on("click" , function() {
 		var prodNo = $(this).attr("data-prodNo");
		$(self.location).attr("href","/product/getProduct?prodNo="+prodNo+"&menu=search");
	});
})

</script>

</head>
<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div style="width:98%; margin-left:10px;">

<form name="detailForm">

	<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
		<tr>
			<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
			<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">구매 목록조회</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<%--
			<td colspan="11" >
				전체  <%= resultPage.getTotalCount() %> 건수, 현재 <%= resultPage.getCurrentPage() %> 페이지
			</td>
			 --%>
			<td colspan="11" >
				전체  ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage}  페이지
			</td>
		</tr>
		<tr>
			<td class="ct_list_b" width="100">구매번호</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">판매자ID</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">마지막 메시지</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">구매상품</td>
			<td class="ct_line02"></td>			
			<td class="ct_list_b">배송현황</td>
			<td class="ct_line02"></td>
			
		</tr>
		<tr>
			<td colspan="11" bgcolor="808285" height="1"></td>
		</tr>
		
		<c:set var="i" value="0" />
		<c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr class="ct_list_pop">
				<td align="center"><a id="tranNo" data-tranNo="${purchase.tranNo}" href="#">${purchase.tranNo}</a></td>
				<td></td>
				<td align="left"><a id="sellerId" data-sellerId="${purchase.purchaseProd.sellerId}" href="#">${purchase.purchaseProd.sellerId}</a></td>
				<td></td>
				<td align="left">${purchase.divyMessage}</td>
				<td></td>	
				<td align="left"><a id="prodNo" data-prodNo="${purchase.purchaseProd.prodNo}" href="#">${purchase.purchaseProd.prodName}</a></td>
				<td></td>
				<td align="left">
					<c:choose>
						<c:when test="${purchase.tranCode.trim().equals('1')}">
							${trancode = "상품 준비중"}	
						</c:when>
						<c:when test="${purchase.tranCode.trim().equals('2')}">
							${trancode = "배송중"}	
						</c:when>
						<c:when test="${purchase.tranCode.trim().equals('3')}">
							${trancode = "배송 완료"}	
						</c:when>
						<c:when test="${purchase.tranCode.trim().equals('4')}">
							${trancode = "품절"}	
						</c:when>
						<c:otherwise>
							${trancode = "판매중"}	
						</c:otherwise>		
					</c:choose>
				</td>
			</tr>
			<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			</tr>
		</c:forEach>
	</table>
		
	
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" /> 
					<jsp:include page="../common/pageNavigator_new.jsp"/>	
				</tr>
			</table>
			<!--  페이지 Navigator 끝 -->
		</form>
	</div>
  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>	
</body>
</html>