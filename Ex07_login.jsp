<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//Document.loginform.action="Ex07_login.jsp";
//주소가 서버에 요청 되면 Ex07_login.jsp 파일이 실행

//...Ex07_login.jsp?txtuserid=kglim&txtpwd=1004

String id = request.getParameter("txtuserid");
String pwd = request.getParameter("txtpwd");

//그 다음 ...DB연결 , select where... , IO작업
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	서버확인(Client에게 다시 전달)<br>
	<%=id%><br>
	<%=pwd%>
</body>
</html>









