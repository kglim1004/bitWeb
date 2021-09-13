<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 한글처리
	//데이터를 받는 상단에 
	//request.setCharacterEncoding("UTF-8"); 

    /*
    한글처리 
    관심사(주관심, 보조관심)
	주관심  : 데이터를 받아서 화면 출력
	보조관심 : 한글처리 (모든 페이지에 필요) : 공통의 관심사
	
	aop 방식 : 주관심, 보조관심 분리
	filter : 인증 , 한글 ....... 
    */


%>    

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		한글명:${param.kor}<br>
		영문명:${param.eng}<br>
</body>
</html>






