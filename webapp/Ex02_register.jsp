<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트 데이터 받기
	//받은 데이터를 가지고 요청 판단 처리 ...
	
	//JSP
	//Tomcat 서버안에서 동작
	//Tomcat 서버가 내장 객체 .....
	//웹에서 사용되는 객체 (request, response) > new 하지 않아요 > 생성된 객체를 바로 사용
	
	//1. request   : 요청객체 (클라이언트가 [입력한 정보] 또는 [브라우져정보]를 등을 가지고 있는 객체)
	//서버는 request객체를 통해서 정보를 얻어내고 판단
	
	//2. response  : 응답객체 (서버에서 클라이언트 전달 .. write)

	//HttpServletRequest request = new HttpServletRequest()
	//자동 생성 request 이름으로
	
	
	//GET : localhost:8090/WebJSP/Ex02_register.jsp?userid=kglim&pwd=1004
	//GET : http://localhost:8090/WebJSP/Ex02_register.jsp?userid=kglim&pwd=1004&hobby=baseball&hobby=soccer
	
	
	//POST : http://localhost:8090/WebJSP/Ex02_register.jsp
	request.setCharacterEncoding("UTF-8");
	
	String uid= request.getParameter("userid");
	String pwd= request.getParameter("pwd");
	String[] hobby = request.getParameterValues("hobby");

	//판단 ...출력, DB,
	
	
	 /*  
    	한글처리 : ???? or 쾌꽉꽉 문제 처리
    	Tomcat9 버전이하
    	(GET)
    	1. 페이지 상단에 인코딩 : request.setCharacterEncoding("UTF-8");
        2. 서버 설정 server.xml 63라인
        <Connector  URIEncoding="UTF-8"   connectionTimeout="20000" port="8090" protocol="HTTP/1.1" redirectPort="8443"/>
    	
        Tomcat9 버전 설정 없어도 GET 한글 문제 없다
        
        (POST)
        항상 페이지 상단에 ...^^
        1. 페이지 상단에 인코딩 : request.setCharacterEncoding("UTF-8")
    */
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		클라이언트에게 응답<br>
		ID값 : <%=uid %><br>
		PWD값 : <%=pwd %><br>
		당신의 취미는:
		<%
			for(String str : hobby){
		%>
			hobby : <%=str %><br>			
		<%	
			}
		%>
</body>
</html>



