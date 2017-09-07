<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>postDetail</title>
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

</head>
<body>

<div class="container">

		<%@ include file="/WEB-INF/views/header/header.jspf"%>
<h2 class="media-heading">후기</h2>

        <hr align="left" style="border: solid 1px #EA5554; width:20%;">

    <div class="well">
        

        <table class="table table-striped table-bordered table-hover" style="margin:auto;">

            <thead>
            <tr>
                <th>글번호</th>
                <th>별점</th>
                <th>제목</th>
                <th>작성자</th>
             
                <th><span style="float:right">
                </th>
            </tr>
            </thead>
            <tbody align="center">
            <tr>
                <td>${post.rnum}</td>
                <td><c:choose>
                   <c:when test="${post.starpoint < 1}">☆☆☆☆☆</c:when>
                   <c:when test="${post.starpoint < 2}">★☆☆☆☆</c:when>
                   <c:when test="${post.starpoint < 3}">★★☆☆☆</c:when>
                   <c:when test="${post.starpoint < 4}">★★★☆☆</c:when>
                   <c:when test="${post.starpoint < 5}">★★★★☆</c:when>
                   <c:when test="${post.starpoint == 5}">★★★★★</c:when>
                   </c:choose></td>
                 <td>${post.title }</td>
                <td>${post.writer }</td>
                <td><span style="float:right"><c:set var="writer"
								value="${post.writer}" />
								<c:if test="${loginedUser.rank eq 'N' && writer eq loginedUser.id}">
								<a href="${ctx }/post/update?post_id=${post.post_id}&rnum=${post.rnum}" align="right">수정</a>
								<a href="${ctx }/post/delete?post_id=${post.post_id}" align="right" onclick="return confirm(&quot;정말로 삭제하시겠습니까?&quot;)">삭제</a>
<%-- 								<a href="${ctx }/post/delete?post_id=${post.post_id}" align="right" onclick="removeCheck3()">삭제</a> --%>
							</c:if> 
             </span></td>
            </tr>
            <tr>
                <td colspan="5"><img src="${ctx}/post/image?post_id=${post.post_id}">
                    <br><br>
                    <div style="margin-left:20px" align="justify">${post.content}</div>

                   
                </td>
            </tr>

            </tbody>
        </table>

        <br>

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