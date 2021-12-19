<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<title>ȸ������</title>
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
    <h3 class="w3-wide"><b onclick="location.href='<%=request.getContextPath()%>/movingmainPage'" style="cursor:pointer;">Musinso</b></h3>
  </div>
  
  <div class="w3-col s4">
  		<form action="<%=request.getContextPath()%>/loginPro" method="GET">
	          <p>���̵� <input class="w3-input w3-border" type="text" style="width:200px"placeholder="���̵� �Է��� �ֽʽÿ�." name="memid" required></p>
	          <p>��й�ȣ <input class="w3-input w3-border" type="password" style="width:200px" placeholder="��й�ȣ�� �Է��� �ֽʽÿ�." name="password" required></p>
			  <div style="float:left;width:200px;text-align:center;">
			  	<button style="width:95px; float:left" type="submit" class="w3-button w3-block w3-black">�α���</button>
			  	<button onclick="location.href ='<%=request.getContextPath()%>/movingsignPage'" style="width:95px; float:right; margin-left:10px;" type="button" class="w3-button w3-block w3-black">ȸ������</button>
			  </div>
	     </form>
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

 <!-- ȸ������ section -->
<div class="w3-main" style="margin-left:250px">
  <div class="w3-container w3-xlarge">
    <p class="w3-left">ȸ������</p>
  </div>
  
  <div class="w3-row-padding" style="position: relative; left: 180px; top: 100px;">
  	<div class="w3-col s4">
        <form method="get" name="signupPro">
          <table>
          	<tr><td><input id="id_input" class="w3-input w3-border" name="memid" maxlength='10' placeholder='���̵�' style="width:300px;" required></td><td><span class="id_input_re_1" style="color:green;display:none;width:600px;">��밡���� ���̵��Դϴ�.</span><span class="id_input_re_2" style="color:red;display:none;width:600px;">�ߺ��� ���̵��Դϴ�.</span></td></tr>
          	<tr><td>(�ִ� 10����)</td></tr>
          	<tr><td><p><input id="password_input" class="w3-input w3-border" type="password" placeholder="��й�ȣ" name="password" required></p></td><td><span class="password_input_re_1" style="color:green;display:none;width:300px;">��밡���� ��й�ȣ�Դϴ�.</span></td><td><span class="password_input_re_2" style="color:red;display:none;width:300px;">��й�ȣ�� �빮�ڳ� Ư�����ڸ� �����ϼ���.</span></td></tr>
          	<tr><td>(�ּ� 8���� �̻� �Է��ϼ���.)</td></tr>
          	<tr><td><p><input id="name_input" class="w3-input w3-border" type="text" placeholder="�̸�" name="name" required></p></td></tr>
          	<tr><td><p><input id="email_input" class="w3-input w3-border" type="text" placeholder="�̸���" name="email" required></p></td><td><span class="email_input_re_1" style="color:green;display:none;width:300px;">��밡���� �̸��� �����Դϴ�.</span><span class="email_input_re_2" style="color:red;display:none;width:300px;">�̸��� ������ �ٽ��ѹ� Ȯ�����ֽʽÿ�.</span></td></tr>
          	<tr><td><p><input id="address_input" class="w3-input w3-border" type="text" placeholder="�ּ�" name="address" required></p></td></tr>
          	<tr><td><p><input id="phonenum_input" class="w3-input w3-border" type="text" placeholder="��ȭ��ȣ(�޴���)" name="phonenum" required></p></td></tr>
          	<tr><td><button type="button" style="width:200px;"class="w3-button w3-red w3-margin-bottom" id="submit">���ԿϷ�</button></td><tr>
          </table>
        </form>
      </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var check_id=1;
var check_email=1;
//���̵� �ߺ��˻�
$('#id_input').on("propertychange change keyup paste input", function(){

	//console.log("keyup �׽�Ʈ");
	var memid=$('#id_input').val();
	var data={memid:memid}	//��Ʈ�ѿ� �ѱ� ������ �̸� : ������(.id_input�� �ԷµǴ� ��)
	$.ajax({
		type : "post",
		url : "isitoverlapping",
		data : data,
		success:function(result){
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");
				//$("#submit").removeAttr("disabled");
				check_id=1;
			} 
			else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				//$("#submit").attr("disabled", "disabled");
				check_id=0;
			}
		}
	}); 
});

$('#email_input').on("propertychange change keyup paste input", function(){

	//console.log("keyup �׽�Ʈ");
	var email=$('#email_input').val();
	var data={email:email}	//��Ʈ�ѿ� �ѱ� ������ �̸� : ������(.id_input�� �ԷµǴ� ��)
	$.ajax({
		type : "post",
		url : "iscorrectemailform",
		data : data,
		success:function(result2){
			if(result2 != 'fail'){
				$('.email_input_re_1').css("display","inline-block");
				$('.email_input_re_2').css("display", "none");
				//$("#submit").removeAttr("disabled");
				check_email=1;
			} 
			else {
				$('.email_input_re_2').css("display","inline-block");
				$('.email_input_re_1').css("display", "none");
				//$("#submit").attr("disabled", "disabled");
				check_email=0;
			}
		}
	}); 
});

$("#submit").on("click",function(){
	if(check_id==0) alert('���̵� �ߺ��� Ȯ���Ͽ� �ֽʽÿ�.');
	if(check_email==0) alert('�̸��� ������ Ȯ���� �ֽʽÿ�.')
	
	var memid=$('#id_input').val();
	var password=$('#password_input').val();
	var name=$('#name_input').val();
	var email=$('#email_input').val();
	var address=$('#address_input').val();
	var phonenum=$('#phonenum_input').val();
	
	var data={memid:memid,password:password,name:name,email:email,address:address,phonenum:phonenum};
	$.ajax({
		type : "post",
		url : "signupPro",
		data : data,
		success:function(result){
			if(result=='success'){
				alert('ȸ�������� �Ϸ�Ǿ����ϴ�.');
				window.location.href='main';
			}else alert('ȸ������ ����!');
		}
	}); 
})
</script>

</body>
</html>