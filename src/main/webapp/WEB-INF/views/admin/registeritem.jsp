<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/adminheader.jsp" %>
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
<body>
	<div class="w3-main" style="width:100%;text-align:center;">
	  <div class="w3-row-padding" style="display:inline-block;margin-top:100px;">
		  <div class="w3-container w3-xlarge">
		    <p class="w3-left"><b>아이템 등록</b></p>
		  </div>
	  	<div class="w3-col s4">
	        <form action="${pageContext.request.contextPath}/itemRegitPro" method="post" enctype="multipart/form-data">
	          <table>
	          	<tr><td><b class="w3-left">아이템 이름</b><input id="itemname_input" class="w3-input w3-border" type="text" name="itemname"  placeholder='아이템 이름' required></td></tr>
	          	<tr><td><b class="w3-left">아이템 종류</b><input id="itemgenre_input" class="w3-input w3-border" type="text" placeholder="종류" name="itemgenre" required></td></tr>
	          	<tr><td><b class="w3-left">대표 이미지</b><input id="itemimg_represent_input" name="itemimg_represent" type="file" required></td></tr>
	          	<tr><td><b class="w3-left">상세 이미지1</b><input id="itemimg_detail_input1" name="itemimg_detail1" type="file" required></td></tr>
	          	<tr><td><b class="w3-left">상세 이미지2</b><input id="itemimg_detail_input2" name="itemimg_detail2" type="file" required></td></tr>
	          	<tr><td><b class="w3-left">상세 이미지3</b><input id="itemimg_detail_input3" name="itemimg_detail3" type="file" required></td></tr>
	          	<tr><td><b class="w3-left">상세 설명</b><textarea id="itemmanual" name="itemmanual" cols="30" rows="5"></textarea></td></tr>
	          	<tr><td><b class="w3-left">가격</b><input id="price_input" class="w3-input w3-border" type="text" placeholder="가격" name="price" required></td></tr>
	          	<tr><td><b class="w3-left">아이템 상태(재고 있음/없음)</b><input id="itemstate_input" class="w3-input w3-border" type="text" placeholder="상태" name="itemstate" value="재고있음" required></td></tr>
	          	<tr><td><b class="w3-left">아이템 갯수(S/M/L/XL/XXL)</b><input id="itemcount_input" class="w3-input w3-border" type="text" placeholder="수량" name="itemcount" required></td></tr>
	          	<tr><td><b class="w3-left">아이템 브랜드</b><input id="itembrand_input" class="w3-input w3-border" type="text" placeholder="브랜드" name="itembrand" required></td></tr>
	          	<tr><td><b class="w3-left">팔린 갯수</b><input id="sellcount_input" class="w3-input w3-border" type="text" placeholder="팔린 갯수" name="sellcount" value="0" required></td></tr>
	          	<tr><td><b class="w3-left">성별(male/female/both)</b><input id="sex" class="w3-input w3-border" type="text" placeholder="성별" name="sex" required></td></tr>
	          	<tr><td><b class="w3-left">아이템 사이즈(S/M/L/XL/XXL)</b><input id="itemsize_input" class="w3-input w3-border" type="text" placeholder="size" name="itemsize" required></td></tr>
	          	<tr><td><input type="submit" style="width:326px;"class="w3-button w3-red w3-margin-bottom" value="등록완료"/></td><tr>
	          </table>
	        </form>
	      </div>
	  </div>
	</div>
</body>
</html>