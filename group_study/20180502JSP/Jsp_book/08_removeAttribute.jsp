<%@page import="java.util.Enumeration" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//순서가 세번째, 두번째, 첫번째로 출력됨......
	session.setAttribute("s_name1","저는 세션에 저장된 첫 번째 값이에요");
	session.setAttribute("s_name2", "저는 세션에 저장된 두 번째 값이에요");
	session.setAttribute("s_name3","저는 세션에 저장된 세 번째 값이에요");
	
	out.print("<h3> >> 세션값을 삭제하기 전<< </h3>");
	Enumeration names;
	names=session.getAttributeNames();
	while(names.hasMoreElements()){
		String name=names.nextElement().toString();
		String value=session.getAttribute(name).toString();
		out.println(name+":"+value+"<br>");
	}
	
	//이름을 지정하여 세션에 저장된 객체를 제거합니다.
	session.removeAttribute("s_name2");
	
	out.print("<hr><h3> >>세션값을 삭제한 후<< </h3>");
	names=session.getAttributeNames();
	while(names.hasMoreElements()){
		String name=names.nextElement().toString();
		String value=session.getAttribute(name).toString();
		out.println(name+":"+value+"<br>");
	}

%>
</body>
</html>