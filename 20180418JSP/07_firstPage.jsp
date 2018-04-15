<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	pageContext.setAttribute("name","page man");
    	request.setAttribute("name","request man");
    	session.setAttribute("name","session man");
    	application.setAttribute("name", "application man");
    	
    	System.out.println("firstPage.jsp: ");
    	System.out.println("하나의 페이지 속성 : "+pageContext.getAttributesScope("name"));
    	System.out.println("하나의 요청 속성: "+pageContext.getAttributesScope("name"));
    	System.out.println("하나의 세션 속성: "+session.getAttribute("name"));
    	System.out.println("하나의 애플리케이션 속성: "+application.getAttribute("name"));
    	
    	request.getRequestDispatcher("07_secondPage.jsp").forward(request,response);
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