<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="lecture1.form02.Student" %>
   <%
  
   	String userid="";
   	String number="";
   	String name="";
   	int department=0;
  	int grade=0;
   	String 에러메시지 =null;
   	
   	request.setCharacterEncoding("UTF-8");
   	
   	if(request.getMethod().equals("POST")){
   		userid = request.getParameter("userid");
   		number = request.getParameter("number");
   		name = request.getParameter("name");
   		String s = request.getParameter("grade");
   		grade = (s==null)?0:Integer.parseInt(s);
   		department = Integer.parseInt(request.getParameter("department"));
   		
   		if(userid==null || userid.length()==0)
   			에러메시지 = "아이디를 입력하세요";
   		else if(number==null || number.length()==0)
   			에러메시지 = "학번을 입력하세요";
   		else if(name==null || name.length()==0)
   			에러메시지 = "이름을 입력하세요";
   		else if(grade==0)
   			에러메시지 = "학년을 입력하세요";
   		else{
   			Student stu = new Student(userid,number,name,department,grade);
			session.setAttribute("user",stu);
   			response.sendRedirect("student_success.jsp");
   			return;
   		}
   	}
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
	input.form-control{width:200px;}
</style>
<title>Student 과제</title>
</head>
<body>
	<div class="container">
		<h1>학생등록</h1>
		<hr/>
		<form method="post">
			<div class="form-group">
				<label>ID</label>
				<input type="text" class="form-control" name="id" value="<%=userid %>"/>
			</div>
			<div class="form-group">
				<label>학번</label>
				<input type="text" class="form-control" name="number" value="<%=number%>"/>
			</div>
			<div class="form-group">
				<label>이름</label>
				<input type="text" class="form-control" name="name" value="<%=name%>"/>
			</div>
			<div class="form-group">
				<label>학과</label>
				<select class="form-control" name="department">
					<option value="1"<%=department==1?"selected":"" %>>소프트웨어공학과</option>
					<option value="2"<%=department==2?"selected":"" %>>컴퓨터공학과</option>
					<option value="3"<%=department==3?"selected":"" %>>정보통신공학과</option>
					<option value="4"<%=department==4?"selected":"" %>>글로컬IT공학과</option>
				</select>
			</div>
			<div class="form-group">
				<label>학년</label>
				<input type="text" class="form-control" name="grade" value="<%=grade%>"/>
			</div>
			<button type="submit" class="btn btn-primary">
				<i class="glyphicon glyphicon-ok"></i>저장
			</button>
		</form>
		
		<hr/>
		<%if(에러메시지!=null){ %>
		<div class="alert alert-danger">
			학생등록 실패:<%=에러메시지 %>
		</div>
		<%} %>
	</div>

</body>
</html>