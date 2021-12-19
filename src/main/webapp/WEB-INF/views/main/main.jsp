<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<title>Musinso - 의류 쇼핑몰</title>
<meta charset="UTF-8">
<body>
	<!-- 메인 이미지 content -->
	<div class="w3-display-container w3-wide" style="width:100%;text-align:center;margin-top:-100px;">
		<div style="display:inline-block">
			<img class="w3-image" src="resources/image/new_arrival2.png" width="1500" height="1000">
			<div style="margin-top:-820px;margin-right:650px;">
				<h1 class="w3-jumbo w3-hide-small" style="color:white">New arrivals</h1>
	     		<h1 class="w3-hide-large w3-hide-medium" style="color:white">New arrivals</h1>
	      		<h1 class="w3-hide-small" style="color:white">COLLECTION 2021</h1>
	      		<p><a href="#jeans" class="w3-button w3-white w3-text-black w3-padding-large w3-large"><b>SHOP NOW</b></a></p>
			</div>
			<!-- Best items Photo Grid(많이 팔린 갯수 기준)-->
			  <div class="w3-center" style="margin-top:600px;margin-right:1200px;">
			  	<h3><b>Best item!</b></h3>
			  </div>
			  <div class="w3-cell-row w3-center w3-xlarge-padding" style="width:1200px;margin-left:150px;">
			    <c:forEach var="items" items="${allofgetbestitems}" varStatus="status">
			    	<c:url value="/itemDetail?itemid=${items.itemid}" var="url"/>
			    		<h3 style="margin-top:10px;"><c:out value="${status.index+1}"></c:out>위</h3>
				    	<div class="w3-container w3-cell" style="cursor:pointer;" title="${items.itemname}" onclick="location.href='${url}'">
				      	  <img src="resources/image/${allgetbestimg[status.index]}">
				     	  <p><c:out value="${items.itemname}"/></p>
				     	  <p>$<c:out value="${items.price}"/></p>
				    	</div>
			    </c:forEach>
			  </div>
			 <!-- Second Photo Grid-->
			  <div class="w3-center" style="margin-right:1200px;">
			  	<h3><b>"${roaldhk}"</b></h3>
			  </div>
			  <div class="w3-cell-row w3-center w3-xlarge-padding" style="width:1200px;margin-left:80px;">
			    <div class="w3-container w3-cell">
			      <img src="resources/image/Gucci.PNG" alt="Sandwich">
			      <h3>The Perfect Sandwich, A Real NYC Classic</h3>
			    </div>
			    <div class="w3-container w3-cell">
			      <img src="resources/image/Gucci.PNG" alt="Steak">
			      <h3>Let Me Tell You About This Steak</h3>
			    </div>
			    <div class="w3-container w3-cell">
			      <img src="resources/image/Gucci.PNG" alt="Cherries">
			      <h3>Cherries, interrupted</h3>
			    </div>
			    <div class="w3-container w3-cell">
			      <img src="resources/image/Gucci.PNG" alt="Pasta and Wine">
			      <h3>Once Again, Robust Wine and Vegetable Pasta</h3>
			    </div>
			    <div class="w3-container w3-cell">
			      <img src="resources/image/Gucci.PNG" alt="Pasta and Wine">
			      <h3>Once Again, Robust Wine and Vegetable Pasta</h3>
			    </div>
			    <div class="w3-container w3-cell">
			      <img src="resources/image/Gucci.PNG" alt="Pasta and Wine">
			      <h3>Once Again, Robust Wine and Vegetable Pasta</h3>
			    </div>
			  </div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
