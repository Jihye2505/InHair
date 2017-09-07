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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

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

<form class="form-horizontal" action="${ctx}/reserve/adminCreate" method="post" id="adminCreate">
<div class="container">
      <%@ include file="/WEB-INF/views/header/header.jspf"%>
    <div>

        <h2 class="media-heading">예약현황</h2>
        <hr align="left" style="border: solid 1px #EA5554; width:20%;">


    </div>
    <div class="well">



            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
            <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

            <div class="container" id="conclass">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">


                            <table id="mytable" class="table table-bordred table-striped">
                                <thead>
                                <tr class="checktr">
                                    <th class="checkth"><img src="${ctx}/resources/images/logo.png" width="70px"/></th>
                                    <c:forEach items="${designerList}" var="designer">
                                       <th class="checkth">${designer.name}</th>
                                    </c:forEach>
                                </tr>
                                </thead>
                                <tbody id="reserveDesignerList">
                        
                        </tbody>

                            </table>


                        </div>

                    </div>
                </div>
            </div>


 
    </div>


</div>

<!--예약폼 시작-->
<div class="container">
    <div>

        <h2 class="media-heading">예약</h2>
        <hr align="left" style="border: solid 1px #EA5554; width:20%;">


    </div>
    <div>

        <div class="well">
            <h3 class="text-center"></h3>


                <div class="form-group">
                    <table width="600" border="0" align="center">

                  
                  <tr>
                    <td><label for="textfield">이름</label></td>
                    <td><input class="form-control" type="text" name="userName" id="iptName" maxlength="10"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><label for="textfield">시술명</label></td>
                    <!-- <td><input class="form-control" type="text" name="info" id=""></td> -->
                    <td>
                       <select class="form-control" name="productNamed" id='productListBox'>
                          <option>선택</option>
                          <c:forEach items="${productList}" var="product">
                             <c:if test="${product.leadtime == 1}">
                                <option value="${product.name}" title="${product.leadtime}" class="${product.price}">${product.name}(${product.price}원 / 30분)
                                </option>
                        </c:if>
                        <c:if test="${product.leadtime == 2}">
                                <option value="${product.name}" title="${product.leadtime}" class="${product.price}">${product.name}(${product.price}원 / 1시간)
                                </option>
                        </c:if>
                        <c:if test="${product.leadtime == 3}">
                                <option value="${product.name}" title="${product.leadtime}" class="${product.price}">${product.name}(${product.price}원 / 1시간30분)
                                </option>
                        </c:if>
                        <c:if test="${product.leadtime == 4}">
                                <option value="${product.name}" title="${product.leadtime}" class="${product.price}">${product.name}(${product.price}원 / 2시간)
                                </option>
                        </c:if>
                        <c:if test="${product.leadtime == 5}">
                                <option value="${product.name}" title="${product.leadtime}" class="${product.price}">${product.name}(${product.price}원 / 2시간30분)
                                </option>
                        </c:if>
                        <c:if test="${product.leadtime == 6}">
                                <option value="${product.name}" title="${product.leadtime}" class="${product.price}">${product.name}(${product.price}원 / 3시간)
                                </option>
                        </c:if>
                        <c:if test="${product.leadtime == 7}">
                                <option value="${product.name}" title="${product.leadtime}" class="${product.price}">${product.name}(${product.price}원 / 3시간30분)
                                </option>
                        </c:if>
                        <c:if test="${product.leadtime == 8}">
                                <option value="${product.name}" title="${product.leadtime}" class="${product.price}">${product.name}(${product.price}원 / 4시간)
                                </option>
                        </c:if>
                             </c:forEach>
                         </select>
            
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><label for="textfield">휴대폰번호</label></td>
                    <td><input class="form-control" type="text" name="userPhone" id="iptPhone" maxlength="13"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                  
                    </table>

                </div>

                <p class="text-right"><input type="submit" class="btn btn-danger" onclick="join(); return false;" value="예약"> </p>
        </div>
    </div>
    <table>
       <tbody id="adminReserve">
          <tr>
          <td><input id="shopCode" name="shopCode" style="display:none;" value="${shop.code}"></td>
          <td><input id="shopName" name="shopName" style="display:none;" value="${shop.shopName}"></td>
          <td><input id="shopAddress" name="shopAddress" style="display:none;" value="${shop.address}"></td>
          <td><input id="userId" name="userId" style="display:none;" value="000000"></td>
          <td><input id="designerName" name="designerName" style="display:none;"></td>
          <td><input id="days" name="days" style="display:none;"></td>
          <td><input id="time" name="time" style="display:none;"></td>
          <td><input id="productName" name="productName" style="display:none;"></td>
          <td><input id="leadtime" name="leadtime" style="display:none;"></td>
          <td><input id="price" name="price" style="display:none;"></td>
          </tr>
       </tbody>
    </table>
   

