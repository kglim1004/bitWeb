<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--

Server(웹 서버 : WAS)
1. server memory : session객체 (사이트 접속하는 사용자마다 부여하는 고유한 식별값 ) >>서버 리부팅 , 서버 정지 >> 소멸
2. server memory : Application객체 (사이트 접속하는 모든 사용자가 공유하는 객체)  >>서버 리부팅 , 서버 정지 >> 소멸


 session객체 : 서버에서(web)에서 접속한 사용자마다 고유하게 부여하는 객체 (고유하다 보장 : key(중복되지 않는))
 
 session객체 생성 (필요한 정보 담거나 가져올수 있다) [고유한 정보] : 로그인한 ID (게시판 글쓰기) , 쇼핑몰 구매한 물건 목록 ,
                                                        처음 접속한 시간 , 마지막 접속한 시간 ... 
 
 
 JSESSIONID : BBDBAC17153DEBF472D7B568250A7413 유일값이 동기화 서버와 .....
 
 100명 사용자 서버에 접속하면 서버는 session객체 100개 생성
 
 session객체 소멸 : 로그아웃 버튼 클릭하면 : session 소멸하는 코드 실행 ....
-->

<%
	Date time  = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<h3>세션정보</h3>
session 객체의 식별값 : <%= session.getId() %><br>

<hr>
<%
		time.setTime(session.getCreationTime());
%>
[session 생성된 시간]  : <%= formatter.format(time) %>

<hr>
<%
		time.setTime(session.getLastAccessedTime());
%>
[session 마지막 접속 시간(client)]  : <%= formatter.format(time) %>
<br>
</body>
</html>
