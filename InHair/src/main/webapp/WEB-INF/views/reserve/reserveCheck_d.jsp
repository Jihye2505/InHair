<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>check</title>
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
<style type="text/css">
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
		<input id="tab1" type="radio" name="tabs" checked /> <label
			class="tab" for="tab1">예약확인</label> <input id="tab3" type="radio"
			name="tabs" /> <label class="tab" for="tab3">나의 예약</label>


		<section class="well tab-content" id="content1">

			<h2 class="media-heading">예약확인</h2>
			<hr align="left" style="border: solid 1px #EA5554; width: 20%;">
			<form class="form-horizontal" id="" action="#" method="POST">

				<script
					src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
				<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

				<div class="container" id="conclass">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
							
								<table id="mytable" class="table table-bordred table-striped">
                                <thead>
                                <tr class="checktr">
                                    <th class="checkth"><img src="${ctx}/resources/images/logo.png" width="70px"/></th>
                                    
                                </tr>
                                </thead>
                                	
                                <tbody id="reserveDesignerList">
									<c:forEach items="${designerList}" var="designer" varStatus="status">
									<tr>
										<td width="15%">&nbsp;</td>
										<td width="35%"><h3 id ="designerName">${designer.name}</h3><h5>${designer.intro}</h5></td>
										<td width="35%"><img class="img-circle" alt="140x140" src="${ctx}/designer/image?designer_id=
										${designer.id}" width="140px" height="140px"></td>
										<td width="15%">&nbsp;</td>
									</tr>
									<tr>
										<td width="15%">&nbsp;</td>
										<td colspan="2">
										<c:forEach items="${designer.schedule}" var="schedule" varStatus="i">
										<span>
											<input id="${designer.name}${status.index}" type="text" name="timeGroup" class="shop timeBtn" value="${stauts.index}" />
											<label class="btn btn-circle nextBtn timeBtn" for="${designer.name}${status.index}">
											<c:choose>
												<c:when test="${schedule == 0}">
													<c:if test="${i.index == 0}">
														00:00
													</c:if>
													<c:if test="${i.index == 1}">
														00:30
													</c:if> <c:if test="${i.index == 2}">
														01:00
													</c:if> <c:if test="${i.index == 3}">
														01:30
													</c:if> <c:if test="${i.index == 4}">
														02:00
													</c:if> <c:if test="${i.index == 5}">
														02:30
													</c:if> <c:if test="${i.index == 6}">
														03:00
													</c:if> <c:if test="${i.index == 7}">
														03:30
													</c:if> <c:if test="${i.index == 8}">
														04:00
													</c:if> <c:if test="${i.index == 9}">
														04:30
													</c:if> <c:if test="${i.index == 10}">
														05:00
													</c:if> <c:if test="${i.index == 11}">
														05:30
													</c:if> <c:if test="${i.index == 12}">
														06:00
													</c:if> <c:if test="${i.index == 13}">
														06:30
													</c:if> <c:if test="${i.index == 14}">
														07:00
													</c:if> <c:if test="${i.index == 15}">
														07:30
													</c:if> <c:if test="${i.index == 16}">
														08:00
													</c:if> <c:if test="${i.index == 17}">
														08:30
													</c:if> <c:if test="${i.index == 18}">
														09:00
													</c:if> <c:if test="${i.index == 19}">
														09:30
													</c:if> <c:if test="${i.index == 20}">
														10:00
													</c:if> <c:if test="${i.index == 21}">
														10:30
													</c:if> <c:if test="${i.index == 22}">
														11:00
													</c:if> <c:if test="${i.index == 23}">
														11:30
													</c:if> <c:if test="${i.index == 24}">
														12:00
													</c:if> <c:if test="${i.index == 25}">
														12:30
													</c:if> <c:if test="${i.index == 26}">
														13:00
													</c:if> <c:if test="${i.index == 27}">
														13:30
													</c:if> <c:if test="${i.index == 28}">
														14:00
													</c:if> <c:if test="${i.index == 29}">
														14:30
													</c:if> <c:if test="${i.index == 30}">
														15:00
													</c:if> <c:if test="${i.index == 31}">
														15:30
													</c:if> <c:if test="${i.index == 32}">
														16:00
													</c:if> <c:if test="${i.index == 33}">
														16:30
													</c:if> <c:if test="${i.index == 34}">
														17:00
													</c:if> <c:if test="${i.index == 35}">
														17:30
													</c:if> <c:if test="${i.index == 36}">
														18:00
													</c:if> <c:if test="${i.index == 37}">
														18:30
													</c:if> <c:if test="${i.index == 38}">
														19:00
													</c:if> <c:if test="${i.index == 39}">
														19:30
													</c:if> <c:if test="${i.index == 40}">
														20:00
													</c:if> <c:if test="${i.index == 41}">
														20:30
													</c:if> <c:if test="${i.index == 42}">
														21:00
													</c:if> <c:if test="${i.index == 43}">
														21:30
													</c:if> <c:if test="${i.index == 44}">
														22:00
													</c:if> <c:if test="${i.index == 45}">
														22:30
													</c:if> <c:if test="${i.index == 46}">
														23:00
													</c:if> <c:if test="${i.index == 47}">
														23:30
													</c:if>
												</c:when>
												<c:otherwise>
													X
												</c:otherwise>
											</c:choose>
																						
											</label>
											</span>
										</c:forEach>
										</td>
										<td width="15%">&nbsp;</td>
										
									</tr>
									</c:forEach>
									<br>
								</tbody>
                            </table>


							</div>

						</div>
					</div>
				</div>


			</form>
		</section>


		<!--나의예약시작-->
		<section class="well tab-content" id="content3">
			<h2 class="media-heading">나의 예약</h2>
			<hr align="left" style="border: solid 1px #EA5554; width: 20%;">
			<br />

			<form id="userSecession" action="${ctx}/user/secession" method="POST">

				<div class="container" id="conclass2">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">

								<table class="table table-striped table-bordered table-hover"
									style="margin: auto;" align="center">
									<thead align="center"
										style="background-color: #5D5D5D; color: #CCC;">
										<tr>
											<th style="text-align: center">시간</th>
											<th style="text-align: center">시술명</th>
											<th style="text-align: center">예약자명</th>
											<th style="text-align: center">예약자 전화번호</th>
											<th style="text-align: center"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${reserveDesignerList}" var="reserve">
											<tr>
												<c:if test="${reserve.time == 0}">
													<td align="center">00:00</td>
												</c:if>
												<c:if test="${reserve.time == 1}">
													<td align="center">00:30</td>
												</c:if>
												<c:if test="${reserve.time == 2}">
													<td align="center">01:00</td>
												</c:if>
												<c:if test="${reserve.time == 3}">
													<td align="center">01:30</td>
												</c:if>
												<c:if test="${reserve.time == 4}">
													<td align="center">02:00</td>
												</c:if>
												<c:if test="${reserve.time == 5}">
													<td align="center">02:30</td>
												</c:if>
												<c:if test="${reserve.time == 6}">
													<td align="center">03:00</td>
												</c:if>
												<c:if test="${reserve.time == 7}">
													<td align="center">03:30</td>
												</c:if>
												<c:if test="${reserve.time == 8}">
													<td align="center">04:00</td>
												</c:if>
												<c:if test="${reserve.time == 9}">
													<td align="center">04:30</td>
												</c:if>
												<c:if test="${reserve.time == 10}">
													<td align="center">05:00</td>
												</c:if>
												<c:if test="${reserve.time == 11}">
													<td align="center">05:30</td>
												</c:if>
												<c:if test="${reserve.time == 12}">
													<td align="center">06:00</td>
												</c:if>
												<c:if test="${reserve.time == 13}">
													<td align="center">06:30</td>
												</c:if>
												<c:if test="${reserve.time == 14}">
													<td align="center">07:00</td>
												</c:if>
												<c:if test="${reserve.time == 15}">
													<td align="center">07:30</td>
												</c:if>
												<c:if test="${reserve.time == 16}">
													<td align="center">08:00</td>
												</c:if>
												<c:if test="${reserve.time == 17}">
													<td align="center">08:30</td>
												</c:if>
												<c:if test="${reserve.time == 18}">
													<td align="center">09:00</td>
												</c:if>
												<c:if test="${reserve.time == 19}">
													<td align="center">09:30</td>
												</c:if>
												<c:if test="${reserve.time == 20}">
													<td align="center">10:00</td>
												</c:if>
												<c:if test="${reserve.time == 21}">
													<td align="center">10:30</td>
												</c:if>
												<c:if test="${reserve.time == 22}">
													<td align="center">11:00</td>
												</c:if>
												<c:if test="${reserve.time == 23}">
													<td align="center">11:30</td>
												</c:if>
												<c:if test="${reserve.time == 24}">
													<td align="center">12:00</td>
												</c:if>
												<c:if test="${reserve.time == 25}">
													<td align="center">12:30</td>
												</c:if>
												<c:if test="${reserve.time == 26}">
													<td align="center">13:00</td>
												</c:if>
												<c:if test="${reserve.time == 27}">
													<td align="center">13:30</td>
												</c:if>
												<c:if test="${reserve.time == 28}">
													<td align="center">14:00</td>
												</c:if>
												<c:if test="${reserve.time == 29}">
													<td align="center">14:30</td>
												</c:if>
												<c:if test="${reserve.time == 30}">
													<td align="center">15:00</td>
												</c:if>
												<c:if test="${reserve.time == 31}">
													<td align="center">15:30</td>
												</c:if>
												<c:if test="${reserve.time == 32}">
													<td align="center">16:00</td>
												</c:if>
												<c:if test="${reserve.time == 33}">
													<td align="center">16:30</td>
												</c:if>
												<c:if test="${reserve.time == 34}">
													<td align="center">17:00</td>
												</c:if>
												<c:if test="${reserve.time == 35}">
													<td align="center">17:30</td>
												</c:if>
												<c:if test="${reserve.time == 36}">
													<td align="center">18:00</td>
												</c:if>
												<c:if test="${reserve.time == 37}">
													<td align="center">18:30</td>
												</c:if>
												<c:if test="${reserve.time == 38}">
													<td align="center">19:00</td>
												</c:if>
												<c:if test="${reserve.time == 39}">
													<td align="center">19:30</td>
												</c:if>
												<c:if test="${reserve.time == 40}">
													<td align="center">20:00</td>
												</c:if>
												<c:if test="${reserve.time == 41}">
													<td align="center">20:30</td>
												</c:if>
												<c:if test="${reserve.time == 42}">
													<td align="center">21:00</td>
												</c:if>
												<c:if test="${reserve.time == 43}">
													<td align="center">21:30</td>
												</c:if>
												<c:if test="${reserve.time == 44}">
													<td align="center">22:00</td>
												</c:if>
												<c:if test="${reserve.time == 45}">
													<td align="center">22:30</td>
												</c:if>
												<c:if test="${reserve.time == 46}">
													<td align="center">23:00</td>
												</c:if>
												<td align="center">${reserve.productName}</td>
												<td align="center">${reserve.userName}</td>
												<td align="center">${reserve.userPhone}</td>
												<td align="center"><a href="${ctx}/reserve/fulfill?userId=${reserve.reserve_id}&productName=${reserve.productName}" class="btn btn-danger" role="button">확인</a>
													<a href="${ctx}/reserve/unfulfilled?userId=${reserve.reserve_id}&productName=${reserve.productName}" class="btn btn-success" role="button" onclick="return confirm(&quot;이 예약을 취소하시겠습니까?&quot;)">취소 </a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<br>


							</div>

						</div>
					</div>
				</div>

			</form>

		</section>
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