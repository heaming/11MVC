<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container text-center">
	<nav aria-labe="Product List pages">
		<!-- ũ������ :  pagination-lg pagination-sm-->
		<ul class="pagination justify-content-center">
			<!--  <<== ���� nav -->
			<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
				<li class="page-item disabled">
			</c:if>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<li class="page-item">
			</c:if>
			<a class="page-link" href="javascript:fncGetList('${ resultPage.currentPage-1}')" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a>
			</li>

			<!--  �߾�  -->
			<c:forEach var="i" begin="${resultPage.beginUnitPage}"
				end="${resultPage.endUnitPage}" step="1">
				<c:if test="${ resultPage.currentPage == i }">
					<!--  ���� page ����ų��� : active -->
					<li class="page-item active"><a class="page-link" href="javascript:fncGetList('${ i }');">${ i }<span
							class="sr-only"></span></a></li>
				</c:if>

				<c:if test="${ resultPage.currentPage != i}">
					<li class="page-item"><a class="page-link" href="javascript:fncGetList('${ i }');">${ i }</a>
					</li>
				</c:if>
			</c:forEach>

			<!--  ���� nav==>> -->
			<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
				<li class="page-item disabled">
			</c:if>
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<li class="page-item">
			</c:if>
			<a class="page-link" href="javascript:fncGetList('${resultPage.endUnitPage+1}')" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a>
			</li>
		</ul>
	</nav>

</div>
			<section id="card-list" class="card-list">
				<div class="contatiner">
					<div id="cards" class="row card-list-container thumbnails"></div>
				
				</div>
			</section>


<!-- <div class="container">
	<nav>
		<ul class="pager">
			<li><a href="#">Previous</a></li>
			<li><a href="#">Next</a></li>
		</ul>
	</nav>
</div>


<div class="container">
	<nav>
		<ul class="pager">
			<li class="previous disabled"><a href="#"><span
					aria-hidden="true">&larr;</span> Older</a></li>
			<li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li> 
			<li class="next"><a href="#">Newer <span aria-hidden="true">&rarr;</span></a></li>
		</ul>
	</nav>
</div> -->