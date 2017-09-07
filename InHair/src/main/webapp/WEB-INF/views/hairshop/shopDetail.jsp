<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>shopDetail</title>
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

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${ctx}/resources/js/jquery-1.11.3.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${ctx}/resources/js/bootstrap.js"></script>
</head>
<body>
	<div class="container">

		<%@ include file="/WEB-INF/views/header/header.jspf"%>
		
		
		
		<input id="tab1" type="radio" name="tabs" checked /> <label
			class="tab" for="tab1">소개</label> <input id="tab2" type="radio"
			name="tabs" /> <label class="tab" for="tab2">스타일</label> 
		
		<c:if test="${loginedUser.rank eq 'N' }"> 
			<input id="tab3" type="radio" name="tabs" /> <a href="${ctx }/reserve/userCreateView"
			class="tab book" for="tab3">예약</a>
		</c:if>
		<section class="well tab-content" id="content1">


			<h2 class="media-heading">소개</h2>

			<hr align="left" style="border: solid 1px #EA5554; width: 20%;">
			<br />
			<table cellspacing="10px;">
				<tr align="left">
					<td rowspan="5"><img class="shopimg"
						src="${ctx}/hairshop/image?shopCode=${hairshop.code}"></td>
					<td colspan="2"><h2>${hairshop.shopName}</h2></td>
				</tr>
				<tr align="left">
					<td width="200px">주소</td>
					<td>${hairshop.address }
					<input id="address" type="text" value="${hairshop.address }" style="display:none;"></td>
					
				</tr>
				<tr align="left">
					<td>전화번호</td>
					<td>${hairshop.tel}</td>
				</tr>
				<tr align="left">
					<td>운영시간</td>
					<td><c:choose>
							<c:when test="${hairshop.open == 16}">08:00</c:when>
							<c:when test="${hairshop.open == 17}">08:30</c:when>
							<c:when test="${hairshop.open == 18}">09:00</c:when>
							<c:when test="${hairshop.open == 19}">09:30</c:when>
							<c:when test="${hairshop.open == 20}">10:00</c:when>
							<c:when test="${hairshop.open == 21}">10:30</c:when>
							<c:when test="${hairshop.open == 22}">11:00</c:when>

						</c:choose> ~ <c:choose>
							<c:when test="${hairshop.close == 40}">20:00</c:when>
							<c:when test="${hairshop.close == 41}">20:30</c:when>
							<c:when test="${hairshop.close == 42}">21:00</c:when>
							<c:when test="${hairshop.close == 43}">21:30</c:when>
							<c:when test="${hairshop.close == 44}">22:00</c:when>
							<c:when test="${hairshop.close == 45}">22:30</c:when>
							<c:when test="${hairshop.close == 46}">23:00</c:when>
							<c:when test="${hairshop.close == 47}">23:30</c:when>
							<c:when test="${hairshop.close == 0}">24:00</c:when>
						</c:choose></td>
				</tr>
				<tr align="left">
					<td>소개</td>
					<td>${hairshop.intro }</td>
				</tr>
			</table>
			<br> <br>

			<h3 align="center">디자이너 소개</h3>
			<div align="center">
				<img src="${ctx}/resources/images/line.png" width="40%">
			</div>

			<br> <br>
			<div class="row">
				<c:forEach items="${designerList}" var="designer">
					<div class="col-lg-4 col-sm-12 text-center">
						<a href="${ctx }/designer/detail?designer_id=${designer.id}"><img
							class="img-circle" alt="140x140"
							style="width: 140px; height: 140px;"
							src="${ctx}/designer/image?designer_id=${designer.id}"
							data-holder-rendered="true"></a>
						<h3 class="designerH">${designer.name }</h3>
						<p class="designerp">
							<c:set var="starpoint" value="${designer.starpoint }" />
							<c:choose>
								<c:when test="${starpoint == 0 || starpoint<1}">☆☆☆☆☆</c:when>
								<c:when test="${starpoint == 1 || starpoint<2}">★☆☆☆☆</c:when>
								<c:when test="${starpoint == 2 || starpoint<3}">★★☆☆☆</c:when>
								<c:when test="${starpoint == 3 || starpoint<4}">★★★☆☆</c:when>
								<c:when test="${starpoint == 4 || starpoint<5}">★★★★☆</c:when>
								<c:when test="${starpoint == 5}">★★★★★</c:when>
							</c:choose>
						</p>
						<p class="designerp">${designer.intro}</p>
						<c:if
							test="${loginedUser.rank eq 'H' && hairshop.code eq loginedUser.code}">
							<a href="${ctx}/designer/designerOut?designer_id=${designer.id}"
								class="btn btn-danger" role="button"  onclick="return confirm(&quot;정말로 삭제하시겠습니까?&quot;)">삭제
							</a>
