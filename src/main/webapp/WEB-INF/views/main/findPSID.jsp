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
	
	<div class="w3-main w3-left w3-padding-large">
		<div style="position:absolute;top:30%;left:30%;">
			<div class="w3-row" style="display:inline-block;float:left;">
				<h3><b>아이디를 잊으셨나요?</b></h3>
				<form action="<%=request.getContextPath()%>/findID" method="GET">
					<p>이름을 입력하세요.</p>
					<input id="findIDPS_name_input" style="width:300px;"class="w3-input w3-border" name="name" placeholder='name' required>
					<p>이메일을 입력하세요.</p>
					<input id="findIDPS_email_input" class="w3-input w3-border" name="email" placeholder='email' required>
					<button type="submit" style="width:200px;margin-top:30px;height:50px;"class="w3-button w3-red w3-margin-bottom" id="submit"><b>아이디찾기</b></button>
				</form>
			</div>
			<div class="w3-row" style="float:right;margin-left:200px;">
				<h3><b>비밀번호를 잊으셨나요?</b></h3>
				<form action="<%=request.getContextPath()%>/findPS" method="GET">
					<p>이름을 입력하세요.</p>
					<input id="findIDPS_name_input" style="width:300px;"class="w3-input w3-border" name="name" placeholder='name' required>
					<p>아이디를 입력하세요.</p>
					<input id="findIDPS_id_input" style="width:300px;"class="w3-input w3-border" name="memid" placeholder='id' required>
					<p>이메일을 입력하세요.</p>
					<input id="findIDPS_email_input" class="w3-input w3-border" name="email" placeholder='email' required>
					<button type="submit" style="width:200px;margin-top:30px;height:50px;"class="w3-button w3-red w3-margin-bottom" id="submit"><b>비밀번호찾기</b></button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>