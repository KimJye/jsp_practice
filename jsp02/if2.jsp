<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table{border-collapse: collapse; }
	td{padding:5px; border:solid 1px gray;}
</style>
</head>
<body>

<table>
	<tr>
<% for(int i=1;i<=10;++i){ %>
	<%if(i%2==0){ %>
		<td style="background-color:#ffffcc"><%=i %></td>
	<%}else{ %>
		<td style="background-color:#ccffcc"><%=i %></td>
	<%} %>
<%} %>
	</tr>

</table>

<table>
	<tr>
	<% for(int j=1;j<=10;++j){ %>
		<td style="background-color: <%=(j%2==0)?"#ffffcc":"#ccffcc" %>"><%=j %></td>
	<%} %>
	</tr>	
</table>
</body>
</html>