<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Musinso - 관리자페이지</title>
</head>
<body>
<!-- Side Navigation -->
<nav class="w3-sidebar w3-bar-block w3-card w3-animate-left w3-center" style="display:none" id="mySidebar">
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
   
    <c:if test="${login!=null}">
    	<p class="w3-padding w3-right">
		  <i onclick="location.href ='<%=request.getContextPath()%>/logoutPro'" title="로그아웃" class="fa fa-sign-out w3-margin-right w3-xlarge" style="cursor:pointer;"></i>
		</p>
		<div class="w3-dropdown-hover w3-hide-small w3-right w3-large" style="margin-top:11px;" title="아이템 관리">
        	<button class="w3-padding-large w3-button" title="More">아이템 관리<i class="fa fa-caret-down"></i></button>     
	        <div class="w3-dropdown-content w3-bar-block w3-card-4">
		        <a onclick="location.href='<%=request.getContextPath()%>/movingadminpage_Itemlist'" class="w3-bar-item w3-button">아이템 목록</a>
		        <a onclick="location.href='<%=request.getContextPath()%>/movingadminpage_registerItem'" class="w3-bar-item w3-button">아이템 등록</a>
	        </div>
    	</div>
		<a onclick="location.href='<%=request.getContextPath()%>/movingadminPage'" class="w3-bar-item w3-button w3-large w3-right" style="margin-top:15px;" title="이달 판매량">이달 판매량</a>
		<a onclick="location.href='<%=request.getContextPath()%>/movingadminpage_clientmanage'" class="w3-bar-item w3-button w3-large w3-right" style="margin-top:15px;margin-left:10px;" title="고객 관리">고객 관리</a>	
    	<h5 class="w3-right" style="margin-top:25px;color:red;"><b>관리자님 환영합니다.</b></h5>
    </c:if>
    <div class="w3-padding" style="display:inline-block;vertical-align:middle;">
	   <i onclick="w3_open()" class="fa fa-bars w3-xlarge w3-button w3-theme"></i>
	</div>
	<div class="w3-padding" style="display:inline-block;vertical-align:middle;">
	   <h3 class="w3-wide"><b onclick="location.href='<%=request.getContextPath()%>/movingadminPage'" style="cursor:pointer;">Musinso</b></h3>
	</div>
  </div>
</div>
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
</body>
</html>