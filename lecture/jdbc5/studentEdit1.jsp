<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc5.*, java.util.*, java.net.*, lecture1.ParseUtils" %>

<%
	request.setCharacterEncoding("UTF-8");

	String 에러메시지 = null;
	String s1 = request.getParameter("id");
	int id=ParseUtils.parseInt(s1,0);
	
	String pg = request.getParameter("pg");
	String srchText = request.getParameter("srchText");
	if(srchText == null) srchText="";
	String srchTextEncoded = URLEncoder.encode(srchText,"UTF-8");
	
	Student student = null;
	
	if(request.getMethod().equals("GET")){
		student = StudentDAO.findOne(id);
	}else{
		student = new Student();
		student.setId(id);
		student.setStudentNumber(request.getParameter("studentNumber"));
		student.setName(request.getParameter("studentName"));
		String s2 = request.getParameter("departmentId");
		student.setDepartmentId(ParseUtils.parseInt(s2,1));
		String s3 = request.getParameter("year");
		student.setYear(ParseUtils.parseInt(s3,0));
		
		if(s1==null || s1.length()==0)
			에러메시지 = "ID를 입력하세요";
		else if(student.getStudentNumber()==null || student.getStudentNumber().length()==0){
			에러메시지 = "학번을 입력하세요";
		}else if(student.getName()==null || student.getName().length()==0){
			에러메시지 = "이름을 입력하세요";
		}else if(s3 == null || s3.length()==0)
			에러메시지 = "학년을 입력하세요";
		else{
			StudentDAO.update(student);
			response.sendRedirect("studentList1.jsp?pg="+pg+ "&srchText="+srchTextEncoded);
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
	body { font-family: 굴림체; }      
    input.form-control, select.form-control { width: 200px; }   
</style> 

<title>수정</title>
</head>
<body>

<div class="container">

<h1>학생 등록</h1>
<hr/>

<form method="post">
	<div class="form-group">
		<label>학번</label>
		<input type="text" class="form-control" name="studentNumber"
			value="<%=student.getStudentNumber() %>"/>
	</div>
	<div class="form-group">
		<label>이름</label>
		<input type="text" class="form-control" name="studentName"
			value="<%=student.getName() %>"/>
	</div>
	<div class="form-group">
		<label>학과</label>
		<select class="form-control" name="departmentId">
			<%for(Department d : DepartmentDAO.findAll()){ %>
				<% String selected = student.getDepartmentId()==d.getId()?"selected":""; %>
				<option value="<%=d.getId() %>"<%=selected %>>
					<%=d.getDepartementName() %>
				</option>
			<%} %>
		</select>
	</div>
	<div class="form-group">
		<label>학년</label>
		<input type="number" class="form-control" name="year" value="<%=student.getYear() %>"/>
	</div>
	<button type="submit" class="btn btn-primary">
		<i class="glyphicon glyphicon-ok"></i>저장
	</button>
	<a href="studentDelete1.jsp?id=<%=id %>&pg=<%=pg %>&srchText=<%=srchTextEncoded%>"
		class="btn btn-default" onclick="return confirm('삭제하시겠습니까?')">
		<i class="glyphicon glyphicon-trash"></i>삭제
	</a>
	<a href="studentList1.jsp?pg=<%=pg %>&srchText=<%=srchTextEncoded %>"
		class="btn btn-default">
		<i class="glyphicon glyphicon-list"></i>목록으로
	</a>
</form>
<hr/>
<%if(에러메시지 !=null){ %>
	<div class="alert alert-danger">
		학생등록 실패:<%=에러메시지 %>
	</div>
<%} %>

</div>
</body>
</html>