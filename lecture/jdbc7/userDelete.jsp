<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, jdbc6.*, java.net.*,lecture1.*" %>
   <%
   	String s1 = request.getParameter("id");
    int id = ParseUtils.parseInt(s1,0);
    String pg = request.getParameter("pg");
    

	String srchText = request.getParameter("st");
	if(srchText ==null) srchText="";
	String srchTextEncoded = URLEncoder.encode(srchText, "UTF-8");
	
	String s = request.getParameter("de");//학과 받아오기
	int de =(s==null)?0:Integer.parseInt(s);
	
	String od = request.getParameter("od");
    UserDAO.delete(id);
    response.sendRedirect("Example.jsp?pg="+pg+"&srchText="+srchTextEncoded+"&de="+de+"&od="+od);
   
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