<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>
</head>
<body  class="w3-content" style="max-width:1200px">
		<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
	  <div class="w3-container w3-display-container w3-padding-16">
	    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
	    <h3 class="w3-wide"><b onclick="location.href='<%=request.getContextPath()%>/movingmainPage'" style="cursor:pointer;">Musinso</b></h3>
	  </div>
	  
	  <div class="w3-col s4">
	        <c:if test="${login==null}">
		        <form action="<%=request.getContextPath()%>/loginPro" method="GET">
		          <p>아이디 <input class="w3-input w3-border" type="text" style="width:200px"placeholder="아이디를 입력해 주십시오." name="memid" required></p>
		          <p>비밀번호 <input class="w3-input w3-border" type="password" style="width:200px" placeholder="비밀번호를 입력해 주십시오." name="password" required></p>
				  <div style="float:left;width:200px;text-align:center;">
				  	<button style="width:95px; float:left" type="submit" class="w3-button w3-block w3-black">로그인</button>
				  	<button onclick="location.href='<%=request.getContextPath()%>/movingsignPage'" style="width:95px; float:right; margin-left:10px;" type="button" class="w3-button w3-block w3-black">회원가입</button>
				  </div>
		        </form>
	        </c:if>
	  </div>
	  
	  <div class="w3-col s4">
	        <c:if test="${login!=null}">
		        <p align="center" style="width:200px; color:blue">${login.memid}님 환영합니다.</p>
		        <div style="float:left;width:200px;text-align:center;">
				  	<button onclick="location.href ='<%=request.getContextPath()%>/logoutPro'" style="width:95px; float:left;" type="button" class="w3-button w3-block w3-black">마이페이지</button>
				  	<button onclick="location.href ='<%=request.getContextPath()%>/logoutPro'" style="width:95px; float:right; margin-left:10px;" type="button" class="w3-button w3-block w3-black">로그아웃</button>
				 </div>
	        </c:if>
	  </div>
	     
	  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
	    <a href="#" class="w3-bar-item w3-button">Shirts</a>
	    <a href="#" class="w3-bar-item w3-button">Dresses</a>
	    <a onclick="myAccFunc()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
	      Jeans <i class="fa fa-caret-down"></i>
	    </a>
	    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
	      <a href="#" class="w3-bar-item w3-button w3-light-grey"><i class="fa fa-caret-right w3-margin-right"></i>Skinny</a>
	      <a href="#" class="w3-bar-item w3-button">Relaxed</a>
	      <a href="#" class="w3-bar-item w3-button">Bootcut</a>
	      <a href="#" class="w3-bar-item w3-button">Straight</a>
	    </div>
	    <a href="#" class="w3-bar-item w3-button">Jackets</a>
	    <a href="#" class="w3-bar-item w3-button">Gymwear</a>
	    <a href="#" class="w3-bar-item w3-button">Blazers</a>
	    <a href="#" class="w3-bar-item w3-button">Shoes</a>
	  </div>
	  <a href="#footer" class="w3-bar-item w3-button w3-padding">Contact</a> 
	  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding" onclick="document.getElementById('newsletter').style.display='block'">Newsletter</a> 
	  <a href="#footer"  class="w3-bar-item w3-button w3-padding">Subscribe</a>
	</nav>
		<!-- Top menu on small screens -->
	<div class="w3-main" style="margin-left:250px">
	<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
	  <div class="w3-bar-item w3-padding-24 w3-wide">MuSinSo</div>
	  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
	</header>
	</div>
</body>
</html>