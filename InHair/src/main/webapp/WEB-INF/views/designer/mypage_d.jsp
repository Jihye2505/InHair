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
    <link rel="shortcut icon" href="assets/images/discover-mobile-350x350-16.png" type="image/x-icon">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
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
	    <input id="tab1" type="radio" name="tabs"/>
	    <label class="tab" for="tab1">마이 페이지</label>
	    
		<input id="tab2" type="radio" name="tabs" /> 
		<a href="${ctx}/designer/detail?designer_id=${loginedUser.id}" class="tab book" for="tab2">상세정보</a>
	
	    <input id="tab3" type="radio" name="tabs" checked/>
	    <label class="tab" for="tab3">탈퇴</label>
 	</c:if>
    <c:if test="${option != 1}">
	    <input id="tab1" type="radio" name="tabs" checked/>
	    <label class="tab" for="tab1">마이 페이지</label>
	    
		<input id="tab2" type="radio" name="tabs" /> 
		<a href="${ctx}/designer/detail?designer_id=${loginedUser.id}" class="tab book" for="tab2">상세정보</a>
	    
	    <input id="tab3" type="radio" name="tabs"/>
	    <label class="tab" for="tab3">탈퇴</label>
	    
	    
	</c:if>
    <section class="well tab-content" id="content1">

        <h2 class="media-heading">마이 페이지</h2>
        <hr align="left" style="border: solid 1px #EA5554; width:20%;">
        <br><br>
        <form class="form-horizontal" id="formJoin" action="${ctx}/designer/update" method="POST" enctype="multipart/form-data">


            <table width="600" border="0" align="center">
                <tbody>
                <tr>

                    <td><label for="textfield">PASSWORD</label></td>
                    <td><input class="form-control" style="width:400px; height:35px" type="password" maxlength="10" name="password"
                               id="iptPassword" placeholder="비밀번호"></td>

                </tr>
                <tr>
                    <td><label for="textfield">PASSWORD CHECK</label></td>
                    <td><input class="form-control" style="width:400px; height:35px" type="password" maxlength="10" name="rePassword"
                               id="iptRePassword" placeholder="비밀번호 확인"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><label for="textfield">NAME</label></td>
                    <td><input type="text" class="form-control" name="name" id="iptName" value="${loginedUser.name}" maxlength="10"  placeholder=" 이름"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><label for="textfield">EMAIL</label></td>
                    <td><input type="text" class="form-control" name="email" id="iptEmail" value="${loginedUser.email}" maxlength="25"  placeholder=" 이메일"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><label for="textfield">CODE</label></td>
                    <td><input type="text" class="form-control" name="shopCode" id="iptShopCode" value="${loginedUser.shopCode}" maxlength="50"  placeholder=" 점포코드"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td><label for="textfield">PHONE</label></td>
                    <td><input type="text" class="form-control" name="phonenum" id="iptPhone" value="${loginedUser.phonenum}" maxlength="13"  placeholder=" 000-0000-0000">
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><label for="textfield">PHOTO</label></td>
                    <td><input style="margin:20px" type="file" id="img" name="file" value="${loginedUser.img}" maxlength="100" ></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><label for="textfield">INFO</label></td>
                    <td><input type="text" class="form-control" name="intro" id="iptIntro" value="${loginedUser.intro}" maxlength="100" ></td>
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

                <button type="reset" class="btn btn-success">취소 </button> 
                <button type="submit" class="btn btn-danger" onclick="join(); return false;">수정 </button>

                <br>
            </div>
        </form>

    </section>

    <section class="well tab-content" id="content3">
        <h2 class="media-heading">탈퇴</h2>
        <hr align="left" style="border: solid 1px #EA5554; width:20%;">
        <h5 align="left">탈퇴를 위한 비밀번호를 입력해주세요.</h5>
        <br><br>
        <form id="designerSecession" action="${ctx}/designer/secession" method="POST">
            <table width="800px" border="0" align="center">
                <tbody>
                <tr>
                    <td><label for="textfield" id="userPassword">PASSWORD</label></td>
                    <td><input style="width:400px; height:35px" type="password" name="password" class="form-control"
                               id="password" placeholder="비밀번호"></td>
                    <td><button type="submit" class="btn btn-danger" onclick="return confirm(&quot;정말로 탈퇴하시겠습니까?&quot;)">확인</button></td>
<!--                     <td><button type="submit" class="btn btn-danger" onclick="breakOut()">확인</button></td> -->
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


<footer class="footer" style="display: block; background-color:#5D5D5D; height:80px; text-align:center">
    <br>
    &copy; Copyright 2016 TeamName ㅈㄴㅂㄴ


</footer>
<script type="text/javascript">
if(${option == 1}) {
	alert("비밀번호가 일치하지 않습니다.");
};
var validate = function() {
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
    if(document.getElementById("iptShopCode").value == "") {
        alert("점포코드를 입력하세요");
        document.getElementById("iptShopCode").focus();
        return false;
     }
    if(document.getElementById("iptPhone").value == "") {
       alert("휴대폰번호를 입력하세요");
       document.getElementById("iptPhone").focus();
       return false;
    }
    if(document.getElementById("img").value == "") {
        alert("사진을 선택하세요");
        document.getElementById("img").focus();
        return false;
     }
    if(document.getElementById("iptIntro").value == "") {
        alert("소개를 입력하세요");
        document.getElementById("iptIntro").focus();
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
</script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ctx}/resources/js/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${ctx}/resources/js/bootstrap.js"></script>
</body>
</html>