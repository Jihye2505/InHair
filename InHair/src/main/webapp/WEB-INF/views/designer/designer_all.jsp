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
<title>designers</title>
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

<input type="hidden" id="oldSi" value="${si}">
<input type="hidden" id="oldGu" value="${gu}">
	<div class="container">
		<%@ include file="/WEB-INF/views/header/header.jspf"%>
		<form action="${ctx}/designer/listByAddress" method="POST">
			<table class="table" style="border: hidden">
				<td class="table-condensed" align="right"><select name="si" id="si">
					<option value="">시/도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
							<option value="서울특별시">서울특별시</option>
							<option value="경기도">경기도</option>
							<option value="인천광역시">인천광역시</option>
							<option value="대전광역시">대전광역시</option>
							<option value="충청남도">충청남도</option>
							<option value="충청북도">충청북도</option>
							<option value="광주광역시">광주광역시</option>
							<option value="전라남도">전라남도</option>
							<option value="전라북도">전라북도</option>
							<option value="대구광역시">대구광역시</option>
							<option value="경상북도">경상북도</option>
							<option value="부산광역시">부산광역시</option>
							<option value="울산광역시">울산광역시</option>
							<option value="경상남도">경상남도</option>
							<option value="강원도">강원도</option>
							<option value="제주도">제주도</option>
					</select></td>
					<td style="width: 15%"><select name="gu" id="gu" style="width: 180px">
							<option value="">구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>

					</select></td>
				<td align="left" width="20px"><input type="submit" class="btn btn-danger" value="검색"><%-- <a
					href="${ctx }/designer/listByAddress?gu=${gu}"
					class="btn btn-danger" role="button">검색 </a> --%></td>

			</table>
		</form>

		<h2 align="center">디자이너</h2>
		<div align="center">
			<img src="${ctx}/resources/images/line.png" width="40%">
		</div>
		<br> <br>


	</div>

	<div class="row text-center" style="margin: auto;">
			<div class="container">
			<c:forEach items="${list}" var="designer">
				<div class="col-sm-4 col-md-4 col-lg-4 col-xs-6" style="height: 450px">
					
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
					<p class="designerp">${designer.shopName }</p>
					<p class="designerp">${designer.address }</p>
					<p class="designerp">${designer.intro}</p>
			
				</div>
			</c:forEach>


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
<script type="text/javascript">
		//시/도 선택시 해당 구 출력 Script
		$("#si").change(
						function() {
							if ($("#si option:selected").val() == '서울특별시') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='강남구'>강남구</option><option value='강동구'>강동구</option><option value='강북구'>강북구</option><option value='강서구'>강서구</option><option value='관악구'>관악구</option>"
														+ "<option value='광진구'>광진구</option><option value='구로구'>구로구</option><option value='금천구'>금천구</option><option value='노원구'>노원구</option><option value='도봉구'>도봉구</option>"
														+ "<option value='동대문구'>동대문구</option><option value='동작구'>동작구</option><option value='마포구'>마포구</option><option value='서대문구'>서대문구</option><option value='서초구'>서초구</option>"
														+ "<option value='성동구'>성동구</option><option value='성북구'>성북구</option><option value='송파구'>송파구</option><option value='양천구'>양천구</option><option value='영등포구'>영등포구</option><option value='용산구'>용산구</option>"
														+ "<option value='은평구'>은평구</option><option value='종로구'>종로구</option><option value='중구'>중구</option><option value='중랑구'>중랑구</option>");
							}
							if ($("#si option:selected").val() == '경기도') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='가평군'>가평군</option><option value='고양시 덕양구'>고양시 덕양구</option><option value='고양시 일산동구'>고양시 일산동구</option><option value='고양시 일산서구'>고양시 일산서구</option>"
												+"<option value='과천시'>과천시</option><option value='광명시'>광명시</option><option value='광주시'>광주시</option><option value='구리시'>구리시</option><option value='군포시'>군포시</option><option value='김포시'>김포시</option>"
												+"<option value='남양주시'>남양주시</option><option value='동두천시'>동두천시</option><option value='부천시 소사구'>부천시 소사구</option><option value='부천시 오정구'>부천시 오정구</option><option value='부천시 원미구'>부천시 원미구</option>"
												+"<option value='성남시 분당구'>성남시 분당구</option><option value='성남시 수정구'>성남시 수정구</option><option value='성남시 중원구'>성남시 중원구</option><option value='수원시 권선구'>수원시 권선구</option><option value='수원시 장안구'>수원시 장안구</option>"
												+"<option value='수원시 팔달구'>수원시 팔달구</option><option value='수원시 영통구'>수원시 영통구</option><option value='시흥시'>시흥시</option><option value='안산시 단원구'>안산시 단원구</option><option value='안산시 상록구'>안산시 상록구</option>"
												+"<option value='안성시'>안성시</option><option value='안양시 동안구'>안양시 동안구</option><option value='안양시 만안구'>안양시 만안구</option><option value='양주시'>양주시</option><option value='양평군'>양평군</option><option value='여주시'>여주시</option>"
												+"<option value='연천군'>연천군</option><option value='오산시'>오산시</option><option value='용인시 기흥구'>용인시 기흥구</option><option value='용인시 수지구'>용인시 수지구</option><option value='용인시 처인구'>용인시 처인구</option><option value='의왕시'>의왕시</option>"
												+"<option value='의정부시'>의정부시</option><option value='이천시'>이천시</option><option value='파주시'>파주시</option><option value='평택시'>평택시</option><option value='포천시'>포천시</option><option value='하남시'>하남시</option><option value='화성시'>화성시</option>");
							}
							if ($("#si option:selected").val() == '인천광역시') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='강화군'>강화군</option><option value='계양구'>계양구</option><option value='남구'>남구</option><option value='남동구'>남동구</option><option value='동구'>동구</option>"
												+"<option value='부평구'>부평구</option><option value='서구'>서구</option><option value='연수구'>연수구</option><option value='옹진군'>옹진군</option><option value='중구'>중구</option>");
							}
							if ($("#si option:selected").val() == '대전광역시') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='대덕구'>대덕구</option><option value='동구'>동구</option><option value='서구'>서구</option><option value='유성구'>유성구</option><option value='중구'>중구</option>");
							}
							if ($("#si option:selected").val() == '충청남도') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='공주시'>공주시</option><option value='금산군'>금산군</option><option value='논산시'>논산시</option><option value='당진시'>당진시</option><option value='보령시'>보령시</option>"
												+"<option value='부여군'>부여군</option><option value='서산시'>서산시</option><option value='서천군'>서천군</option><option value='아산시'>아산시</option><option value='예산군'>예산군</option>"
												+"<option value='천안시 동남구'>천안시 동남구</option><option value='천안시 서북구'>천안시 서북구</option><option value='청양군'>청양군</option><option value='태안군'>태안군</option><option value='홍성군'>홍성군</option><option value='계룡시'>계룡시</option>");
							}
							if ($("#si option:selected").val() == '충청북도') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='괴산군'>괴산군</option><option value='단양군'>단양군</option><option value='보은군'>보은군</option><option value='영동군'>영동군</option><option value='옥천군'>옥천군</option>"
												+"<option value='음성군'>음성군</option><option value='제천시'>제천시</option><option value='진천군'>진천군</option><option value='청주시 청원구'>청주시 청원구</option><option value='청주시 상당구'>청주시 상당구</option>"
												+"<option value='청주시 서원구'>청주시 서원구</option><option value='청주시 흥덕구'>청주시 흥덕구</option><option value='충주시'>충주시</option><option value='증평군'>증평군</option>");
							}
							if ($("#si option:selected").val() == '광주광역시') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='광산구'>광산구</option><option value='남구'>남구</option>"
												+"<option value='동구'>동구</option><option value='북구'>북구</option><option value='서구'>서구</option>");
							}
							if ($("#si option:selected").val() == '전라남도') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='강진군'>강진군</option><option value='고흥군'>고흥군</option><option value='곡성군'>곡성군</option><option value='광양시'>광양시</option><option value='구례군'>구례군</option><option value='나주시'>나주시</option>"
												+"<option value='담양군'>담양군</option><option value='목포시'>목포시</option><option value='무안군'>무안군</option><option value='보성군'>보성군</option><option value='순천시'>순천시</option><option value='신안군'>신안군</option><option value='여수시'>여수시</option>"
												+"<option value='영광군'>영광군</option><option value='영암군'>영암군</option><option value='완도군'>완도군</option><option value='장성군'>장성군</option><option value='장흥군'>장흥군</option><option value='진도군'>진도군</option>"
												+"<option value='함평군'>함평군</option><option value='해남군'>해남군</option><option value='화순군'>화순군</option>");
							}
							if ($("#si option:selected").val() == '전라븍도') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구<option value='고창군'>고창군</option><option value='군산시'>군산시</option><option value='김제시'>김제시</option><option value='남원시'>남원시</option><option value='무주군'>무주군</option>"
												+"<option value='부안군'>부안군</option><option value='순창군'>순창군</option><option value='완주군'>완주군</option><option value='익산시'>익산시</option><option value='임실군'>임실군</option><option value='장수군'>장수군</option>"
												+"<option value='전주시 덕진구'>전주시 덕진구</option><option value='전주시 완산구'>전주시 완산구</option><option value='정읍시'>정읍시</option><option value='진안군'>진안군</option>");
							}
							if ($("#si option:selected").val() == '대구광역시') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='남구'>남구</option><option value='달서구'>달서구</option><option value='달성군'>달성군</option><option value='동구'>동구</option><option value='북구'>북구</option><option value='서구'>서구</option><option value='수성구'>수성구</option><option value='중구'>중구</option>");
							}
							if ($("#si option:selected").val() == '경상북도') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='경산시'>경산시</option><option value='경주시'>경주시</option><option value='고령군'>고령군</option><option value='구미시'>구미시</option><option value='군위군'>군위군</option><option value='김천시'>김천시</option><option value='문경시'>문경시</option><option value='봉화군'>봉화군</option>"
												+"<option value='상주시'>상주시</option><option value='성주군'>성주군</option><option value='안동시'>안동시</option><option value='영덕군'>영덕군</option><option value='영양군'>영양군</option><option value='영주시'>영주시</option><option value='영천시'>영천시</option><option value='예천군'>예천군</option><option value='울릉군'>울릉군</option>"
												+"<option value='울진군'>울진군</option><option value='의성군'>의성군</option><option value='청도군'>청도군</option><option value='청송군'>청송군</option><option value='칠곡군'>칠곡군</option><option value='포항시 남구'>포항시 남구</option><option value='포항시 북구'>포항시 북구</option>");
							}
							if ($("#si option:selected").val() == '부산광역시') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='강서구'>강서구</option><option value='금정구'>금정구</option><option value='기장군'>기장군</option><option value='남구'>남구</option><option value='동구'>동구</option><option value='동래구'>동래구</option><option value='부산진구'>부산진구</option><option value='북구'>북구</option>"
												+"<option value='사상구'>사상구</option><option value='사하구'>사하구</option><option value='서구'>서구</option><option value='수영구'>수영구</option><option value='연제구'>연제구</option><option value='영도구'>영도구</option><option value='중구'>중구</option><option value='해운대구'>해운대구</option>");
							}
							if ($("#si option:selected").val() == '울산광역시') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='남구'>남구</option><option value='동구'>동구</option><option value='북구'>북구</option><option value='울주군'>울주군</option><option value='중구'>중구</option>");
							}
							if ($("#si option:selected").val() == '경상남도') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='거제시'>거제시</option><option value='거창군'>거창군</option><option value='고성군'>고성군</option><option value='김해시'>김해시</option><option value='남해군'>남해군</option><option value='밀양시'>밀양시</option><option value='사천시'>사천시</option><option value='산청군'>산청군</option>"
												+"<option value='양산시'>양산시</option><option value='의령군'>의령군</option><option value='진주시'>진주시</option><option value='창녕군'>창녕군</option><option value='창원시 마산합포구'>창원시 마산합포구</option><option value='창원시 마산회원구'>창원시 마산회원구</option><option value='창원시 성산구'>창원시 성산구</option>"
												+"<option value='창원시 의창구'>창원시 의창구</option><option value='창원시 진해구'>창원시 진해구</option><option value='통영시'>통영시</option><option value='하동군'>하동군</option><option value='함안군'>함안군</option><option value='함양군'>함양군</option><option value='합천군'>합천군</option>");
							}
							if ($("#si option:selected").val() == '강원도') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='강릉시'>강릉시</option><option value='고성군'>고성군</option><option value='동해시'>동해시</option><option value='삼척시'>삼척시</option><option value='속초시'>속초시</option><option value='양구군'>양구군</option><option value='양양군'>양양군</option>"
												+"<option value='영월군'>영월군</option><option value='원주시'>원주시</option><option value='인제군'>인제군</option><option value='정선군'>정선군</option><option value='철원군'>철원군</option><option value='춘천시'>춘천시</option>"
												+"<option value='태백시'>태백시</option><option value='평창군'>평창군</option><option value='홍천군'>홍천군</option><option value='화천군'>화천군</option><option value='횡성군'>횡성군</option>");
							}
							if ($("#si option:selected").val() == '제주도') {
								$("#gu").children().remove();
								$("#gu")
										.html(
												"<option value='구'>구</option><option value='서귀포시'>서귀포시</option><option value='제주시'>제주시</option>");
							}
					
							
							
						});
	</script>
	

	
	
</body>
</html>
