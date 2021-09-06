<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>servlet 요청</h3>
	<h3>getContextPath</h3>
	<%= request.getContextPath() %>
	<hr>
	<a href="<%=request.getContextPath()%>/simple">/simple 요청하기(GET)</a>
	<br>
	<a href="<%=request.getContextPath()%>/simple?type=date">날짜 요청하기(GET)</a>
	<br>
	<a href="<%=request.getContextPath()%>/simple?type=abcd">비정상 요청하기(GET)</a>
	<br>
	<hr>
	<h3>FrontServletController</h3>
	<a href="<%= request.getContextPath()%>/action.do?cmd=greeting">Front요청하기(GET)</a>
</body>
</html>