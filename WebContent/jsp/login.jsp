<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/LoginAction.do">
	用户名:
	<input type = "text" name = "userName" size = "35"/>
	
	密&nbsp;&bnsp;码:
	<input type = "password" name = "password" size = "35"/>
	
	验证码：
	<input type = "text" name = "rand" size = "20">
	<img alt="" src="<%=request.getContextPath() %>/jsp/image.jsp"/>
	
	<input type = "submit" value = "提交"/>
	
	<input type = "reset" value = "重置"/>
	
</form>

</body>
</html>