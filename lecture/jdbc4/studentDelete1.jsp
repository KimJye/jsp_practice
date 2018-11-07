<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, jdbc4.*" %>
<%
String s1 = request.getParameter("id");
int id = Integer.parseInt(s1);
String pg = request.getParameter("pg");

StudentDAO.delete(id);
response.sendRedirect("studentList1.jsp?pg="+pg);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>