<%@ page import = "java.util.Enumeration" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>세션 정보를 얻어오는 메소드를 사용하기</h3>
<%
	String id_str = session.getId();//고유한 세션 객체 ID 돌려줌.
	long lasttime = session.getLastAccessedTime();//세션에 마지막으로 액세스한 시간 돌려줌
	long createdtime = session.getCreationTime();//세션이 생성된 시간 돌려줌
	long time_used =(lasttime-createdtime)/60000;//웹사이트에 머문 시간 계산
	int inactive = session.getMaxInactiveInterval()/60;//세션 유효 시간
	boolean b_new = session.isNew();//세션이 새로 만들어졌는가?

%>
[1] 세션 ID는 [<%=session.getId() %>]입니다.<br><hr>
[2] 당신이 웹 사이트에 머문 시간은 <%=time_used %>분입니다.<br><hr>
[3] 세션의 유효 시간은 <%=inactive %>분입니다.<br><hr>
[4] 세션이 새로 만들어졌나요?<br>
<%
	if(b_new)
		out.print("새로운 세션을 만들었습니다.");
	else
		out.print("새로운 세션을 만들지 않았습니다.");
%>
</body>
</html>