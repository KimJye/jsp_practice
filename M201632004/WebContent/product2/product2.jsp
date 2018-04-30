<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, product1.Product, product2.ProductDAO2" %>
 <%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
    <%
    	int currentPage =1;
    	int pageSize =10;
    	
    	String pg = request.getParameter("pg");
    	if(pg !=null) currentPage = Integer.parseInt(pg);
    	
    	List<Product> list = ProductDAO2.findAll(currentPage,pageSize);
    	int recordCount = ProductDAO2.count();
    
    
    %>
<%
request.setCharacterEncoding("UTF-8");

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
<title>제품명으로 조회하기 구현</title>
</head>
<body>

<div class="container">

<h1>제품목록</h1>


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
<my:pagination pageSize="<%= pageSize %>" recordCount="<%= recordCount %>" queryStringName="pg" />
</div>
</body>
</html>
