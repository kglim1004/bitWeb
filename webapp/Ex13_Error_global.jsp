<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String data = request.getParameter("name");
	String data2 = data.toLowerCase(); //null 값

%>
전달 받은 내용 : <%=data %>
</body>
</html>