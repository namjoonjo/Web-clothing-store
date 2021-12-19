<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>

<title>회원가입</title>
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
	<!-- 회원가입 section -->
	<div class="w3-main" style="width:100%;text-align:center;">
	  <div class="w3-row-padding" style="display:inline-block;margin-top:100px;">
		<h3 style="margin-right:100px;"><b>회원가입</b></h3>
	    <form method="get" name="signupPro">
			<table style="margin-left:400px;">
				<tr><td><p class="w3-left" style="margin-bottom:-10px;"><b>아이디 (최대 10글자)</b></p></td></tr>
				<tr>
					<td><input id="id_input" class="w3-input w3-border" name="memid" maxlength='10' placeholder='id' required></td>
					<td>
						<span class="id_input_re_1" style="color:green;display:none;">사용가능한 아이디입니다.</span>
						<span class="id_input_re_3" style="color:red;display:none;">아이디를 입력하여 주십시오.</span>
						<span class="id_input_re_2" style="color:red;display:none;">중복된 아이디입니다.</span>
					</td>
				</tr>
	            <tr><td><p class="w3-left" style="margin-bottom:-20px;"><b>비밀번호</b></p></td></tr>
	          	<tr>
	          		<td><p><input id="password_input" class="w3-input w3-border" type="password" placeholder="password" name="password" required></p></td>
	          		<td>
	          			<span class="password_input_re_1" style="color:green;display:none;">사용가능한 비밀번호입니다.</span>
	          			<span class="password_input_re_2" style="color:red;display:none;">비밀번호에 대문자나 특수문자를 포함하세요.</span>
	          			<span class="password_input_re_3" style="color:red;display:none;">8자 이상 입력해 주십시오.</span>
	          		</td>
	          	</tr>
	          	<tr><td><p style="margin-top:-20px;">(최소 8글자 이상,대문자,특수문자 적어도 1개 포함)</p></td></tr>
	          	<tr><td><p class="w3-left" style="margin-bottom:-20px;"><b>이름</b></p></td></tr>
	          	<tr><td><p><input id="name_input" class="w3-input w3-border" type="text" placeholder="이름" name="name" required></p></td><td style="width:500px;margin-right:150px;"> </td></tr>
	          	<tr><td><p class="w3-left" style="margin-bottom:-10px;"><b>이메일</b></p></td></tr>
	          	<tr>
	          		<td>
	          			<div>
	          				<input id="email_input" class="w3-input w3-border" style="float:left;width:220px;" type="text" placeholder="이메일" name="email" required>
	          				<b>@</b>
			          		<select class="w3-border" style="float:right;height:40px;" id="homepage" name="homepage">
			          			<option value="naver.com">naver.com</option>
			          			<option value="gmail.com">gmail.com</option>
			          			<option value="daum.net">daum.net</option>
			          			<option value="zum.com">zum.com</option>
			          			<option value="nate.com">nate.com</option>
			          		</select>
	          			</div>
	          		</td>
	          	</tr>
	          	<tr><td><p class="w3-left" style="margin-bottom:-20px;"><b>주소</b></p></td></tr>
	          	<tr><td><p><input id="address_input" class="w3-input w3-border" type="text" placeholder="주소" name="address" required></p></td></tr>
	          	<tr><td><p class="w3-left"><b>전화번호(휴대폰)</b></p></td></tr>
	          	<tr>
	          		<td>
	          			<div>
	          				<select class="w3-border" style="float:left;height:40px;width:100px;" id="phonenum_input1" name="phonenum1">
								<option value="010">010</option>
			            		<option value="011">011</option>
			          			<option value="016">016</option>
			          		</select>
			          		<b style="float:left;margin-left:10px;margin-right:10px;">-</b>
	          				<input id="phonenum_input2" class="w3-input w3-border" type="number" maxlength='4' style="float:left;width:100px;" name="phonenum2" required>
	          				<b style="float:left;margin-left:10px;margin-right:10px;">-</b>
	          				<input id="phonenum_input3" class="w3-input w3-border" type="number" maxlength='4' style="float:left;width:100px;" name="phonenum3" required>
	          			</div>
	          		</td>
	          	</tr>
	          	<tr><td><button type="button" style="width:200px;margin-top:30px;height:50px;"class="w3-button w3-red w3-margin-bottom" id="submit"><b>가입완료</b></button></td><tr>
			</table>
	    </form>	
	  </div>
	</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var check_id=1;
var check_password=1;

//아이디 중복검사
$('#id_input').on("propertychange change keyup paste input", function(){

	//console.log("keyup 테스트");
	var memid=$('#id_input').val();
	var data={memid:memid}	//컨트롤에 넘길 데이터 이름 : 데이터(.id_input에 입력되는 값)
	$.ajax({
		type : "post",
		url : "isitoverlapping",
		data : data,
		success:function(result){
			if(result == 'success'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");
				$('.id_input_re_3').css("display","none");
				check_id=1;
			}
			else if(result == 'empty'){
				$('.id_input_re_3').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				$('.id_input_re_2').css("display", "none");
				check_id=2;
			}
			else {	//fail
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				$('.id_input_re_3').css("display","none");
				check_id=0;
			}
		}
	}); 
});

//비밀번호 검증 및 확인
$('#password_input').on("propertychange change keyup paste input", function(){

	//console.log("keyup 테스트");
	var password=$('#password_input').val();
	var data={password:password}	//컨트롤에 넘길 데이터 이름 : 데이터(.password_input에 입력되는 값)
	$.ajax({
		type : "post",
		url : "iscorrectpasswordform",
		data : data,
		success:function(result){
			if(result == 'success'){	//성공
				$('.password_input_re_1').css("display","inline-block");
				$('.password_input_re_2').css("display", "none");
				$('.password_input_re_3').css("display","none");
				check_password=1;
			}
			else if(result == 'long_enough'){	//8자 이상이 아님
				$('.password_input_re_3').css("display","inline-block");
				$('.password_input_re_2').css("display", "none");
				$('.password_input_re_1').css("display","none");
				check_password=2;
			}
			else {	//조건에 부합하지 않음
				$('.password_input_re_2').css("display","inline-block");
				$('.password_input_re_1').css("display", "none");
				$('.password_input_re_3').css("display","none");
				check_password=0;
			}
		}
	}); 
});
//클릭시 컨트롤러로 데이터 보냄
$("#submit").on("click",function(){
	if(check_id==0) alert('아이디 중복을 확인하여 주십시오.');
	if(check_id==2) alert('아이디를 입력하여 주십시오.');
	if(check_password==0) alert('비밀번호 조건을 확인하여 주십시오.')
	if(check_password==2) alert('비밀번호가 8자 이상이 아닙니다.')
	
	var memid=$('#id_input').val();
	var password=$('#password_input').val();
	var name=$('#name_input').val();
	var email=$('#email_input').val();
	var address=$('#address_input').val();
	var phonenum1=$('#phonenum_input1').val();
	var phonenum2=$('#phonenum_input2').val();
	var phonenum3=$('#phonenum_input3').val();
	var homepage=$('#homepage').val();
	
	var data={memid:memid,password:password,name:name,email:email,address:address,phonenum1:phonenum1,phonenum2:phonenum2,phonenum3:phonenum3,homepage:homepage};
	$.ajax({
		type : "post",
		url : "signupPro",
		data : data,
		success:function(result){
			if(result=='success'){
				alert('회원가입이 완료되었습니다. 로그인하여 주십시오.');
				window.location.href='main';
			}else alert('회원가입 실패!');
		}
	}); 
})
</script>
</body>
</html>