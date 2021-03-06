<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*, jdbc4.User, jdbc4.UserDAO, lecture1.ParseUtils" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%
	int currentPage=1;
	int pageSize=10;
	
	String pg = request.getParameter("pg");
	if(pg !=null)currentPage = ParseUtils.parseInt(pg,1);
	int recordCount = UserDAO.count();
	int lastPage = (recordCount+pageSize-1)/pageSize;
	if(currentPage>lastPage)currentPage=lastPage;
	
	List<User> list = UserDAO.findAll(currentPage, pageSize);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style>
	body{font-family:굴림체;}
	thead th{background-color:#eee;}
	table.table{width:700px;}
	tr:hover td{background-color:#ffe; cursor: pointer;}
	#createButton{margin-left:590px; margin-botton:4px;}
</style>
<title>Insert title here</title>
</head>
<body>

<div class="container">
<h1>학생목록</h1>

<a id="createButton" class="btn btn-primary" href="userCreate.jsp">
	<i class="glyphicon glyphicon-plus"></i> 학생 등록
</a>
<table class="table table-bordered table-condensed">
	<thead>
		<tr>
			<th>id</th>
			<th>학번</th>
			<th>이름</th>
			<th>이메일</th>
			<th>학과</th>
			<th>동의여부</th>
			<th>유형</th>
		</tr>
	</thead>
	<tbody>
		<% for(User user : list){ %>
			<tr data-url="userListEdit.jsp?id=<%=user.getId() %>&pg=<%=currentPage%>">
				<td><%=user.getId() %></td>
				<td><%=user.getUserid() %></td>
				<td><%=user.getName() %></td>
				<td><%=user.getEmail() %></td>
				<td><%=user.getDepartmentName() %></td>
				<td><%=user.isEnabled() %></td>
				<td><%=user.getUserType() %></td>
			</tr>
		<%} %>
	</tbody>
</table>

<my:pagination pageSize="<%= pageSize %>" recordCount="<%= recordCount %>" queryStringName="pg" />

</div>

<script>
$("[data-url]").click(function(){
	var url = $(this).attr("data-url");
	location.href=url;
})
</script>
</body>
</html>