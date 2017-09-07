<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v2.7, mobirise.com">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon"
	href="assets/images/discover-mobile-350x350-16.png" type="image/x-icon">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<meta name="description" content="Free Bootstrap Template">
<title>mypage</title>
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
	<div class="container">

		<%@ include file="/WEB-INF/views/header/header.jspf"%>
		<c:if test="${option == 1}">
				<input id="tab1" type="radio" name="tabs" />
				<label class="tab" for="tab1">마이 페이지</label>
	
				<input id="tab2" type="radio" name="tabs" />
				<label class="tab myReserve" for="tab2">나의 예약</label>
	
				<input id="tab3" type="radio" name="tabs" checked />
				<label class="tab" for="tab3">탈퇴</label>
		</c:if>
		<c:if test="${option != 1}">
				<input id="tab1" type="radio" name="tabs" checked />
				<label class="tab" for="tab1">마이 페이지</label>
	
				<input id="tab2" type="radio" name="tabs" />
				<label class="tab myReserve" for="tab2">나의 예약</label>
	
				<input id="tab3" type="radio" name="tabs" />
				<label class="tab" for="tab3">탈퇴</label>
		</c:if>
		<section class="well tab-content" id="content1">


			<h2 class="media-heading">마이 페이지</h2>
			<hr align="left" style="border: solid 1px #EA5554; width: 20%;">
			<br> <br>

			<form class="form-horizontal" id="formJoin"
				action="${ctx}/user/update" method="POST">
				<table width="600" border="0" align="center">
					<tbody>
						<tr>
							<td><label for="textfield">PASSWORD</label></td>
							<td><input class="form-control"
								style="width: 400px; height: 35px" maxlength="10"
								type="password" name="password" id="iptPassword"
								placeholder="비밀번호"></td>
						</tr>
						<tr>
							<td><label for="textfield">PASSWORD CHECK</label></td>
							<td><input class="form-control"
								style="width: 400px; height: 35px" maxlength="10"
								type="password" name="rePassword" id="iptRePassword"
								placeholder="비밀번호 확인"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label for="textfield">NAME</label></td>
							<td><input type="text" class="form-control" name="name"
								id="iptName" maxlength="10" placeholder="이름"
								value="${loginedUser.name}"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label for="textfield">EMAIL</label></td>
							<td><input type="text" class="form-control" name="email"
								id="iptEmail" maxlength="25" placeholder="E-Mail"
								value="${loginedUser.email}"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label for="textfield">PHONE</label></td>
							<td><input type="text" class="form-control" name="phonenum"
								id="iptPhone" placeholder="전화번호" value="${loginedUser.phonenum}"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<br>

				<div align="center">
					<input type="reset" class="btn btn-success" value="취소"> <input
						type="submit" class="btn btn-danger" value="수정"
						onclick="join(); return false;"> <br>
				</div>
			</form>

		</section>
		<section class="well tab-content" id="content2">
			<h2 class="media-heading">나의 예약</h2>
			<hr align="left" style="border: solid 1px #EA5554; width: 20%;">
			<br />
			<hr>
			<table class="table table-striped table-bordered table-hover"
				style="margin: auto;" align="center">
				<thead align="center"
					style="background-color: #5D5D5D; color: #CCC;">
					<tr>
						<th style="text-align: center">날짜</th>
						<th style="text-align: center">시간</th>
						<th style="text-align: center">미용실</th>
						<th style="text-align: center">디자이너</th>
						<th style="text-align: center">시술명</th>
						<th style="text-align: center">가격</th>
						<th style="text-align: center"></th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${reserveUserList}" var="reserve">
						<tr>
							<td>${reserve.days}</td>
							<c:if test="${reserve.time == 0}">
								<td>00:00</td>
							</c:if>
							<c:if test="${reserve.time == 1}">
								<td>00:30</td>
							</c:if>
							<c:if test="${reserve.time == 2}">
								<td>01:00</td>
							</c:if>
							<c:if test="${reserve.time == 3}">
								<td>01:30</td>
							</c:if>
							<c:if test="${reserve.time == 4}">
								<td>02:00</td>
							</c:if>
							<c:if test="${reserve.time == 5}">
								<td>02:30</td>
							</c:if>
							<c:if test="${reserve.time == 6}">
								<td>03:00</td>
							</c:if>
							<c:if test="${reserve.time == 7}">
								<td>03:30</td>
							</c:if>
							<c:if test="${reserve.time == 8}">
								<td>04:00</td>
							</c:if>
							<c:if test="${reserve.time == 9}">
								<td>04:30</td>
							</c:if>
							<c:if test="${reserve.time == 10}">
								<td>05:00</td>
							</c:if>
							<c:if test="${reserve.time == 11}">
								<td>05:30</td>
							</c:if>
							<c:if test="${reserve.time == 12}">
								<td>06:00</td>
							</c:if>
							<c:if test="${reserve.time == 13}">
								<td>06:30</td>
							</c:if>
							<c:if test="${reserve.time == 14}">
								<td>07:00</td>
							</c:if>
							<c:if test="${reserve.time == 15}">
								<td>07:30</td>
							</c:if>
							<c:if test="${reserve.time == 16}">
								<td>08:00</td>
							</c:if>
							<c:if test="${reserve.time == 17}">
								<td>08:30</td>
							</c:if>
							<c:if test="${reserve.time == 18}">
								<td>09:00</td>
							</c:if>
							<c:if test="${reserve.time == 19}">
								<td>09:30</td>
							</c:if>
							<c:if test="${reserve.time == 20}">
								<td>10:00</td>
							</c:if>
							<c:if test="${reserve.time == 21}">
								<td>10:30</td>
							</c:if>
							<c:if test="${reserve.time == 22}">
								<td>11:00</td>
							</c:if>
							<c:if test="${reserve.time == 23}">
								<td>11:30</td>
							</c:if>
							<c:if test="${reserve.time == 24}">
								<td>12:00</td>
							</c:if>
							<c:if test="${reserve.time == 25}">
								<td>12:30</td>
							</c:if>
							<c:if test="${reserve.time == 26}">
								<td>13:00</td>
							</c:if>
							<c:if test="${reserve.time == 27}">
								<td>13:30</td>
							</c:if>
							<c:if test="${reserve.time == 28}">
								<td>14:00</td>
							</c:if>
							<c:if test="${reserve.time == 29}">
								<td>14:30</td>
							</c:if>
							<c:if test="${reserve.time == 30}">
								<td>15:00</td>
							</c:if>
							<c:if test="${reserve.time == 31}">
								<td>15:30</td>
							</c:if>
							<c:if test="${reserve.time == 32}">
								<td>16:00</td>
							</c:if>
							<c:if test="${reserve.time == 33}">
								<td>16:30</td>
							</c:if>
							<c:if test="${reserve.time == 34}">
								<td>17:00</td>
							</c:if>
							<c:if test="${reserve.time == 35}">
								<td>17:30</td>
							</c:if>
							<c:if test="${reserve.time == 36}">
								<td>18:00</td>
							</c:if>
							<c:if test="${reserve.time == 37}">
								<td>18:30</td>
							</c:if>
							<c:if test="${reserve.time == 38}">
								<td>19:00</td>
							</c:if>
							<c:if test="${reserve.time == 39}">
								<td>19:30</td>
							</c:if>
							<c:if test="${reserve.time == 40}">
								<td>20:00</td>
							</c:if>
							<c:if test="${reserve.time == 41}">
								<td>20:30</td>
							</c:if>
							<c:if test="${reserve.time == 42}">
								<td>21:00</td>
							</c:if>
							<c:if test="${reserve.time == 43}">
								<td>21:30</td>
							</c:if>
							<c:if test="${reserve.time == 44}">
								<td>22:00</td>
							</c:if>
							<c:if test="${reserve.time == 45}">
								<td>22:30</td>
							</c:if>
							<c:if test="${reserve.time == 46}">
								<td>23:00</td>
							</c:if>
							<c:if test="${reserve.time == 47}">
								<td>23:30</td>
							</c:if>
							<td>${reserve.shopName}</td>
							<td>${reserve.designerName}</td>
							<td>${reserve.productName}</td>
							<td>${reserve.price}</td>
							<td><a href="${ctx}/reserve/delete?reserve_id=${reserve.reserve_id}" class="btn btn-success" role="button" onclick="return confirm(&quot;이 예약을 취소하시겠습니까?&quot;)">취소 </a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</section>
		<section class="well tab-content" id="content3">
			<h2 class="media-heading">탈퇴</h2>
			<hr align="left" style="border: solid 1px #EA5554; width: 20%;">
			<h5 align="left">탈퇴를 위한 비밀번호를 입력해주세요.</h5>
			<br> <br>
			<form id="userSecession" action="${ctx}/user/secession" method="POST">
				<table width="800px" border="0" align="center">
					<tbody>
						<tr>
							<td><label for="textfield" id="userPassword">PASSWORD</label></td>
							<td><input style="width: 400px; height: 35px"
								type="password" name="password" class="form-control"
								id="password" placeholder="비밀번호"></td>
							<td><button type="submit" class="btn btn-danger" onclick="return confirm(&quot;정말로 탈퇴하시겠습니까?&quot;)">확인</button></td>
							<!-- onclick="check(); return false;" -->
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</form>
		</section>

	</div>


	<footer class="footer"
		style="display: block; background-color: #5D5D5D; height: 80px; text-align: center">
		<br> &copy; Copyright 2016 TeamName ㅈㄴㅂㄴ


	</footer>
	<script type="text/javascript">
