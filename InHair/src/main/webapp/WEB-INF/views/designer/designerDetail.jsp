<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v2.7, mobirise.com">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon"
	href="assets/images/discover-mobile-350x350-16.png" type="image/x-icon">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<meta name="description" content="Free Bootstrap Template">
<title>designerDetail</title>
<!--     <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Roboto:700,400&amp;pset=cyrillic,latin,greek,vietnamese">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/mobirise/css/style.css">
    <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css"> -->
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<!-- Bootstrap -->
<link rel="stylesheet" href="${ctx}/resources/css/bootstrap.css">

</head>
<body>
	<br>


	<div class="container">
		<%@ include file="/WEB-INF/views/header/header.jspf"%>

		<div class="well">


			<div align="center">
				<img class="img-circle" alt="300x300"
					style="width: 300px; height: 300px;"
					src="${ctx}/designer/image?designer_id=${designer.id}"
					data-holder-rendered="true">
				<h3>${designer.name}</h3>
				<p>
				<h3>
					<c:set var="starpoint" value="${designer.starpoint }" />
					<c:choose>
						<c:when test="${starpoint == 0 || starpoint<1}">☆☆☆☆☆</c:when>
						<c:when test="${starpoint == 1 || starpoint<2}">★☆☆☆☆</c:when>
						<c:when test="${starpoint == 2 || starpoint<3}">★★☆☆☆</c:when>
						<c:when test="${starpoint == 3 || starpoint<4}">★★★☆☆</c:when>
						<c:when test="${starpoint == 4 || starpoint<5}">★★★★☆</c:when>
						<c:when test="${starpoint == 5}">★★★★★</c:when>
					</c:choose>
				</h3>
				</p>
				<p>${designer.shopName}</p>
				<p>${designer.address}</p>
				<p>${designer.intro}</p>
				<br>
				<h3 align="center">스타일</h3>
				<div align="center">
					<img src="${ctx}/resources/images/line.png" width="40%">
				</div>
				<br>

				<div class="row text-center">

					<c:forEach items="${pfList}" var="portfolio">
						<div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
							<div class="styles">
								<img
									src="${ctx}/portfolio/image?portfolio_id=${portfolio.portfolio_id}"
									class="img-responsive1">
								<div class="caption">
									<h3>${portfolio.title}</h3>
									<p>${portfolio.content}</p>
									<div class="down">
										<c:if test="${loginedUser.rank eq 'D' && portfolio.designer_id eq loginedUser.id}">

											<a
												href="${ctx }/portfolio/update?portfolio_id=${portfolio.portfolio_id}"
												class="btn btn-danger" role="button">수정 </a>
<%-- 							<a href="${ctx }/portfolio/delete?portfolio_id=${portfolio.portfolio_id}"
												class="btn btn-danger" role="button"
												onclick="removeCheck1(); ">삭제 </a>  
					 --%>
									
											<a href="${ctx }/portfolio/delete?portfolio_id=${portfolio.portfolio_id}"
												class="btn btn-danger" role="button"
												onclick="return confirm(&quot;정말로 삭제하시겠습니까?&quot;)"> 삭제 </a> 
						
	 </c:if>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>

				<br>
			</div>
			<br> <br>

			<h3 align="center">후기게시판</h3>
			<div align="center">
				<img src="${ctx}/resources/images/line.png" width="40%">
			</div>
			<br>


			<table class="table table-striped table-bordered table-hover"
				style="margin: auto;" align="center">
				<thead align="center"
					style="background-color: #5D5D5D; color: #CCC;">
					<tr>
						<th style="text-align: center">글 번호</th>
						<th style="text-align: center">별점</th>
						<th style="text-align: center">제목</th>
						<th style="text-align: center">작성자</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${postList}" var="post">
						<tr>
							<td align="center">${post.rnum}</td>
							<td align="center"><c:choose>
									<c:when test="${post.starpoint < 1}">☆☆☆☆☆</c:when>
									<c:when test="${post.starpoint < 2}">★☆☆☆☆</c:when>
									<c:when test="${post.starpoint < 3}">★★☆☆☆</c:when>
									<c:when test="${post.starpoint < 4}">★★★☆☆</c:when>
									<c:when test="${post.starpoint < 5}">★★★★☆</c:when>
									<c:when test="${post.starpoint == 5}">★★★★★</c:when>
								</c:choose></td>
							<td><a
								href="${ctx }/post/detail?post_id=${post.post_id}&rnum=${post.rnum}">${post.title}</a></td>
							<td align="center">${post.writer}</td>

						</tr>
					</c:forEach>


				</tbody>
			</table>
			<br>
			<c:if test="${loginedUser.rank eq 'N'}">
				<div align="right">
					<a href="${ctx}/post/create?designer_id=${designer.id}"
						class="btn btn-danger" role="button">등록 </a>
				</div>
			</c:if>

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