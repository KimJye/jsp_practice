<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*, java.net.*, jdbc7.*, lecture1.*" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%
	int currentPage=1;
	int pageSize=10;
	
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");
	if(pg !=null)currentPage = ParseUtils.parseInt(pg,1);
	
	String ss = request.getParameter("ss");
	String st = request.getParameter("st");
	if(ss==null)ss="0";
	if(st==null)st="";
	
	String stEncoded = URLEncoder.encode(st,"UTF-8");
	
	int recordCount = StudentDAO.count(ss,st);
	
	int lastPage = (recordCount+pageSize-1)/pageSize;
	if(currentPage>lastPage)currentPage=lastPage;
	
	String od = request.getParameter("od");
	if(od==null)od="0";
	List<Student> list = StudentDAO.findAll(currentPage, pageSize,ss,st,od);

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
</head>
<title>학생 목록 리스트</title>
</head>
<body>

<div class="container">
<h1>학생목록</h1>

<a id="createButton" class="btn btn-primary pull-right" 
	href="studentCreate1.jsp?pg=<%=currentPage%>&ss=<%=ss %>&st=<%=stEncoded%>&od=<%=od%>">
	<i class="glyphicon glyphicon-plus"></i> 학생 등록
</a>

<form class = "form-inline">
	<div class="form-group">
		<lable>정렬</lable>
		<select name="od" class="form-control">
			<option value="0" <%="0".equals(od)?"selected":"" %>>등록순서</option>
			<option value="1" <%="1".equals(od)?"selected":"" %>>학과</option>
			<option value="2" <%="2".equals(od)?"selected":"" %>>학년</option>
		</select>
			<select name="ss" class="form-control">
			<option value="0" <%="0".equals(ss)?"selected":"" %>>전체</option>
			<option value="1" <%="1".equals(ss)?"selected":"" %>>이름</option>
			<option value="2" <%="2".equals(ss)?"selected":"" %>>학과명</option>
		</select>
		<input type="text" class="form-control" name="st" value="<%=st %>" placeholder="검색조건"/>
	</div>
	<button type="submit" class="btn btn-primary">조회</button>
</form>

<table class="table table-bordered table-condensed">
	<thead>
		<tr>
			<th>id</th>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>학년</th>
		</tr>
	</thead>
	<tbody>
		<% for(Student student : list){ %>
			<tr data-url="studentEdit1.jsp?id=<%=student.getId() %>&pg=<%=currentPage%>&ss=<%=ss %>&st=<%=stEncoded%>&od=<%=od%>">
				<td><%=student.getId() %></td>
				<td><%=student.getStudentNumber() %></td>
				<td><%=student.getName() %></td>
				<td><%=student.getDepartmentName() %></td>
				<td><%=student.getYear() %></td>
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