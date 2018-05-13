<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, jdbc5.*, java.net.*" %>
   <%
   	String s1 = request.getParameter("id");
    int id= Integer.parseInt(s1);
    String pg = request.getParameter("pg");
    

	String srchText = request.getParameter("srchText");
	if(srchText ==null) srchText="";
	String srchTextEncoded = URLEncoder.encode(srchText, "UTF-8");

    UserDAO.delete(id);
    response.sendRedirect("userListPage.jsp?pg="+pg+"&srchText="+srchTextEncoded);
   
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 삭제</title>
</head>
<body>

</body>
</html>