</div>
</form>
<!--예약폼 끝-->


<footer class="footer" style="display: block; background-color:#5D5D5D; height:80px; text-align:center">
    <br>
    &copy; Copyright 2016 TeamName ㅈㄴㅂㄴ


</footer>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ctx}/resources/js/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${ctx}/resources/js/bootstrap.js"></script>
<script type="text/javascript">
      $('#productListBox').change(function(){
               var code = '${shop.code}';
               var d = new Date();
               var days = d.getDate();
               var leadtime = $("#productListBox option:selected").attr("title");

                var allData = { "code": code, "days": days, "leadtime": leadtime };
                
                $("#reserveDesignerList").children("tr").remove();
                $("#reserveDesignerList").children("br").remove();
                var values = []; //ArrayList 값을 받을 변수를 선언
             
                //검색할 코드를 넘겨서 값을 가져온다.      
                $.post(
                    "${pageContext.request.contextPath}/reserve/designerSearchBySchedule", 
                    allData,
                    function(retVal) {
                        if(retVal.code == "OK") { //controller에서 넘겨준 성공여부 코드
                             
                            values = retVal.designerList ; //java에서 정의한 ArrayList명을 적어준다.
                             
                            $.each(values, function(index, result) {
                               var tbody = document.getElementById('reserveDesignerList');
                               var tr = document.createElement('tr');
                               var tr2 = document.createElement('tr');
                               var td = document.createElement('td'); 
                               var td2 = document.createElement('td'); 
                               var td3 = document.createElement('td'); 
                               var br = document.createElement('br'); 
                           tr.innerHTML = 
                              '<td width="15%">&nbsp;</td>'
                              + '<td width="35%"><h3 id ="Name">'+ result.name +'</h3><h5>'+ result.intro +'</h4></td>'
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
                                    '<input id="time'+ result.name + index + '" type="radio"   name="timeGroup" class="shop timeBtn" value="'+index+'" /> '
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

            }); 
      $(document).on("click","input[type=radio][name=timeGroup]",function(){
           var designerName =  $("input[type=radio][name=timeGroup]:checked").parent().parent().parent().prev().children().next().children().html(); 
           var d = new Date();
           var day = d.getDate();
           var time = $("input[type=radio][name=timeGroup]:checked").attr("value");
           var productName = $("#productListBox option:selected").attr("value");
           var leadtimes = $("#productListBox option:selected").attr("title");
           var price = $("#productListBox option:selected").attr("class");
           $("#designerName").attr("value", designerName);
           $("#days").attr("value", day);
           $("#time").attr("value", time);
           $("#productName").attr("value", productName);
           $("#leadtime").attr("value", leadtimes);
           $("#price").attr("value", price);
      });
      
      var validate = function() {
         var productNames = $("#productListBox option:selected").val();
             if(document.getElementById("iptName").value == "") {
                alert("이름을 입력하세요");
                document.getElementById("iptName").focus();
                return false;
             }
             if(document.getElementById("iptPhone").value == "") {
                   alert("휴대폰번호를 입력하세요");
                   document.getElementById("iptPhone").focus();
                   return false;
                }
             if(productNames == "선택") {
                   alert("상품정보를 선택하세요");
                   return false;
                }
             if(($("input[type=radio][name=timeGroup]:checked").attr("value") == undefined)==true) {
                   alert("시간을 선택하세요.");
                   return false;
                }else {
                return true;
             }
      };
          var join = function() {
              if(validate()) {
                 document.getElementById("adminCreate").submit();
              }
           };
         </script>
</body>
</html>