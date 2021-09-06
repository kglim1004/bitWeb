<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>View Page</h3>
		UI 정의 ....
		<hr>
		EL: ${requestScope.msg}<br>
		<%=request.getAttribute("msg")%>
</body>
</html>