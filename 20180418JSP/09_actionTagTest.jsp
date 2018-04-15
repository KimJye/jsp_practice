<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.net.URLEncoder" %>
    
    <%
    	String userID = request.getParameter("userID");
    	String userPwd = request.getParameter("userPwd");
    	String loginCheck = request.getParameter("loginCheck");
    	
    	if(loginCheck.equals("user")){
    %>
    	<jsp:forward page="09_userMain.jsp">
    	<jsp:param value='<%=URLEncoder.encode("전고객","UTF-8") %>' name="userName"/>
    	</jsp:forward>
    	<%}else{ %>
    	<jsp:forward page="09_managerMain.jsp">
    	<jsp:param value='<%=URLEncoder.encode("전관리","UTF-8") %>' name="userName"/>
    	</jsp:forward>
    	<%} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>라디오 바튼에 따라 태그 이용하여 페이지 달리하는.</title>
</head>
<body>

</body>
</html>