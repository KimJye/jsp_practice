<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Arrays, jdbc1.User, jdbc2.UserListExample" %>

<%
request.setCharacterEncoding("UTF-8");

String able = request.getParameter("able");//동의여부받아오기
if (able == null) able = "";

String[] userType = null;
userType = request.getParameterValues("userType");//유형 받아오기

String click = request.getParameter("button");//버튼 받아오기


List<User> list=null;//결과값 객체


if(click==null){
	
	list=UserListExample.findAll();
}
else if("동의버튼".equals(click)){
	
	list=UserListExample.findByable(able);
	
}
else if("유형버튼".equals(click)){
	
	list=UserListExample.findByUserType(userType);
	
}
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
      thead th { background-color: #eee; }
      table.table { width: 700px; margin-top: 10px; }
  </style>
<title>라디오버튼,체크박스로 조회하기 구현</title>
</head>
<body>

<div class="container">

<h1>학생목록</h1>

<form class="form-inline">
 	
  <div class="radio">
  	<label><input type="radio" name="able" value="true"<%="true".equals(able)?"checked":"" %>>동의</label>
  </div>
  <div class="radio">
  	<label><input type="radio" name="able" value="false"<%= "false".equals(able)?"checked":"" %>>부동의</label>
  </div>
  
  <button type="submit" name="button"  value="동의버튼" class="btn btn-primary">조회</button>
  
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
   <div class="checkbox">
   		<%  
             if (userType == null) userType = new String[0]; 
             List<String> types = Arrays.asList(userType);  
        %> 
     <label> <input type="checkbox" name="userType" value="관리자" <%= types.contains("관리자") ? "checked" : "" %>>관리자</label>
     <label> <input type="checkbox" name="userType" value="교수"<%= types.contains("교수") ? "checked" : "" %>>교수</label>
     <label> <input type="checkbox" name="userType" value="학생"<%= types.contains("학생") ? "checked" : "" %>>학생</label>
  </div>
  <button type="submit" name="button" value="유형버튼" class="btn btn-primary">조회</button>
</form>

<table class="table table-bordered table-condensed">
    <thead>
      		 <tr>
      		 	<th>아이디</th>
				<th>학번</th>
				<th>이름</th>
				<th>이메일</th>
				<th>학과</th>
				<th>동의여부</th>
				<th>사용자유형</th>
			</tr>
    </thead>
   <tbody>
			<%for(User user:list){ %>
				<tr>
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

</div>
</body>
</html>
