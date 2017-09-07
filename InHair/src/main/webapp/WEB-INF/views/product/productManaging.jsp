<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>productManaging</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v2.7, mobirise.com">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="description" content="Free Bootstrap Template">
<link rel="shortcut icon"
	href="assets/images/discover-mobile-350x350-16.png" type="image/x-icon">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Bootstrap -->
<link rel="stylesheet" href="${ctx}/resources/css/bootstrap.css">

</head>
<body>

	<div class="container">

		<%@ include file="/WEB-INF/views/header/header.jspf"%>

		<h2 class="media-heading">상품 관리</h2>

		<hr align="left" style="border: solid 1px #EA5554; width: 20%;">
		<div class="well">


			<div style="text-align: right">
				<a href="${ctx}/product/create?shopCode=${shopCode}"
					class="btn btn-danger" role="button" align="left">등록 </a>
			</div>

			<h2 class="media-heading">
				<p class="text-right"></p>
			</h2>
			<br />
			<table class="table table-striped table-bordered table-hover"
				style="margin: auto;" align="center">
				<thead align="center"
					style="background-color: #5D5D5D; color: #CCC;">
					<tr>
						<th style="text-align: center">시술명</th>
						<th style="text-align: center">소요시간</th>
						<th style="text-align: center">시술가격</th>

						<th style="width: 15%"></th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach var="product" items="${list}">
						<tr>
							<td>${product.name }</td>
							<td><c:set var="leadtime" value="${product.leadtime }" /> <c:choose>

									<c:when test="${leadtime == 1}">30분</c:when>
									<c:when test="${leadtime == 2}">1시간</c:when>
									<c:when test="${leadtime == 3}">1시간 30분</c:when>
									<c:when test="${leadtime == 4}">2시간</c:when>
									<c:when test="${leadtime == 5}">2시간 30분</c:when>
									<c:when test="${leadtime == 6}">3시간</c:when>
									<c:when test="${leadtime == 7}">3시간 30분</c:when>
									<c:when test="${leadtime == 8}">4시간</c:when>
								</c:choose></td>
							<td>${product.price}원</td>

							<td><a
								href="${ctx}/product/update?product_id=${product.product_id}"
								class="btn btn-danger" role="button">수정 </a> 
								<a
								href="${ctx}/product/delete?product_id=${product.product_id}"
								class="btn btn-danger" role="button"
								onclick="return confirm(&quot;정말로 삭제하시겠습니까?&quot;)">삭제 </a> 
								<%-- 	<a href="${ctx}/product/delete?product_id=${product.product_id}" class="btn btn-danger" role="button" onclick="removeCheck4()">삭제 </a> --%></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>


		</div>

	</div>


	<footer class="footer"
		style="display: block; background-color: #5D5D5D; height: 80px; text-align: center">
		<br> &copy; Copyright 2016 TeamName ㅈㄴㅂㄴ


	</footer>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${ctx}/resources/js/jquery-1.11.3.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${ctx}/resources/js/bootstrap.js"></script>
</body>
</html>