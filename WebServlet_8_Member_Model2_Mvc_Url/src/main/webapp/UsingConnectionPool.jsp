<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tomcat Connection Pool TEST</title>
</head>
<body>
<%
	Connection conn = null;

	//JNDI (현재 프로젝트에서  특정한 이름으로 파일을 검색)
	Context context = new InitialContext();  //검색기능
	DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");  //  (정해진 약속) java:comp/env + jdbc/oracle 이름
    //DataSource 판매하는 상점 (튜브를 판매)
    
    //POOL 안에서 Connection 빌려주세요
    conn = ds.getConnection();
	
	out.print("db연결여부 : " + conn.isClosed() + "<br>");
	
	//반드시 사용 후에는 반환 (메서드 안에서 빌리고 반환)
	conn.close(); //반환(POOL)
	
	
	out.print("db연결여부 : " + conn.isClosed() + "<br>");
%>
</body>
</html>