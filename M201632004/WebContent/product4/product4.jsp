<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, product1.Product, product4.ProductDAO4" %>

<%
request.setCharacterEncoding("UTF-8");

String type = request.getParameter("type");
if (type == null) type = "";

String click = request.getParameter("button");//버튼 받아오기


List<Product> list=null;//결과값 객체


if(click==null){
	list=ProductDAO4.findByType(type);
}
else if("유형버튼".equals(click)){
	if("전체".equals(type))list=ProductDAO4.findAll();
	else list=ProductDAO4.findByType(type);
	
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
<title>라디오 버튼</title>
</head>
<body>

<div class="container">

<h1>제품목록</h1>

<form class="form-inline">
 	
  <div class="radio">
  	<label><input type="radio" name="type" value="전체"<%="전체".equals(type)?"checked":"" %>>전체</label>
  </div>
  <div class="radio">
  	<label><input type="radio" name="type" value="음료수"<%= "음료수".equals(type)?"checked":"" %>>음료수</label>
  </div>
  <div class="radio">
  	<label><input type="radio" name="type" value="주류"<%= "주류".equals(type)?"checked":"" %>>주류</label>
  </div>
  <div class="radio">
  	<label><input type="radio" name="type" value="과자"<%= "과자".equals(type)?"checked":"" %>>과자</label>
  </div>
  
  <button type="submit" name="button"  value="유형버튼" class="btn btn-primary">조회</button>
  
	
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
