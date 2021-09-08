<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="kr.or.bit.utils.ConnectionHelper"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	Connection conn = null;
	conn = ConnectionHelper.getConnetion("oracle");
	out.print(conn + "<br>");
	out.print(conn.isClosed());
*/


	Connection conn = null;
	conn = ConnectionHelper.getConnetion("oracle","HR","1004");
	out.print(conn + "<br>");
	out.print(conn.isClosed());

	Connection conn4 = null;
	conn4 = ConnectionHelper.getConnetion("oracle","HR","1004");
	out.print(conn4 + "<br>");
	out.print(conn4.isClosed());
	//5개의 Page > DB연결 시도 > ConnectionHelper.getConnetion("oracle") > 새로운 객체
    
    //하나의 연결 객체를 가지고 공유해서 (Singleton) > 학습용 >> 현업(Connection POOL 사용)
	
    
    Connection conn2 = null;
    conn2 = SingletonHelper.getConnection("oracle");
    
    Connection conn3 = null;
    conn3 = SingletonHelper.getConnection("oracle");
    out.print("<br>");
    out.print(conn2 == conn3);
    out.print("<br>");
    out.print(conn2 +"<br>");
    out.print(conn3 + "<br>");
    
    out.print(conn2.getMetaData().getDatabaseProductName() + "<br>");
    out.print(conn2.getMetaData().getDatabaseProductVersion() + "<br>");
%>





