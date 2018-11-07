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
<title>구현실습3</title>
<style> 
	input.form-control { width: 200px; }  
	
    table.table {width: 500px;}

    thead tr {background-color: #eee;}
</style>
</head>
<body>
	<%
		String s=request.getParameter("number");

		
		String one_checked="one".equals(s)?"checked":"";
		String two_checked="two".equals(s)?"checked":"";
		String three_checked="three".equals(s)?"checked":"";
		
		String ck=null;
		if("one".equals(s)) ck="one";
		else if("two".equals(s)) ck="two";
		else if("three".equals(s)) ck="three";
	
	%>
	<div class="container">
		<form>
			<div class="form-group">
				<label>select1:</label>
				<br/>
				<select name="number" class="form-control">
					<option value="one"<%="one".equals(s)?"selected" :"" %>>one</option>
					<option value="two"<%="two".equals(s)?"selected" :"" %>>two</option>
					<option value="three"<%="three".equals(s)?"selected" :"" %>>three</option>
			</div>
			<br/>
			<br/>
			<div class="radio">
				<label>
				<input type="radio" name="radio" value="one" <%=one_checked %>/>one</label>
				<input type="radio" name="radio" value="two" <%=two_checked %>/>two</label>
				<input type="radio" name="radio" value="three" <%=three_checked %>/>three</label>
			</div>
			
			<div class="form-group">
				<input type="text" value="<%=ck %>"/>
			</div>
			<div class="form-group">
				<button type="submit" name="click" value="change" class="btn btn-primary">확인</button>
			</div>
		</form>
		
	</div>
</body>
</html>