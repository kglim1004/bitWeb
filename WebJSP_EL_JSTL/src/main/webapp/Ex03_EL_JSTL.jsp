<%@page import="java.util.HashMap"%>
<%@page import="kr.ot.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 외부 Lib(jar) 사용하는 방법  -->
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	Emp e = new Emp();
	e.setEmpno(2000);
	e.setEname("bituser");
	
	HashMap<String ,String> hp = new HashMap<String ,String>();
	hp.put("data", "1004");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>기존방식</h3>
		<%= e %><br>
		<%= e.getEmpno() %><br>
		<%= e.getEname() %><br>
		
		<h3>EL 출력(서버)**************</h3>
		EL: 자바 객체 출력 (자바 객체에 대한 직접 접근 불가) : ${e}<br>
		EL: ${e.getEmpno()}<br>
		
		<h3>해결</h3>
		1. 객체를 request 나 session에 담아서 사용 <br>
		2. JSTL 사용 (변수 , 제어)

		<h3>JSTL(core) : 변수 , 제어문 (자바코드 없이)</h3>
		<c:set var="m"  value="<%=e%>" />
		JSTL을 통해서 만든 변수는 EL 사용가능 : ${m}<br>
		
		EL 에서는 getter 사용하지 않아요
		${m.getEmpno()}-${m.getEname()}<br>
		
		EL  출력(m.memberfield명 : 자동으로 getter 호출) : ${m.empno}<br>
		EL  출력(m.memberfield명 : 자동으로 getter 호출) : ${m.ename}<br>
		<hr>
		<!-- 
		EL : 출력목적 >> 변수 , 제어구조를 개념이 없어요
		JSTL : EL을 도와서 변수,제어구조정의 하는 역할
		 -->
		
		<c:set var="username" value="${m.ename}" />
		변수값 출력 : ${username}<br>
		
		<hr>
		<h3>JSTL 변수를 만들고 scope 정의하기</h3>
		<c:set var="job" value="농구선수" scope="request" />
		1. 현재 페이지 내에서만 사용가능<br>
		2. include or forward 한 페이지가 있다면 request 객체는 공유된다<br>
		
		당신의 직업은 : ${job}<br>
		
		<hr>
		<c:set var="job2" value="야구선수" scope="request" />
		값 출력 : ${job2}<br>
		
		만든 변수 삭제 기능(잘 쓰지 않아요)<br>
		<c:remove var="job2"/>
		job2변수 삭제 : ${job2}<br>
		
		<hr>
		hp 객체 직접 접근 : ${hp}<br>
		<c:set var="vhp" value="<%=hp%>" />
		hp객체 : ${vhp}<br><!-- {data=1004} -->
		hp객체 : ${vhp.data}<br>
		
		그냥 재미 삼아 <br>
		<!-- 
		hp.put("color","red")
		 -->
		 <c:set target="${vhp}" property="color" value="red" />
		hp객체 : ${vhp}<br>
</body>
</html>






