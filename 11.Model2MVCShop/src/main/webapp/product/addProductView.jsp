<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ���</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="/css/datepicker.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript">

	// util :: calendar
	$.datepicker.setDefaults({
		  dateFormat: 'yy-mm-dd',
		  prevText: '���� ��',
		  nextText: '���� ��',
		  monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
		  monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
		  dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		  dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		  dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		  showMonthAfterYear: true,
		  yearSuffix: '��'
	});
	
	$(document).ready(function() {
	    $('#date-picker').datepicker();
	});
			
	// event ::  submit
	$(function() {
		$("td.ct_btn01:contains('���')").on("click", function() { fncAddProduct();	 });
	})
	
	// event ::  reset
	$(function() {
		$("td.ct_btn01:contains('���')").on("click", () => {		resetData();	});
	})
	
	
	// check val
	function fncAddProduct() {

		var form = $("form[name='detailForm']");
		var formData = $(new FormData(form[0]));
		
		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var dueDate = $("input[name='dueDate']").val();
		var price = $("input[name='price']").val();
		var cost = $("input[name='cost']").val();
		var file = $("input[name='multiFile']").val();

		if (name == null || name.length < 1) {
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (dueDate == null || dueDate.length < 1) {
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("�Ǹ� ������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (cost == null || cost.length < 1) {
			alert("������ ������ �ݵ�� �Է��ϼž� �մϴ�.")
		}
		
	
		$($("form")[0]).attr("method" , "POST").attr("action" , "/product/addProduct").attr("enctype", "multipart/form-data").submit();
	}
		
	function resetData() {
		$("form")[0].reset();
	};
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<form name="detailForm" enctype="multipart/form-data">
		<%-- <input type="hidden" name="sellerId" value="${product.prodNo}"> --%>
		<table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37" /></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">��ǰ���</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">��ǰ�з� <imgsrc
						="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"></td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105"><input type="text" name="prodCode"
								class="ct_input_g" style="width: 100px; height: 19px"
								maxLength="20"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">��ǰ�� <imgsrc
						="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"></td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105"><input type="text" name="prodName"
								class="ct_input_g" style="width: 100px; height: 19px"
								maxLength="20"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">��ǰ������ <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="prodDetail"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="10" minLength="6" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">��ȿ����<img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<!-- <input type="text" name="dueDate"
					readonly="readonly" class="ct_input_g"
					style="width: 100px; height: 19px" maxLength="10" minLength="6" /> -->
					<input type="text" name="dueDate" id="date-picker" class="form-control bg-white border-0 small" readonly="readonly" aria-label="Search" aria-describedby="basic-addon2" th:value="|${year}-${month}|">
					&nbsp;
					<img id="calendar"  src="../images/ct_icon_date.gif" width="15" height="15" />
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">�Ǹ� ���� <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="price"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="10"> ��</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">������ ����<img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="cost"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="10"> ��</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">��ǰ�̹���</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="file" name="multiFile"
					class="multi ct_input_g" style="width: 200px; height: 19px"
					maxLength="13" multiple></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">���</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
							<td width="30"></td>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">���
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</form>
</body>
</html>