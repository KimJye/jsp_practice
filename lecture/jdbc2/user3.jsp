<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, jdbc1.*" %>
<%
request.setCharacterEncoding("UTF-8");

String nameText = request.getParameter("nameText");//이름받아오기
if (nameText == null) nameText = "";

String s = request.getParameter("departmentId");//학과 받아오기
int departmentId = (s==null)?0:Integer.parseInt(s);

String click = request.getParameter("button");//버튼 받아오기

//System.out.println(click);

//List<User> name_list;//이름 객체 생성
//List<User> de_list;//학과 객체 생성
List<User> list=null;//결과값 객체


//if(nameText==null) name_list = UserDAO2.findAll();
//else name_list = UserDAO2.findByName(nameText);


//if(departmentId==0) de_list = UserDAO2.findAll();
//else de_list = UserDAO2.findByDepartmentId(departmentId);

//name_list =UserDAO2.findByName("김");
//System.out.println(nameText);

//System.out.println(name_list.size());
//if("이름버튼".equals(click))  name_list = UserDAO2.findByName(nameText);
///else if("학과버튼".equals(click)) System.out.println("학과버튼");



if(click==null){
	System.out.printf("%d",1);
	list=UserDAO2.findAll();
}
else if("이름버튼".equals(click)){
	System.out.printf("%d",2);
	list=UserDAO2.findByName(nameText);
}
else if("학과버튼".equals(click)){
	System.out.printf("%d",departmentId);
	
	if(departmentId==0)list=UserDAO2.findAll();
	else list=UserDAO2.findByDepartmentId(departmentId);
	
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
<title>이름으로 조회,학과로 조회하기 구현 응용하기</title>
</head>
<body>

<div class="container">

<h1>학생목록</h1>

<form class="form-inline">
 
  <div class="form-group">
    <label>이름</label>
    <input type="text" class="form-control" name="nameText" value="<%= nameText %>" 
           placeholder="검색조건" />
  </div>
  
  <button type="submit" name="button"  value="이름버튼" class="btn btn-primary">조회</button>
  
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
   <div class="form-group">
    
    <label>학과</label>
    <select name="departmentId" name=departmentId class="form-control">
      <option value="0" <%= departmentId == 0 ? "selected" : "" %>>전체</option>
      <% for (Department d : DepartmentDAO.findAll()) { %>      
        <option value="<%= d.getId() %>" <%= departmentId == d.getId() ? "selected" : "" %>>
          <%= d.getDepartmentName() %>
        </option>
      <% } %>
    </select>
  </div>
  <button type="submit" name="button" value="학과버튼" class="btn btn-primary">조회</button>
</form>

<table class="table table-bordered table-condensed">
    <thead>
      		 <tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>학과</th>
				<th>사용자유형</th>
			</tr>
    </thead>
   <tbody>
			<%for(User user:list){ %>
				<tr>
					<td><%=user.getUserid() %></td>
					<td><%=user.getName() %></td>
					<td><%=user.getEmail() %></td>
					<td><%=user.getDepartmentName() %></td>
					<td><%=user.getUserType() %></td>
				</tr>
			<%} %>
		</tbody>
</table>

</div>
</body>
</html>
