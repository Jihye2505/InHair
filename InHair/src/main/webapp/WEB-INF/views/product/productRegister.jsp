<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>productRegister</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v2.7, mobirise.com">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="description" content="Free Bootstrap Template">
<link rel="shortcut icon"
	href="assets/images/discover-mobile-350x350-16.png" type="image/x-icon">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Bootstrap -->
<link rel="stylesheet" href="${ctx}/resources/css/bootstrap.css">


<script type="text/javascript">
	var validate = function() {
		if (document.getElementById("name").value == "") {
			alert("시술명을 입력하세요");
			document.getElementById("name").focus();
			return false;
		}
		if (document.getElementById("leadtime").value == "") {
			alert("소요시간을 입력하세요");
			document.getElementById("leadtime").focus();
			return false;
		}
		if (document.getElementById("price").value == "") {
			alert("가격을 입력하세요");
			document.getElementById("price").focus();
			return false;
		}
		return true;
	};
	var create = function() {
		if(validate()) {
			document.getElementById("productCreate").submit();
		}
	};
</script>
</head>
<body>

<div class="container">

		<%@ include file="/WEB-INF/views/header/header.jspf"%>
    <div>

        <h2 class="media-heading">상품 등록</h2>
        <hr align="left" style="border: solid 1px #EA5554; width:20%;">


    </div>
    <div>

        <div class="well">
            <h3 class="text-center"></h3>

            <form class="form-horizontal" id="productCreate" action="${ctx }/product/create" method="POST">
	
		<input id=shopCode name="shopCode" type="hidden" value="${shopCode}">

                <table width="600" border="0" align="center">
                    <tbody>

                    <tr>
                        <td><label for="textfield">시술명</label></td>
                        <td><input type="text" class="form-control" name="name" id="name" placeholder=" 시술명"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label for="textfield">소요시간</label></td>
                        <td style="padding-left:20px"><select name="leadtime" id="leadtime">
                            <option value="">소요시간</option>
                            <option value="1">30분</option>
                            <option value="2">1시간</option>
                            <option value="3">1시간30분</option>
                            <option value="4">2시간</option>
                            <option value="5">2시간 30분</option>
                            <option value="6">3시간</option>
                            <option value="7">3시간 30분</option>
                            <option value="8">4시간</option>

                        </select>
                        
                        
                        
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label for="textfield">가격</label></td>
                        <td><input type="number" class="form-control" name="price" id="price" placeholder=" 00,000"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>

                    </tbody>
                </table>
                <br>

                <!-- <script src="${ctx}/resources/js/bootstrap.js"></script> -->
                <div align="center">

                   <input type="reset" class="btn btn-success" value="취소">
                    <input type="submit" class="btn btn-danger" value="등록" onclick="create(); return false;">
                    <br>
                </div>
            </form>
        </div>
    </div>
</div>


<footer class="footer" style="display: block; background-color:#5D5D5D; height:80px; text-align:center">
    <br>
    &copy; Copyright 2016 TeamName ㅈㄴㅂㄴ


</footer>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ctx}/resources/js/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${ctx}/resources/js/bootstrap.js"></script>
</body>
</html>