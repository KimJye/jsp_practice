<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lecture1</title>
</head>
<body>
<%
	Date now = new Date();
	Calendar calendar = GregorianCalendar.getInstance();
	calendar.setTime(now);
	int second=calendar.get(Calendar.SECOND);
%>

지금은 <%=second %>초 입니다.

<%if(second%2==0) return;%>
<%=second %>는 홀수입니다.
</body>
</html>