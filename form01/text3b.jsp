<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
input.form-control {width: 200px;}

table.table {
	width: 500px;
}

thead tr {
	background-color: #eee;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<div class="container">
		<form>
			<h1>텍스트 입력폼 03</h1>

			<div class="form-group">
				<label>text1:</label> <input type="text" name="text1"
					class="form-control" value="<%=request.getParameter("text1") %>" />
			</div>

			<div class="form-group">
				<label>text2:</label> <input type="text" name="text2"
					class="form-control" value="<%=request.getParameter("text2") %>" />
			</div>

			<div class="form-group">
				<label>time:</label> <input type="text" class="form-control"
					name="time"
					value='<%=new SimpleDateFormat("HH:mm:ss").format(new Date()) %>' />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary" name="cmd" value="확인">

			</div>
		</form>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Parameter Name</th>
					<th>Parameter Value</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>text1</td>
					<td><%= request.getParameter("text1") %></td>
				</tr>
				<tr>
					<td>text2</td>
					<td><%= request.getParameter("text2") %></td>
				</tr>
				<tr>
					<td>time</td>
					<td><%= request.getParameter("time") %></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>