<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, jdbc7.*, java.net.*,lecture1.*" %>
<%
request.setCharacterEncoding("UTF-8");

String s1 = request.getParameter("id");
int id = ParseUtils.parseInt(s1,0);
String pg = request.getParameter("pg");
String ss = request.getParameter("ss");
String st = request.getParameter("st");
if(ss==null)ss="0";
if(st==null)st="";

String stEncoded = URLEncoder.encode(st, "UTF-8");
String od = request.getParameter("od");

StudentDAO.delete(id);
response.sendRedirect("studentList1.jsp?pg="+pg+"&ss="+ss+"&st="+stEncoded+"&od="+od);
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