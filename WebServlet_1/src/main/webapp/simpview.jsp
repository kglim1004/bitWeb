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
	request.setAttribute("result", resultObj);
 -->
		<h3>MVC 중에서 View담당</h3>
		<h3>SimpleController에서 forward 된 페이지 데이터를 출력</h3>
		요청한 결과 출력 <%= request.getAttribute("result") %>
</body>
</html>