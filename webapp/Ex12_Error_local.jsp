<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page errorPage="/error/CommonError.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  
예외가 발생했을때 처리 페이지 설정 ...

현재 사이트 공사중입니다.
현재 네트워크 장애가 있습니다.

처리 : 실 서버에 배포 할때면
개발할때는 예외를 보고 확인 해야 되니까
-->
<%
	String data = request.getParameter("name");
	String data2 = data.toLowerCase(); //null 값

%>
전달 받은 내용 : <%=data %>
</body>
</html>