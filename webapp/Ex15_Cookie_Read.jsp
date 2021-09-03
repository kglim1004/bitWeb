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
		접속한 클라이언트 브라우져가 가지고 있는 Cookie Read (Domain 별로)
	-->
	<%
	  Cookie[] cs= request.getCookies();
	if(cs != null || cs.length > 0){
		for(Cookie c : cs){
			out.print(c.getName() + "<br>");
			out.print(c.getValue() + "<br>");
			out.print(c.getMaxAge() + "<br>"); //있으면 파일 쿠키
			out.print(c.getDomain() + "<br>");
		}
	}
	
	%>
</body>
</html>