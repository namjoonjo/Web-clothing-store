<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<title>Musinso - 관리자 페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
table{border-spacing:10px;}
</style>

<body class="w3-content" style="max-width:1200px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b onclick="location.href='<%=request.getContextPath()%>/movingadminPage'" style="cursor:pointer;">Musinso</b></h3>
  </div>
  
   <div class="w3-col s4">
   		<c:if test="${login!=null}">
   			<p align="center" style="width:200px; color:blue">${login.name}님 환영합니다.</p>
   			<div style="float:left;width:200px;text-align:center;">
			  	<button onclick="location.href ='<%=request.getContextPath()%>/logoutPro'" style="width:190px; left;" type="button" class="w3-button w3-block w3-black">로그아웃</button>
			 </div>
   		</c:if>
   </div>
    
  <a class="w3-bar-item w3-button w3-padding" onclick="location.href='<%=request.getContextPath()%>/movingadminPage'">이달 판매량</a> 
  <a class="w3-bar-item w3-button w3-padding" onclick="location.href='<%=request.getContextPath()%>/movingadminpage_clientmanage'">고객관리</a> 
  <a class="w3-bar-item w3-button w3-padding" onclick="location.href='<%=request.getContextPath()%>/movingadminpage_registerItem'">아이템 등록</a>
  
</nav>

<div class="w3-main" style="margin-left:250px">
  <div class="w3-container w3-xlarge">
    <p class="w3-left">이달 판매량</p>
  </div>
  <div class="w3-row-padding" style="position: relative; left: 180px; top: 100px;">
  	
  </div>
</div>
</body>
</html>