<%-- 							<a href="${ctx}/designer/designerOut?designer_id=${designer.id}"
								class="btn btn-danger" role="button" onclick="removeCheck2()">삭제
							</a> --%>
						</c:if>
						<p class="designerp"></p>
					</div>
				</c:forEach>

			</div>
			<br> <br>

			<h3 align="center">지도</h3>
			<div align="center">
				<img src="${ctx}/resources/images/line.png" width="40%">
			</div>
			<br>

			<!-- 지도를 표시할 div 입니다 -->
		<div align="center">
		<p>${hairshop.address}</p>
		<div id="map" style="width:500px;height:350px;"></div> 
		</div>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=facfde71342c4f83c05376d55bf4ce86">
		</script>
		<script>
			var map;
        	var marker = '';
        	var position = new daum.maps.LatLng(37.5243826, 127.043997);
        	$("#map").ready(function() {
        		 map = new daum.maps.Map(document.getElementById('map'), {
                     center: position,
                     level: 2,
                     mapTypeId: daum.maps.MapTypeId.ROADMAP
                 });
        		 
        		 marker = new daum.maps.Marker({
	                    position: position
	                });
	
	             marker.setMap(map);
	             if (marker != '') {
                     marker.setMap(null);
                 }
                 Search();
        	});
        	function Search() {
                var query = document.getElementById("address").value;
                getPoint(query);
            }

			//주소->좌표로 변환해주는 api 사용
            function getPoint(query) {
                var oScript = document.createElement("script");
                oScript.type = "text/javascript";
                oScript.charset = "utf-8";
                oScript.src = "http://apis.daum.net/local/geo/addr2coord?apikey=facfde71342c4f83c05376d55bf4ce86&output=json&callback=pongSearch&q=" + encodeURI(query);
                document.getElementsByTagName("head")[0].appendChild(oScript);
            }
			
			//좌표 변환 후 해당 좌표를 이용해 콜백(클릭시와 동일한 동작)
            function pongSearch(data) {
                marker = '';
                if (data.channel.item.length == 0) {
                    alert("결과가 없습니다.");
                } else {
                    if (marker != '') {
                        marker.setMap(null);
                    }
                    var temp = new daum.maps.LatLng(data.channel.item[0].lat, data.channel.item[0].lng);
                    
                    $("#latlng").html((data.channel.item[0].lat).toString().substring(0, 10) + ", " + (data.channel.item[0].lng).toString().substring(0, 10));
                    map.panTo(temp);
                    marker = new daum.maps.Marker({
                        position: temp
                    });
                    marker.setMap(map);
                }
            }
        </script>
        
		</section>


		<section class="well tab-content" id="content2">
			<h2 class="media-heading">스타일</h2>

			<hr align="left" style="border: solid 1px #EA5554; width: 20%;">
			<br> <br>
			<div class="row text-center">

				<c:forEach items="${portfolioList}" var="portfolio">
					<div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
						<div class="styles">
							<img
								src="${ctx}/portfolio/image?portfolio_id=${portfolio.portfolio_id}"
								alt="Thumbnail Image 1" class="img-responsive1">
							<div class="caption">
								<h3>${portfolio.title}</h3>
								<p>${portfolio.designer_name}</p>
								<p>${portfolio.content}</p>

							</div>
						</div>
					</div>
				</c:forEach>



			</div>
		</section>


	</div>
	<footer class="footer"
		style="display: block; background-color: #5D5D5D; height: 80px; text-align: center">
		<br> &copy; Copyright 2016 TeamName ㅈㄴㅂㄴ


	</footer>


	
</body>
</html>