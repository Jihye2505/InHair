<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>portfolio</title>
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
		if (document.getElementById("title").value == "") {
			alert("시술명을 입력하세요");
			document.getElementById("title").focus();
			return false;
		}
		if (document.getElementById("content").value == "") {
			alert("소개를 입력하세요");
			document.getElementById("content").focus();
			return false;
		}
	if (document.getElementById("file").value == "") {
		alert("사진을 입력하세요");
		document.getElementById("file").focus();
		return false;
	}
	return true;
};
	var create = function() {
		if (validate()) {
			document.getElementById("portfolioCreate").submit();
		}
	};


</script>

</head>
<body>

<div class="container">

		<%@ include file="/WEB-INF/views/header/header.jspf"%>
    <div>

        <h2 class="media-heading">포트폴리오</h2>
        <hr align="left" style="border: solid 1px #EA5554; width:20%;">


    </div>
    <div>

        <div class="well">
            <h3 class="text-center"></h3>

            <form class="form-horizontal" action="${ctx}/portfolio/create?designer_id=${designer_id}"
			method="post" id="portfolioCreate" enctype="multipart/form-data"> 
			<input id="designer_id" name="designer_id" type="hidden"
				value="${designer_id}">
                <table width="600" border="0" align="center">
                    <tbody>
                    <tr>

                        <td><label for="textfield">시술명</label></td>
                        <td><input class="form-control" type="text" name="title" id="title"
                                   placeholder="시술명을 입력하세요."></td>

                    </tr>
                    <tr>
                        <td><label for="textfield">사진</label></td>
                        <td><input style="margin:20px" type="file" id="img" name="file"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label for="textfield">소개</label></td>
                        <td><input type="text" class="form-control" name="content" id="content"
                                   placeholder=" 간단한 설명을 입력하세요."></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>

                    </tbody>
                </table>
                <br>

                <script src="${ctx}/resources/js/bootstrap.js"></script>
                <div align="center">

               <input type="reset" class="btn btn-success" value="취소"><input
							type="submit" class="btn btn-danger" value="등록"
							onclick="create(); return false;"> <br>
			
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
</body>
</html>