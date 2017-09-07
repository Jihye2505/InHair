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
<meta name="description" content="Free Bootstrap Template">
<title>reserve</title>
<!--     <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Roboto:700,400&amp;pset=cyrillic,latin,greek,vietnamese">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/mobirise/css/style.css">
    <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css"> -->
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<!-- Bootstrap -->
<link rel="stylesheet" href="${ctx}/resources/css/bootstrap.css">
<style type="text/css">
input:checked+label{
 	background-color: #FFFFFF;
	color: #262626;
 }
 .timeBtn {
width: 70px; 
background-color: #898989; 
color: #FFFFFF; 
height: 30px; 
margin-left: 5px; 
margin-top: 5px;"
 }
 .timeBtn:checked+label{
 background-color: #FFFFFF; 
color: #898989; 
 }
</style>
</head>
<body>

	<div class="container">

		<%@ include file="/WEB-INF/views/header/header.jspf"%>
		<div class="stepwizard">
			<div class="stepwizard-row setup-panel">
				<div class="stepwizard-step">
					<a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
					<p>미용실</p>
				</div>
				<div class="stepwizard-step">
					<a href="#step-2" type="button" class="btn btn-default btn-circle"
						disabled="disabled">2</a>
					<p>스타일</p>
				</div>
				<div class="stepwizard-step">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">3</a>
					<p>디자이너 및 시간</p>
				</div>
				<div class="stepwizard-step">
					<a href="#step-4" type="button" class="btn btn-default btn-circle"
						disabled="disabled">4</a>
					<p>예약자정보</p>
				</div>
				<div class="stepwizard-step">
					<a href="#step-5" type="button" class="btn btn-default btn-circle"
						disabled="disabled">5</a>
					<p>예약완료</p>
				</div>
			</div>
		</div>
		<form role="form" action="${ctx}/reserve/userCreate" method="post">
			<div class="row setup-content" id="step-1">
				<div class="col-xs-12">
					<div class="col-md-12">
						<h3>Step 1</h3>
						<p>&nbsp;</p>
						<div class="form-group">
							<table width="100%">
								<tr>
									<!-- <td width="20%">&nbsp;</td> -->
									<td width="20%">
									<select id="si" name="si" style="width: 150px">
											<option>시/도</option>
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
									<td><select name="gu" id="gu" style="width: 180px">
											<option value='구'>구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
											
									</select></td>
									<td width="20%">&nbsp;</td>
								</tr>
								<tr>
									<td width="20%">&nbsp;</td>
								</tr>
								<tr>
									<td colspan="5">
										<table class="table table-striped table-bordered table-hover"
											style="margin: auto;" align="center" id="hairTable">
											<thead align="center"
												style="background-color: #5D5D5D; color: #CCC;">
												<tr>
													<th style="text-align: center" width="30%">상호명</th>
													<th style="text-align: center" width="65%">주소</th>
													<th style="text-align: center" width="5%">선택</th>
												</tr>
											</thead>
											<tbody id="hairBody">

											</tbody>
										</table>
									</td>
								</tr>
							</table>
							<br> <br>
						</div>
					</div>
				</div>
			</div>
			<div class="row setup-content" id="step-2">
				<div class="col-xs-12">
					<div class="col-md-12">
						<h3>Step 2</h3>
						<p>&nbsp;</p>
						<h5>
							※ 머리길이에 따라 추가 비용이 발생할 수 있습니다.
							</h4>
							<div class="form-group">
								<table width="100%">
									<tr>
										<td width="100%">
											<table class="table table-striped table-bordered table-hover"
												style="margin: auto;" align="center">
												<thead align="center"
													style="background-color: #5D5D5D; color: #CCC;">
													<tr>
														<th style="text-align: center" width="30%">스타일</th>
														<th style="text-align: center" width="30%">소요시간</th>
														<th style="text-align: center" width="30%">가격</th>
														<th style="text-align: center" width="5%">선택</th>
													</tr>
												</thead>
												<tbody id="styleBody">

												</tbody>
											</table>
										</td>
									</tr>
								</table>
								<br> <br>
							</div>
					</div>
				</div>
			</div>
			<div class="row setup-content" id="step-3">
				<div class="col-xs-12">
					<div class="col-md-12">
						<h3>Step 3</h3>
						<p>&nbsp;</p>
						<div class="form-group">
							<table width="100%">
								<tr>
								<c:forEach items="${days}" var="days">
									<td width="4%">&nbsp;</td>
									<td width="10%"><input id="date${days}" type="radio" name="dayGroup"
										class="shop date" value="${days}" /> <label style="width: 50px; height: 50px;"
										class="btn btn-danger btn-circle" for="date${days}" id="dateView${days}">${days}일</label>
										</td>
								</c:forEach>
								</tr>
							</table>
							<hr style="color: #5D5D5D; width: 100%; border: solid" />
							<table width="100%" id="designerTable">
								<tbody id="designerBody">
								
								</tbody>
							</table>
							<br> <br>
						</div>
					</div>
				</div>
			</div>
			<div class="row setup-content" id="step-4">
				<div class="col-xs-12">
					<div class="col-md-12">
						<h3>Step 4</h3>
						<p>&nbsp;</p>
						<div class="form-group">
							<table width="100%">
								<tr>
									<td width="5%">&nbsp;</td>
									<td width="30%">이름</td>
									<td width="5%">&nbsp;</td>
									<td width="30%">휴대폰번호</td>
									<td width="5%">&nbsp;</td>
									<!-- <td width="25%">성별</td>
                            <td width="5%">&nbsp;</td> -->
								</tr>
								<tbody id="userBody">
								<tr>
									<td width="5%"></td>
									<td width="30%"><input type="text" id="userName" value="${loginedUser.name}"></td>
									<td width="5%"></td>
									<td width="30%">
										<input type="text" id="userPhone" value="${loginedUser.phonenum}">
										<input type="text" id="userId" style="display:none;" value="${loginedUser.id}">
									</td>
									<td width="5%">
										<!--  <td width="25%">
                                <input type="radio" value="1">남자
                                <input type="radio" value="2">여자
                            </td>
                            <td width="5%">&nbsp;</td> -->
								</tr>
								</tbody>
							</table>
							<br> <br>
							<p align="right">
								<button class="btn btn-danger nextBtn btn-lg pull-right" id="okNext"
									type="button">입력완료</button>
							</p>
							<br> <br>
						</div>
					</div>
				</div>
			</div>
			<div class="row setup-content" id="step-5">
				<div class="col-xs-12">
					<div class="col-md-12">
						<h3>예약상세정보</h3>
						<p>&nbsp;</p>
						<hr style="color: #5D5D5D; width: 100%; border: solid" />
						<div class="form-group">
							<h2 align="center">예약 정보 확인</h2>
							<table width="100%" id="successTable">
								<thead></thead>
							</table>
							<br> <br>
							<p align="right">
								<button class="btn btn-danger nextBtn btn-lg pull-right"
									type="submit">예약완료</button>
							</p>
						</div>
					</div>
				</div>
			</div>

		</form>
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

		//구 클릭
		$("#gu").change(function() {
		    var objParams = {
		    		gu : $("#gu").val() //검색할 코드 (실제로 예제에서는 사용 안함)
		    }
		 	$("#hairBody").children("tr").remove();

		    var values = []; //ArrayList 값을 받을 변수를 선언
		 
		    //검색할 코드를 넘겨서 값을 가져온다.      
		    $.post(
		        "${pageContext.request.contextPath}/reserve/hairshopSearchByGu", 
		        objParams,
		        function(retVal) {
		            if(retVal.code == "OK") { //controller에서 넘겨준 성공여부 코드
		                 
		                values = retVal.shopList ; //java에서 정의한 ArrayList명을 적어준다.
		                 
		                $.each(values, function(index, reuslt) {
							var tbody = document.getElementById('hairBody'); 
							var tr = document.createElement('tr'); 
							tr.innerHTML = 
								'<td align="center">'
								+ reuslt.shopName + 
								'</td><td align="center">'
								+ reuslt.address + 
								'</td><td><input id="shop' + index + '" type="radio" name="shopGroup" class="shop hairShop" value="' + reuslt.code + '" />' + 
								'<label class="btn btn-danger nextBtn btn-lg pull-right" for="shop' + index + '">선택</label></td>'; 
								tbody.appendChild(tr); 
						});
		            }
		            else {
		                alert("매장이 없습니다.");
		            }                   
		        }
		    );
		  //선택 클릭
			$(document).on("click",".hairShop",function(){ 
			    var objParams = {
			    		code : $("input[type=radio][name=shopGroup]:checked").val() //검색할 코드 (실제로 예제에서는 사용 안함)
			    }
			 	$("#styleBody").children("tr").remove();
			    var values = []; //ArrayList 값을 받을 변수를 선언
			 
			    //검색할 코드를 넘겨서 값을 가져온다.      
			    $.post(
			        "${pageContext.request.contextPath}/reserve/productSearchByShopCode", 
			        objParams,
			        function(retVal) {
			            if(retVal.code == "OK") { //controller에서 넘겨준 성공여부 코드
			                values = retVal.styleList; //java에서 정의한 ArrayList명을 적어준다.
			                 
			                $.each(values, function(index, style) {
								var tbody = document.getElementById('styleBody'); 
								var tr = document.createElement('tr');
								var time = style.leadtime;
								if(time == 1){
									time = '30분';
								}else if (time == 2) {
									time = '1시간';
								}else if (time == 3) {
									time = '1시간 30분';
								}else if (time == 4) {
									time = '2시간';
								}else if (time == 5) {
									time = '2시간 30분';
								}else if (time == 6) {
									time = '3시간';
								}else if (time == 7) {
									time = '3시간 30분';
								}else if (time == 8) {
									time = '4시간';
								}
								tr.innerHTML = 
									'<td align="center">'
									+ style.name + 
									'</td><td align="center">'
									+ time + 
									'</td><td align="center">'+ style.price +'</td>'+
									'<td><input id="style' + index + '" type="radio" name="styleGroup" class="shop style" value="'+style.leadtime+'" />' + 
									'<label class="btn btn-danger nextBtn btn-lg pull-right" for="style' + index + '">선택</label></td>'; 
									tbody.appendChild(tr); 
							});
			            }
			            else {
			                alert("매장이 없습니다.");
			            }                   
			        }
			    );
			});  // Style Ajax끝
			  //시술 선택 후 디자이너 AND 시간표
				$(document).on("click","input[type=radio][name=dayGroup]",function(){
				    var code = $("input[type=radio][name=shopGroup]:checked").val();
					var days = $("input[type=radio][name=dayGroup]:checked").val();
					var leadtime = $("input[type=radio][name=styleGroup]:checked").val();

				    var allData = { "code": code, "days": days, "leadtime": leadtime };
				    
				 	$("#designerBody").children("tr").remove();
				 	$("#designerBody").children("br").remove();
				    var values = []; //ArrayList 값을 받을 변수를 선언
				 
				    //검색할 코드를 넘겨서 값을 가져온다.      
				    $.post(
				        "${pageContext.request.contextPath}/reserve/designerSearchBySchedule", 
				        allData,
				        function(retVal) {
				            if(retVal.code == "OK") { //controller에서 넘겨준 성공여부 코드
				                 
				                values = retVal.designerList ; //java에서 정의한 ArrayList명을 적어준다.
				                 
				                $.each(values, function(index, result) {
				                	var tbody = document.getElementById('designerBody');
				                	var tr = document.createElement('tr');
				                	var tr2 = document.createElement('tr');
				                	var td = document.createElement('td'); 
				                	var td2 = document.createElement('td'); 
				                	var td3 = document.createElement('td'); 
				                	var br = document.createElement('br'); 
									tr.innerHTML = 
										'<td width="15%">&nbsp;</td>'
										+ '<td width="35%"><h3 id ="designerName">'+ result.name +'</h3><h5>'+ result.intro +'</h4></td>'
										+ '<td width="35%"><img class="img-circle" alt="140x140" src="${pageContext.request.contextPath}/designer/image?designer_id=' 
										+ result.id + 
										'" width="140px" height="140px"></td><td width="15%">&nbsp;</td>'; 
										$.each(result.schedule, function(index, schedule) {
											var p = document.createElement('span');
											var time = schedule;
											if(time == 0) {
												if(index == 0){
							                           time ='00:00';
							                        }else if (index == 1) {
							                           time = '00:30';
							                        }else if (index == 2) {
							                           time = '01:00';
							                        }else if (index == 3) {
							                           time = '01:30';
							                        }else if (index == 4) {
							                           time = '02:00';
							                        }else if (index == 5) {
							                           time = '02:30';
							                        }else if (index == 6) {
							                           time = '03:00';
							                        }else if (index == 7) {
							                           time = '03:30';
							                        }else if (index == 8) {
							                           time = '04:00';
							                        }else if (index == 9) {
							                           time = '04:30';
							                        }else if (index == 10) {
							                           time = '05:00';
							                        }else if (index == 11) {
							                           time = '05:30';
							                        }else if (index == 12) {
							                           time = '06:00';
							                        }else if (index == 13) {
							                           time = '06:30';
							                        }else if (index == 14) {
							                           time = '07:00';
							                        }else if (index == 15) {
							                           time = '07:30';
							                        }else if (index == 16) {
							                           time = '08:00';
							                        }else if (index == 17) {
							                           time = '08:30';
							                        }else if (index == 18) {
							                           time = '09:00';
							                        }else if (index == 19) {
							                           time = '09:30';
							                        }else if (index == 20) {
							                           time = '10:00';
							                        }else if (index == 21) {
							                           time = '10:30';
							                        }else if (index == 22) {
							                           time = '11:00';
							                        }else if (index == 23) {
							                           time = '11:30';
							                        }else if (index == 24) {
							                           time = '12:00';
							                        }else if (index == 25) {
							                           time = '12:30';
							                        }else if (index == 26) {
							                           time = '13:00';
							                        }else if (index == 27) {
							                           time = '13:30';
							                        }else if (index == 28) {
							                           time = '14:00';
							                        }else if (index == 29) {
							                           time = '14:30';
							                        }else if (index == 30) {
							                           time = '15:00';
							                        }else if (index == 31) {
							                           time = '15:30';
							                        }else if (index == 32) {
							                           time = '16:00';
							                        }else if (index == 33) {
							                           time = '16:30';
							                        }else if (index == 34) {
							                           time = '17:00';
							                        }else if (index == 35) {
							                           time = '17:30';
							                        }else if (index == 36) {
							                           time = '18:00';
							                        }else if (index == 37) {
							                           time = '18:30';
							                        }else if (index == 38) {
							                           time = '19:00';
							                        }else if (index == 39) {
							                           time = '19:30';
							                        }else if (index == 40) {
							                           time = '20:00';
							                        }else if (index == 41) {
							                           time = '20:30';
							                        }else if (index == 42) {
							                           time = '21:00';
							                        }else if (index == 43) {
							                           time = '21:30';
							                        }else if (index == 44) {
							                           time = '22:00';
							                        }else if (index == 45) {
							                           time = '22:30';
							                        }else if (index == 46) {
							                           time = '23:00';
							                        }else if (index == 47) {
							                           time = '23:30';
							                        }
			  									
											p.innerHTML = 
												'<input id="time'+ result.name + index + '" type="radio"	name="timeGroup" class="shop timeBtn" value="'+index+'" /> '
												+ '<label class="btn btn-circle nextBtn timeBtn" for="time'+ result.name + index + '">'
												+ time + '</label>';
											td.appendChild(p);
											td.setAttribute('colSpan', '2');
											
											}
										});
										tr2.appendChild(td2);
										tr2.appendChild(td);
										tr2.appendChild(td3);
										tbody.appendChild(tr);
										tbody.appendChild(tr2);
										tbody.appendChild(br);
								});
				            }
				            else {
				                alert("매장이 없습니다.");
				            }                   
				        }
				    );
				}); // 
			
		}); // 구 Ajax 끝
		
		//예약 완료 화면 Ajax
		$(document).on("click","#okNext",function(){
			
			$("#successTable").children("tbody").remove();
			var shopName = $("input[type=radio][name=shopGroup]:checked").parent().prev().prev().text(); // ok
			var shopAddress = $("input[type=radio][name=shopGroup]:checked").parent().prev().text(); // ok
			var designerName = $("input[type=radio][name=timeGroup]:checked").parent().parent().parent().prev().children().next().children("h3").text(); // ok
			var days = $("input[type=radio][name=dayGroup]:checked").val();
			var time = $("input[type=radio][name=timeGroup]:checked").val(); // ok
			var productName = $("input[type=radio][name=styleGroup]:checked").parent().prev().prev().prev().text(); // ok
			var leadtime = $("input[type=radio][name=styleGroup]:checked").val(); // ok
			var userName = $('#userName').val();  // ok
			var userPhone = $('#userPhone').val();  // ok
			var userId = $('#userId').val();  // ok
			var shopCode = $("input[type=radio][name=shopGroup]:checked").val(); // ok
			var price = $("input[type=radio][name=styleGroup]:checked").parent().prev().text(); // ok
			
			var times;
			if(time == 0){
				times ='00:00';
             }else if (time == 1) {
            	 times = '00:30';
             }else if (time == 2) {
            	 times = '01:00';
             }else if (time == 3) {
            	 times = '01:30';
             }else if (time == 4) {
            	 times = '02:00';
             }else if (time == 5) {
            	 times = '02:30';
             }else if (time == 6) {
            	 times = '03:00';
             }else if (time == 7) {
            	 times = '03:30';
             }else if (time == 8) {
            	 times = '04:00';
             }else if (time == 9) {
            	 times = '04:30';
             }else if (time == 10) {
            	 times = '05:00';
             }else if (time == 11) {
            	 times = '05:30';
             }else if (time == 12) {
            	 times = '06:00';
             }else if (time == 13) {
            	 times = '06:30';
             }else if (time == 14) {
            	 times = '07:00';
             }else if (time == 15) {
            	 times = '07:30';
             }else if (time == 16) {
            	 times = '08:00';
             }else if (time == 17) {
            	 times = '08:30';
             }else if (time == 18) {
            	 times = '09:00';
             }else if (time == 19) {
            	 times = '09:30';
             }else if (time == 20) {
            	 times = '10:00';
             }else if (time == 21) {
            	 times = '10:30';
             }else if (time == 22) {
            	 times = '11:00';
             }else if (time == 23) {
            	 times = '11:30';
             }else if (time == 24) {
            	 times = '12:00';
             }else if (time == 25) {
            	 times = '12:30';
             }else if (time == 26) {
            	 times = '13:00';
             }else if (time == 27) {
            	 times = '13:30';
             }else if (time == 28) {
            	 times = '14:00';
             }else if (time == 29) {
            	 times = '14:30';
             }else if (time == 30) {
            	 times = '15:00';
             }else if (time == 31) {
            	 times = '15:30';
             }else if (time == 32) {
            	 times = '16:00';
             }else if (time == 33) {
            	 times = '16:30';
             }else if (time == 34) {
            	 times = '17:00';
             }else if (time == 35) {
            	 times = '17:30';
             }else if (time == 36) {
            	 times = '18:00';
             }else if (time == 37) {
            	 times = '18:30';
             }else if (time == 38) {
            	 times = '19:00';
             }else if (time == 39) {
            	 times = '19:30';
             }else if (time == 40) {
            	 times = '20:00';
             }else if (time == 41) {
            	 times = '20:30';
             }else if (time == 42) {
            	 times = '21:00';
             }else if (time == 43) {
            	 times = '21:30';
             }else if (time == 44) {
            	 times = '22:00';
             }else if (time == 45) {
            	 times = '22:30';
             }else if (time == 46) {
            	 times = '23:00';
             }else if (time == 47) {
            	 times = '23:30';
             }
			var leadtimes;
			if(leadtime== 1){
				leadtimes= '30분';
			}else if (leadtime== 2) {
				leadtimes= '1시간';
			}else if (leadtime== 3) {
				leadtimes= '1시간 30분';
			}else if (leadtime== 4) {
				leadtimes= '2시간';
			}else if (leadtime== 5) {
				leadtimes= '2시간 30분';
			}else if (leadtime== 6) {
				leadtimes= '3시간';
			}else if (leadtime== 7) {
				leadtimes= '3시간 30분';
			}else if (leadtime== 8) {
				leadtimes= '4시간';
			}

			var d = new Date();
			
			
			var table = document.getElementById('successTable');
			var tbody = document.createElement('tbody');
			tbody.innerHTML = 
				'<tr>' +
					'<td width="15%">&nbsp;</td>' +
					'<td width="20%">상호명</td>'+
					'<td width="5%">&nbsp;<input id="address" name="shopCode" value="'+shopCode+'" style="display:none;"></td>'+
					'<td width="45%">'+shopName+'<input id="address" name="shopName" value="'+shopName+'" style="display:none;"></td>'+
					'<td width="15%">&nbsp;</td>'+
				'</tr>'+
				'<tr>'+
					'<td width="15%">&nbsp;</td>'+
					'<td width="20%">주소</td>'+
					'<td width="5%">&nbsp;</td>'+
					'<td width="45%">'+shopAddress+'<input id="address" name="shopAddress" value="'+shopAddress+'" style="display:none;"></td>'+
					'<td width="15%">&nbsp;</td>'+
				'</tr>'+
				'<tr>'+
					'<td width="15%">&nbsp;</td>'+
					'<td width="20%">예약 날짜</td>'+
					'<td width="5%">&nbsp;<input id="address" name="days" value="'+days+'" style="display:none;"></td>'+
					'<td width="45%">'+d.getFullYear()+'년 '+(d.getMonth() + 1)+'월 '+days+'일</td>'+
					'<td width="15%">&nbsp;</td>'+
				'</tr>'+
				'<tr>'+
					'<td width="15%">&nbsp;</td>'+
					'<td width="20%">예약 시간<input id="address" name="time" value="'+time+'" style="display:none;"></td>'+
					'<td width="5%">&nbsp;<input id="address" name="leadtime" value="'+leadtime+'" style="display:none;"></td>'+
					'<td width="45%">'+times+'(소요시간 : '+leadtimes+')</td>'+
					'<td width="15%">&nbsp;</td>'+
				'</tr>'+
				'<tr>'+
					'<td width="15%">&nbsp;</td>'+
					'<td width="20%">스타일<input id="address" name="productName" value="'+productName+'" style="display:none;"></td>'+
					'<td width="5%">&nbsp;<input id="address" name="price" value="'+price+'" style="display:none;"></td>'+
					'<td width="45%">'+productName+'('+price+'원)</td>'+
					'<td width="15%">&nbsp;</td>'+
				'</tr>'+
				'<tr>'+
					'<td width="15%">&nbsp;</td>'+
					'<td width="20%">디자이너</td>'+
					'<td width="5%">&nbsp;</td>'+
					'<td width="45%">'+designerName+'<input id="address" name="designerName" value="'+designerName+'" style="display:none;"></td>'+
					'<td width="15%">&nbsp;</td>'+
				'</tr>'+
				'<tr>'+
					'<td width="15%">&nbsp;</td>'+
					'<td width="20%">예약자<input id="address" name="userId" value="'+userId+'" style="display:none;"></td>'+
					'<td width="5%">&nbsp;<input id="address" name="userName" value="'+userName+'" style="display:none;"></td>'+
					'<td width="45%">'+userName+'('+userPhone+')<input id="address" name="userPhone" value="'+userPhone+'" style="display:none;"></td>'+
					'<td width="15%">&nbsp;</td>'+
				'</tr>';

				table.appendChild(tbody);
		});
					var navListItems = $('div.setup-panel div a'), allWells = $('.setup-content');

					allWells.hide();

					navListItems
							.click(function(e) {
								e.preventDefault();
								var $target = $($(this).attr('href')), $item = $(this);

								if (!$item.hasClass('disabled')) {
									navListItems.removeClass(
											'btn-primary').addClass(
											'btn-default');
									$item.addClass('btn-primary');
									allWells.hide();
									$target.show();
									$target.find('input:eq(0)').focus();
								}
							});

					$(document).on("click",".nextBtn",function(){ 
								var curStep = $(this).closest(
										".setup-content"), curStepBtn = curStep
										.attr("id"), nextStepWizard = $(
										'div.setup-panel div a[href="#'
												+ curStepBtn + '"]')
										.parent().next().children("a"), curInputs = curStep
										.find("input[type='text'],input[type='url']"), isValid = true;

								$(".form-group").removeClass(
										"has-error");
								for (var i = 0; i < curInputs.length; i++) {
									if (!curInputs[i].validity.valid) {
										isValid = false;
										$(curInputs[i]).closest(
												".form-group")
												.addClass("has-error");
									}
								}

								if (isValid)
									nextStepWizard.removeAttr(
											'disabled')
											.trigger('click');
							});

					$('div.setup-panel div a.btn-primary').trigger(
							'click');
		
	</script>
</body>
</html>