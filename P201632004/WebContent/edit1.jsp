<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*, java.net.*, p201632004.*, java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String 에러메시지 = null;
	
	String s1 = request.getParameter("id");
	int id = ParseUtils.parseInt(s1,0);
	
	String title = request.getParameter("title");
	String body = request.getParameter("body");
	
	String s2 = request.getParameter("userId");
	int userId = ParseUtils.parseInt(s2,0);
	
	String notice = request.getParameter("notice");//공지받아오기
	if (notice == null) notice = "";

	String pg = request.getParameter("pg");
	String ss = request.getParameter("ss");
	String st = request.getParameter("st");
	if(ss==null)ss="0";
	if(st==null)st="";
	String stEncoded = URLEncoder.encode(st,"UTF-8");
	
	String od = request.getParameter("od");
	Article art = null;
	
	if(request.getMethod().equals("GET")){
		art = ArticleDAO.findOne(id);
	}else{
		art = new Article();
		art.setId(id);
		art.setTitle(title);
		art.setBody(body);
		art.setUserId(userId);
		art.setNotice(notice.equals("true")?true:false);
		
		
		if(s1==null || s1.length()==0)
			에러메시지 = "ID를 입력하세요";
		else if(art.getTitle()==null || art.getTitle().length()==0){
			에러메시지 = "제목을 입력하세요";
		}else if(art.getBody()==null || art.getBody().length()==0){
			에러메시지 = "본문을 입력하세요";
		}else if(s2==null || s2.length()==0)
			에러메시지 = "작성자를 선택하세요";
		else{
			ArticleDAO.update(art);
			response.sendRedirect("list1.jsp?pg="+pg+ "&ss="+ss+"&st="+stEncoded+"&od="+od);
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
	<a href="delete1.jsp?id=<%=id %>&pg=<%=pg %>&ss<%=ss %>&st=<%=stEncoded%>&od=<%=od %>"
		class="btn btn-default" onclick="return confirm('삭제하시겠습니까?')">
		<i class="glyphicon glyphicon-trash"></i>삭제
	</a>
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