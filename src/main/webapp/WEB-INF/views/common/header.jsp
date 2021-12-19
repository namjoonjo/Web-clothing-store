<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>

<body>
<!-- Side Navigation -->
<nav class="w3-sidebar w3-bar-block w3-card w3-animate-left w3-center" style="display:none" id="mySidebar">
  <h1 class="w3-xxlarge w3-text-theme"><b>Musinso</b></h1>
  <a href="#" class="w3-bar-item w3-button">셔츠/티셔츠</a>
  <a href="#" class="w3-bar-item w3-button">맨투맨/후드/집업</a>
  <a href="#" class="w3-bar-item w3-button">바지/치마</a>
  <a href="#" class="w3-bar-item w3-button">아우터</a>
  <a href="#" class="w3-bar-item w3-button">신발</a>
  <button class="w3-bar-item w3-button" onclick="w3_close()">닫기 <i class="fa fa-remove"></i></button>
</nav>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
   
    <c:if test="${login==null}">
    	<form action="<%=request.getContextPath()%>/loginPro" method="GET">
			<div class="w3-padding w3-right" style="margin-top:7px;float:left;width:240px;text-align:center;">
				  	<button style="width:95px; float:left" type="submit" class="w3-button w3-block w3-white"><b>로그인</b></button>
				  	<button onclick="location.href='<%=request.getContextPath()%>/movingsignPage'" style="width:95px; float:right;" type="button" class="w3-button w3-block w3-white"><b>회원가입</b></button>
			</div>
			<div class="w3-padding w3-right" style="margin-top:7px;float:left;text-align:center;width:300px;">
			   <p style="float:left;margin-bottom:20px;">비밀번호</p>
		       <input class="w3-input w3-border" type="password" style="float:right;width:200px;" placeholder="password" name="password" required>		      
			</div>
			<div class="w3-padding w3-right" style="margin-top:7px;float:left;text-align:center;width:300px;">
			   <p style="float:left;margin-bottom:20px;">아이디</p>
		       <input class="w3-input w3-border" type="text" style="float:right;width:200px;"placeholder="id" name="memid" required>		      
			</div>
			<p onclick="location.href='<%=request.getContextPath()%>/movingfindPage'" class="w3-padding w3-right" style="margin-top:20px;float:left;cursor:pointer;" title="아이디/비밀번호 찾기">아이디/비밀번호를 잊으셨나요?</p>
		</form>
    </c:if>
    <c:if test="${login!=null}">
    	<p class="w3-padding w3-right">
		  <i title="내 주문내역" class="fa fa-shopping-cart w3-margin-right w3-xlarge" style="cursor:pointer;"></i>
		  <i title="검색" class="fa fa-search w3-margin-right w3-xlarge" style="cursor:pointer;"></i>
		  <i onclick="location.href ='<%=request.getContextPath()%>/logoutPro'" title="로그아웃" class="fa fa-sign-out w3-margin-right w3-xlarge" style="cursor:pointer;"></i>
		</p>
		<a onclick="location.href='<%=request.getContextPath()%>/Mypage'" class="w3-bar-item w3-button w3-large w3-right" style="margin-top:15px;" title="마이페이지">마이페이지</a>
    	<h5 class="w3-right" style="margin-top:25px;"><b>${login.memid}님 환영합니다.</b></h5>
    </c:if>
    <div class="w3-padding" title="메뉴 바" style="display:inline-block;vertical-align:middle;">
	   <i onclick="w3_open()" class="fa fa-bars w3-xlarge w3-button w3-theme"></i>
	</div>
	<div class="w3-padding" style="display:inline-block;vertical-align:middle;">
	   <h3 class="w3-wide"><b onclick="location.href='<%=request.getContextPath()%>/'" title="홈페이지 바로가기" style="cursor:pointer;">Musinso</b></h3>
	</div>
  </div>
</div>
</body>
<script>
//Side navigation
function w3_open() {
  var x = document.getElementById("mySidebar");
  x.style.width = "20%";
  x.style.fontSize = "20px";
  x.style.paddingTop = "10%";
  x.style.display = "block";
}
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>
</html>