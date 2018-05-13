<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="jdbc5.*, java.net.*, java.util.*, lecture1.*"%>
<%
     	request.setCharacterEncoding("UTF-8");
     
		String pg = request.getParameter("pg");
		String srchText = request.getParameter("srchText");
		if(srchText ==null) srchText="";
		String srchTextEncoded = URLEncoder.encode(srchText,"UTF-8");
     	
		String 에러메시지 = null;
		
		String able = request.getParameter("able");//동의여부받아오기
		if (able == null) able = "";
     	
     	User user = new User();
     	
     	if(request.getMethod().equals("GET")){
     		user.setUserid("");
     		user.setName("");
     		user.setEmail("");
     		user.setDepartmentName("");
     		user.setEnabled(false);
     		user.setUserType("");
     	}else{
     		String s1 = request.getParameter("id");
     		user.setId(ParseUtils.parseInt(s1,1));
     		user.setUserid(request.getParameter("userId"));
     		user.setName(request.getParameter("name"));
     		user.setEmail(request.getParameter("email"));
     		String s2 = request.getParameter("departmentId");
       		user.setDepartmentId(ParseUtils.parseInt(s2,1));
       		String s3 = request.getParameter("able");
       		user.setEnabled(s3.equals("true")?true:false);
       		user.setUserType(request.getParameter("userType"));
       		
       		if(user.getUserid()==null || user.getUserid().length()==0)
       			에러메시지="아이디를 입력하세요";
       		else if(user.getName()==null || user.getName().length()==0){
       			에러메시지="이름을 입력하세요";
     		}else if(user.getEmail()==null || user.getEmail().length()==0){
				에러메시지 = "이메일을 입력하세요";
			}else if(s2==null || s2.length()==0){
				에러메시지 = "학과를 선택하세요";
			}else if(s3==null || s3.length()==0){
				에러메시지 = "동의여부를 선택하세요";
			}else if(user.getUserType() == null || user.getUserType().length()==0){
				에러메시지 = "사용자 유형을 선택하세요";
			}
			else{
				UserDAO.insert(user);
				response.sendRedirect("userListPage.jsp?pg=99999");
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
	body{font-fmaily:굴림체;}
	input.form-control, select.form-control{width: 200px;}
</style>
<title>사용자 등록</title>
</head>
<body>
<div class="container">

<h1>사용자 목록</h1>
<hr/>
<form method="post">
	<div class="form-group">
		<label>학번</label>
		<input type="text" class="form-control" name="userId"
			value="<%=user.getUserid() %>"/>
	</div>
	<div class="form-group">
		<label>이름</label>
		<input type="text" class="form-control" name="name"
			value="<%=user.getName() %>"/>
	</div>
	<div class="form-group">
		<label>이메일</label>
		<input type="email" class="form-control" name="email"
			value="<%=user.getEmail() %>"/>
	</div>
	<div class="form-group">
		<label>학과</label>
		<select class="form-control" name="departmentId">
			<%for(Department d : DepartmentDAO.findAll()){ %>
				<% String selected = user.getDepartmentId()==d.getId()?"selected":""; %>
				<option value="<%=d.getId() %>"<%=selected %>>
					<%=d.getDepartementName() %>
				</option>
			<%} %>
		</select>
	</div>
	<div class="checkbox">

		<label> <input type="checkbox" name="able" value="true"<%=user.isEnabled()==true? "checked" : "" %>>동의</label>
		<label> <input type="checkbox" name="able" value="false"<%=user.isEnabled()==false? "checked" : "" %>>부동의</label>
	
	</div>
	<div class="form-group">
		<label>사용자 유형</label>
		<select class="form-control" name="userType">
				<option value="전체" <%="selected" %>>전체</option>
				<option value="관리자"<%=user.getUserType().equals("관리자")?"selected":"" %>>관리자</option>
				<option value="교수"<%=user.getUserType().equals("교수")?"selected":"" %>>교수</option>
				<option value="학생"<%=user.getUserType().equals("학생")?"selected":"" %>>학생</option>
		</select>
	</div>
	<button type="submit" class="btn btn-primary">
		<i class="glyphicon glyphicon-ok"></i>저장
	</button>
	<a href="userListPage.jsp?pg=<%=pg %>&srchText=<%=srchTextEncoded %>"
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