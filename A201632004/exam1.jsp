<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title><style>
	table{border-collapse:collapse;}
	td{padding:5px;border:solid 1px gray;}
</style>
</head>
<body>
	<table>
			<tr>
		<% for(int j=2;j<6;++j){ %>
			<% if(j%2==0){%>
			<td style="background-color:#ccffcc">
			<%}else{ %>
			<td style="background-color:#ffffcc">
			<%} %>
			<% for(int i=1;i<10;++i){ %>
				<%=j %>*<%=i %>=<%=i*j %></br>
			<%} %>
			</td>
		<%} %>
		</tr>
		<tr>
		<% for(int j=6;j<10;++j){ %>
			<% if(j%2==0){%>
			<td style="background-color:#ffffcc">
			<%}else{ %>
			<td style="background-color:#ccffcc">
			<%} %>
			<% for(int i=1;i<10;++i){ %>
				<%=j %>*<%=i %>=<%=i*j %></br>
			<%} %>
			</td>
		<%} %>
		</tr>
		
		<%for(int k=0;k<10;++k){ %>
			<% if(k%2==0){%>
				<td style="background-color:#ffffcc"></td>
			<%}else{ %>
				<td style="background-color:#ccffcc"></td>
			<%} %>
		<%} %>
	</table>

</body>
</html>