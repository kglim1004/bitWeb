<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String id = request.getParameter("userid");

		request.setAttribute("name", "korea");
		session.setAttribute("user", "bit");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSP</h3>
	<b><%= id %></b><br>
	<b><%= request.getAttribute("name") %></b><br>
	<b><%= session.getAttribute("user") %></b><br>
	<b><%= request.getParameter("userid") %></b><br>
	
	<!-- 
	EL (출력표현식) : JSP 페이지에서 사용되는 스크립트 (서버쪽 내용을 출력할 수 있는) 언어
	이유 : (% >> 스파게티 코드 생산  > html css 와 혼재 > 유지보수 어려움 , 코드의 해석(가독성)
	
	문제해결: html와 잘 어울리고 [[서버쪽 값도 출력]]할 수 있는 script >> EL & JSTL >> 단점(JSP 종속)
	 
	EL : tomcat 이 내장하고 있는 자원(별도의 참조 없이 사용 가능)
	
	EL 가지는 객체
	1. param 객체
	2. paramValues 객체
	3. requestScope 객체
	4. sessionScope 객체
	5. applicationScope 객체
     -->
	<hr>
	<h3>EL 출력표현식</h3>
	기존 <%= 100+100 %><br>
	EL : ${200+200}<br>
	EL : ${"1" + 1}<br>  <!-- 문자형 숫자 (자동형변환) 숫자 + 숫자 -->
	EL : ${1==1}<br>
	EL : ${false}<br>
	EL : ${!false}<br>
	EL : ${empty x}<br><!--  x라는 변수의 값이 비어있니 -->
</body>
</html>







