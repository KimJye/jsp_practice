<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.util.*, java.net.*, p201632004.*, java.sql.*" %>
<%
     	request.setCharacterEncoding("UTF-8");
     
		String pg = request.getParameter("pg");
		String ss = request.getParameter("ss");
		if(ss==null)ss="0";
		String srchText = request.getParameter("st");
		if(srchText ==null) srchText="";
		String stEncoded = URLEncoder.encode(srchText,"UTF-8");
		
		String od = request.getParameter("od");
		String 에러메시지 = null;
		
		String notice = request.getParameter("notice");//공지받아오기
		if (notice == null) notice = "";
     	
     	Article art = new Article();
     	
     	if(request.getMethod().equals("GET")){
     		
     		art.setTitle("");
     		art.setBody("");
     		art.setUserId(0);
     		art.setNotice(false);
     	
     	}else{
     		String s1 = request.getParameter("id");
     		int id=Integer.parseInt(s1);
     		art.setId(id);
     		
     		String s2 = request.getParameter("userId");
     		art.setUserId(ParseUtils.parseInt(s2,0));
     		art.setBody(request.getParameter("body"));
     		
       		String s3 = request.getParameter("notice");
       		art.setNotice(s3.equals("true")?true:false);
       		
    		
    		if(art.getTitle()==null || art.getTitle().length()==0){
    			에러메시지 = "제목을 입력하세요";
    		}else if(art.getBody()==null || art.getBody().length()==0){
    			에러메시지 = "본문을 입력하세요";
    		}else if(s2==null || s2.length()==0)
    			에러메시지 = "작성자를 선택하세요";
			else{
				ArticleDAO.insert(art);
				response.sendRedirect("list1.jsp?pg=99999");
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

<h1>게시글 등록</h1>
<hr/>

<form method="post">
	<div class="form-group">
		<label>제목</label>
		<input type="text" class="form-control" name="title"
			value="<%=art.getTitle()%>"/>
	</div>
	<div class="form-group">
		<label>본문</label>
		<textarea class="form-control" name="body" rows="20"><%=art.getBody() %></textarea>
	</div>
	<div class="form-group">
		<label>작성자</label>
		<select class="form-control" name="userId">
			<%for(User u : UserDAO.findAll()){ %>
				<% String selected = art.getUserId()==u.getId()?"selected":""; %>
				<option value="<%=u.getId() %>"<%=selected %>>
					<%=u.getName() %>
				</option>
			<%} %>
		</select>
	</div>
	<div class="checkbox">
		<label> <input type="checkbox" name="notice" value="true"<%=art.isNotice()==true? "checked" : "" %>>공지</label>
	</div>
	
	<button type="submit" class="btn btn-primary">
		<i class="glyphicon glyphicon-ok"></i>저장
	</button>
	
	<a href="list1.jsp?pg=<%=pg %>&ss=<%=ss %>&st=<%=stEncoded %>&od=<%=od %>"
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