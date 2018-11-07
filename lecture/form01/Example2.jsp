<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>구현실습2</title>
<style> 
	input.form-control { width: 200px; }  
	
    table.table {width: 500px;}

    thead tr {background-color: #eee;}
</style>
</head>
<body>
	<%
		String s=request.getParameter("number");
		int number=(s==null)?0:Integer.parseInt(s);
		String a=request.getParameter("click");
		
		if("++".equals(a))number++;
		else if("--".equals(a))number--;
	%>
	<div class="container">
		<form>
			<div class="form-group">
				<label>number:</label>
				<br/>
				<input type="text" name="number"  value="<%=number%>"/>
			</div>
			
			<div class="form-group">
				<button type="submit" name="click" value="++" class="btn btn-primary">++</button>
				<button type="submit" name="click" value="--" class="btn btn-primary">--</button>
			</div>
		</form>
		
	</div>
</body>
</html>