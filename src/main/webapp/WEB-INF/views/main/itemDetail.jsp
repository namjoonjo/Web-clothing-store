<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">       
<title>아이디/비밀번호 찾기</title>
</head>
<body>
	<div class="w3-main w3-left w3-padding-large" style="margin-top:100px;">
		<div class="w3-row" style="position:absolute;top:20%;left:30%;">
			  <div class="w3-col">
			  		<div class="w3-row" style="display:inline-block;float:left">
				      <img src="resources/image/${itemimg1}" style="width:500px;height:500px;">
				    </div>
				    <div class="w3-row" style="float:right;margin-left:100px;margin-top:-30px;">
				    	<h1><b><p>${itemDetails.itemname}</p></b></h1>
				    	<h4><p><b>종류 :</b> ${itemDetails.itemgenre}</p></h4>
				    	<h4><p><b>상세설명 : </b>${itemDetails.itemmanual}</p></h4>
				    	<h4><p><b>브랜드 : </b>${itemDetails.itembrand}</p></h4>
				    	<h4><p><b>가격 : </b>${price}원</p></h4>
				    	<form method="get" name="paymentPro">
				    		<h4><b>수량 : </b></h4><button type="button" style="width:50px;height:50px;font-size:30px;" id="plus" onclick='count("plus")'>+</button><button type="button" style="width:50px;height:50px;font-size:30px;margin-left:10px;" id="minus" onclick='count("minus")'>-</button>
				    		<h3><b id="itemcount">0</b></h3>
				    		<br>
				    		<input type="hidden" id="memid" name="memid" value="${login.memid}">
				    		<input type="hidden" id="memid" name="memid" value="${login.memid}">
				    		<input type="hidden" id="memid" name="memid" value="${login.memid}">
				    		<input type="hidden" id="itemid" name="itemid" value="${itemDetails.itemid}">
				    		<h4><b>사이즈</b></h4>
				    		<select style="height:40px;width:300px;margin-bottom:20px;" id="size_input" name="itemsize">
								<option value="${itemsize1}">${itemsize1}</option>
			            		<option value="${itemsize2}">${itemsize2}</option>
			          			<option value="${itemsize3}">${itemsize3}</option>
			          			<option value="${itemsize4}">${itemsize4}</option>
			          			<option value="${itemsize5}">${itemsize5}</option>
			          		</select>
			          		<h4><b>할인</b></h4>
			          		<select style="height:40px;width:400px;margin-bottom:10px;" id="discount_input" name="itemdiscount" onchange="discount(this.value)">
								<option value="x">--</option>
			            		<option value="5">5% 할인</option>
			          			<option value="10">10% 할인</option>
			          		</select><br>
			          		<h4>총 가격 : <b id="itemdiscountresult" style="color:red;">${price}</b>원</h4>
			          		<c:if test="${login==null}">
			          			<button type="button" style="width:200px;height:80px;float:left;font-size:25px;"class="w3-button w3-red w3-margin-bottom" onclick="javascript:alert('로그인을 먼저 해주십시오.')"><b>결제하기</b></button>
			          			<button type="button" style="width:200px;height:80px;float:right;margin-left:25px;font-size:25px;" class="w3-button w3-red w3-margin-bottom" onclick="javascript:alert('로그인을 먼저 해주십시오.')"><b>장바구니 추가</b></button>
			          		</c:if>
			          		<c:if test="${login!=null}">
			          			<button type="button" style="width:200px;height:80px;float:left;font-size:25px;"class="w3-button w3-red w3-margin-bottom" id="submit"><b>결제하기</b></button>
			          			<button type="button" style="width:200px;height:80px;float:right;margin-left:20px;font-size:25px;" class="w3-button w3-red w3-margin-bottom" id="tocart" onclick="javascript:alert('로그인을 먼저 해주십시오.')"><b>장바구니 추가</b></button>
			          		</c:if>
				    	</form>
				    </div>
  			  </div>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var checking_num1=0;
var checking_num2=0;
var resultvalue1=0;
var resultvalue2=0;
//클릭시 컨트롤러로 데이터 보냄
$("#submit").on("click",function(){

	var itemcount=$('#itemcount').val();
	var itemid=$('#itemid').val();
	var memid=$('#memid').val();
	var itemsize=$('#size_input option:selected').val();
	var itemdiscount=$('#discount_input option:selected').val();
	
	var data={itemid:itemid,itemsize:itemsize,itemdiscount:itemdiscount,memid:memid,itemcount:itemcount};
	$.ajax({
		type : "post",
		url : "paymentPro",
		data : data,
		success:function(result){
			if(result=='success'){
				alert('결제가 완료되었습니다.');
			}else alert('결제 실패!');
		}
	}); 
})
//찜하기
$("#tocart").on("click",function(){

	var itemid=$('#itemid').val();
	var itemsize=$('#size_input option:selected').val();
	var itemdiscount=$('#discount_input option:selected').val();
	
	var data={itemid:itemid,itemsize:itemsize,itemdiscount:itemdiscount};
	$.ajax({
		type : "post",
		url : "tocartPro",
		data : data,
		success:function(result){
			if(result=='success'){
				alert('장바구니에 추가되었습니다.');
			}else alert('찜하기 실패!');
		}
	}); 
})



function count(type){
	const resultElement=document.getElementById('itemcount');
	
	let number=resultElement.innerText;
	if(type=='plus'){
		number=parseInt(number)+1;
	}
	else if(type=='minus' && number>0){
		number=parseInt(number)-1;
	}
	resultElement.innerText=number;	
}
</script>
</body>
</html>