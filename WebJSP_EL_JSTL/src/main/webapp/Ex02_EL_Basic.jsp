<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//EL 스크립트 언어 (서버쪽 자원에 접근 가능) >> <%= 사용하지 않아도 되요
	//EL 을 사용한다고 해서 JAVA 가지는 수 많은 자원을 지원하지 않는다
	
	Date today= new Date();
	request.setAttribute("day", today);
	session.setAttribute("day2", today);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL 출력전용(화면) : EL 가지고 있는 객체 활용</h3>
	EL: ${requestScope.day}<br>
	EL: ${day}<br> <!-- requestScope 객체명을 생략 가능(좋은 방법은 아니다) -->
	EL: ${sessionScope.day2}<br>
</body>
</html>










