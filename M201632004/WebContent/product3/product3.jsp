<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, product1.Product, product3.*" %>
<%
request.setCharacterEncoding("UTF-8");

String s = request.getParameter("id");//아이디 받아오기
int id = (s==null)?0:Integer.parseInt(s);

String click = request.getParameter("button");

List<Product> list = null;


if(click==null){
	list=ProductDAO3.findAll();
}else if("제품유형".equals(click)){
	if(id==0)list=ProductDAO3.findAll();
	else list=ProductDAO3.findByid(id);
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
<title>목록조회</title>
</head>
<body>

<div class="container">

<h1>제품목록</h1>

<form class="form-inline">
 
   <div class="form-group">
    
    <label>제품유형</label>
   <select name="id" class="form-control">
      <option value="0" <%= id == 0 ? "selected" : "" %>>전체</option>
      <% for (Category c : CategoryDAO.findAll()) { %>      
        <option value="<%= c.getId() %>" <%= id == c.getId() ? "selected" : "" %>>
          <%= c.getName() %>
        </option>
      <% } %>
    </select>
  </div>
  <button type="submit" name="button" value="제품유형" class="btn btn-primary">조회</button>
</form>

<table class="table table-bordered table-condensed">
    <thead>
        <tr>
            <th>id</th>
            <th>제품명</th>
            <th>카테고리</th>
            <th>가격</th>
            <th>수량</th>
        </tr>
    </thead>
    <tbody>
        <% for (Product product : list) { %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getTitle() %></td>
                <td><%= product.getCategory() %></td>
                <td><%= product.getUnitCost() %></td>
                <td><%= product.getQuantity() %>
            </tr>
        <% } %>
    </tbody>
</table>
</div>
</body>
</html>
