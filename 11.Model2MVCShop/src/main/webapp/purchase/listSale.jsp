<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////

<%@ page import="java.util.List"  %>
 
<%@ page import="com.model2.mvc.servicemain.User" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	List<User> list= (List<User>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	
	Search search = (Search)request.getAttribute("search");
	//==> null 을 ""(nullString)으로 변경
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%> 	/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>

<html>
<head>
<title>판매 목록 조회</title>
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
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/purchase/listSale").submit();
	}

 	$(function() {
 		$( "#tranNo" ).on("click" , function() {
 			var tranNo = $(this).attr("data-tranNo");
			$(self.location).attr("href","/purchase/getPurchase?tranNo="+tranNo);
		})
	});
	
 	$(function() {
 		$("#buyerId").on("click" , function() {
 			var buyerId = $(this).attr("data-buyerId");
			$(self.location).attr("href","/user/getUser?userId="+buyerId);
		});		
 	}); 
 	
 	$(function() {
	 	$( "#prodNo" ).on("click" , function() {
	 		var prodNo = $(this).attr("data-prodNo");
			$(self.location).attr("href","/product/getProduct?prodNo="+prodNo+"&menu=search");
		});
 	})
 	
	$(function() {
	 	$( "a[href='#' ]:contains('판매 중')" ).on("click" , function() {
	 		var tranNo = $(this).attr("data-tranNo");
			$(self.location).attr("href","/purchase/updateTranCodeByProd?tranNo="+tranNo+"&tranCode=000&menu=search");
		});		
	})
 
	$(function() {
	 	$( "a[href='#' ]:contains('예약 중')" ).on("click" , function() {
	 		var tranNo = $(this).attr("data-tranNo");
			$(self.location).attr("href","/purchase/updateTranCodeByProd?tranNo="+tranNo+"&tranCode=001&menu=manage");
		});	
	})
	
	$(function() {
	 	$( "a[href='#' ]:contains('거래 완료')" ).on("click" , function() {
	 		var tranNo = $(this).attr("data-tranNo");
			$(self.location).attr("href","/purchase/updateTranCodeByProd?tranNo="+tranNo+"&tranCode=002&menu=search");
		});		
	})
 	
</script>

</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">판매 목록조회</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>
			<c:set var="dbUserId" value="${user.userId}"></c:set>
			<c:choose>
			<c:when test="${dbUserId eq 'admin'}">
	 			<input type="hidden" name="searchCondition" value="" /> 			
			</c:when>
			<c:otherwise>
				<input type="hidden" name="searchCondition" value="0" /> 
			</c:otherwise>
			</c:choose>
			<input type="hidden" name="searchKeyword" value="${user.userId}" />
			<!--
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
			<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
				<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>회원ID</option>
				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>회원명</option>
				/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>구매자ID</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품번호</option>
			</select>
			<%--<input type="text" name="searchKeyword" value="<%= searchKeyword %>"  class="ct_input_g" style="width:200px; height:14px" >--%>
			<input type="text" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
						class="ct_input_g" style="width:200px; height:20px" > 
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetList('1');">검색</a>
					</td>
					<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
-->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<%--
		<td colspan="11" >
			전체  <%= resultPage.getTotalCount() %> 건수, 현재 <%= resultPage.getCurrentPage() %> 페이지
		</td>
		 --%>
					<td colspan="11">전체 ${resultPage.totalCount } 건수, 현재
						${resultPage.currentPage} 페이지</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">거래번호</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">거래일자</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">구매자ID</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">판매상품</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">판매상태</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">거래내역 수정</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
	<%
		for(int i=0; i<list.size(); i++) {
			User vo = list.get(i);
	%>
	<tr class="ct_list_pop">
		<td align="center"><%= i + 1 %></td>
		<td></td>
		<td align="left"><a href="/getUser?userId=<%=vo.getUserId() %>"><%= vo.getUserId() %></a></td>
		<td></td>
		<td align="left"><%= vo.getUserName() %></td>
		<td></td>
		<td align="left"><%= vo.getEmail() %>
		</td>		
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<% } %>/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>

				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr class="ct_list_pop">
						<td align="center" ><a id="tranNo" data-tranNo="${purchase.tranNo}" href="#">${purchase.tranNo}</a></td>
						<td></td>
						<td align="left">${purchase.orderDate}</td>
						<td></td>
						<td align="left"><a id="buyerId" data-buyerId="${purchase.buyer.userId}" href="#">${purchase.buyer.userId}</a></td>
						<td></td>
						<td align="left"><a id="prodNo" data-prodNo="${purchase.purchaseProd.prodNo} href="#">${purchase.purchaseProd.prodName}</a></td>
						<td></td>
						<td align="center">
						<c:choose>
								<c:when test="${purchase.tranCode.equals('001')}">
							${trancode = "예약 중"}	
						</c:when>
								<c:when test="${purchase.tranCode.equals('002')}">
							${trancode = "거래 완료"}	
						</c:when>
								<c:otherwise>
							${trancode = "판매중"}	
						</c:otherwise>
							</c:choose></td>
						<td></td>
						<td align="center">
							<a id="000" data-tranNo="${purchase.tranNo}" href="#">판매 중</a> 
							<a id="001" data-tranNo="${purchase.tranNo}" href="#">예약 중</a> 
							<a id="002" data-tranNo="${purchase.tranNo}" href="#">거래 완료</a>
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
