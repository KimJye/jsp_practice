<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 확인하는 곳</title>
</head>
<body>
<%
	String id="201632004";
	String pwd="test1234";
	String name="김지혜";
	
	if(id.equals(request.getParameter("id")) && pwd.equals(request.getParameter("pwd"))){
		session.setAttribute("loginUser",name);
		response.sendRedirect("10_main.jsp");
	}else{
		response.sendRedirect("10_loginForm.jsp");
	}

%>
</body>
</html>