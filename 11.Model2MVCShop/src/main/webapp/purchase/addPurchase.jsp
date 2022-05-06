<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--   
====> EL / JSTL ����
<%@ page import="com.model2.mvc.service.domain.Purchase" %>

<%
	Purchase purchase = (Purchase) request.getAttribute("purchase");
%>	
========
--%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� Ȯ��</title>
</head>
<body>

<form name="updatePurchase" action="/updatePurchaseView?tranNo=${purchase.tranNo}" method="post">

�ŷ���û

<table border=1>

	<tr>
		<td>�ֹ���ȣ</td>
		<td>${purchase.purchaseProd.prodNo}</td>
		<td></td>
	</tr>
	<tr>
		<td>�ŷ���û ��ǰ</td>
		<td>${purchase.purchaseProd.prodName}</td>
		<td>${purchase.tranNo}</td>
	</tr>
	<tr>
		<td>�Ǹ��� ���̵�</td>
		<td><a href="/getUser?userId=${purchase.purchaseProd.sellerId}">${purchase.purchaseProd.sellerId}</a></td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>
		
			${purchase.paymentOption}
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${purchase.receiverName}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${purchase.receiverPhone}</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${purchase.divyAddr}</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${purchase.divyMessage}</td>
		<td></td>
	</tr>
</table>
</form>


</body>
</html>