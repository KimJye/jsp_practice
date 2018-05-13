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
<style> 
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1>파일 업로드</h1>
	<form action="<%=request.getContextPath() %>/fileupload/upload.do"" method="post" enctype="multipart/form-data">
	
		<div class="form-group">
			<label>제목</label>
			<input type="text" class="form-control" name="title"/>
		</div>
		
		<div class="form-group">
			<label>파일</label>
			<input type="file" class="fom-control" name="uploadFile"/>
		</div>
		
		<button type="submit" class="btn btn-primary">
			<i class="glyphicon glyphicon-ok"></i>저장
		</button>
</form>
</body>
</html>