var validate = function() {
    if(document.getElementById("iptName").value == "") {
       alert("이름을 입력하세요");
       document.getElementById("iptName").focus();
       return false;
    }
    if(document.getElementById("iptEmail").value == "") {
       alert("이메일을 입력하세요");
       document.getElementById("iptEmail").focus();
       return false;
    } 
    if(document.getElementById("iptPassword").value == "") {
       alert("비밀번호를 입력하세요");
       document.getElementById("iptPassword").focus();
       return false;
    }
    if(document.getElementById("iptRePassword").value == "") {
       alert("비밀번호 확인을 입력하세요");
       document.getElementById("iptRePassword").focus();
       return false;
    }
    if(document.getElementById("iptPhone").value == "") {
       alert("휴대폰번호를 입력하세요");
       document.getElementById("iptPhone").focus();
       return false;
    }
    
    //비밀번호, 비밀번호 확인 항목이 일치하는지 비교
    if(document.getElementById("iptPassword").value != document.getElementById("iptRePassword").value) {
       alert("비밀번호가 일치하지 않습니다.");
       document.getElementById("iptPassword").value = "";
       document.getElementById("iptRePassword").value = "";
       document.getElementById("iptPassword").focus();
       return false;
    }
    
    return true;
 };
 
 var join = function() {
    if(validate()) {
       document.getElementById("formJoin").submit();
    }
 };
 
 if(${option == 1}) {
		alert("비밀번호가 일치하지 않습니다.");
		<%session.removeAttribute("option");%> 
	};
	
	if(${resultReserve == 1}) {
		alert("예약완료");
		document.getElementById("tab2").setAttribute("checked", "checked");
		<%session.removeAttribute("resultReserve");%> 
	}
	

</script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${ctx}/resources/js/jquery-1.11.3.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${ctx}/resources/js/bootstrap.js"></script>
</body>
</html>