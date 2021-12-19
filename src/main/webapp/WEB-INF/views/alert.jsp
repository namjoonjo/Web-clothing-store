<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
		var itemname="${itemname}";
		var message = " ${msg}";
		var url = "${url}";
		if(itemname==null){
			alert(message);
			document.location.href=url;
		}
		else{
			alert("<"+itemname+">"+message);
			document.location.href = url;	
		}
</script>
</body>
</html>