<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>servlet 요청</h3>
	<h3>getContextPath</h3>
	<%= request.getContextPath() %>
	<hr>
	<a href="<%=request.getContextPath()%>/simple">/simple 요청하기(GET)</a>
	<br>
	<a href="<%=request.getContextPath()%>/simple?type=date">날짜 요청하기(GET)</a>
	<br>
	<a href="<%=request.getContextPath()%>/simple?type=abcd">비정상 요청하기(GET)</a>
	<br>
	<hr>
	<h3>FrontServletController</h3>
	<a href="<%= request.getContextPath()%>/action.do?cmd=greeting">Front요청하기(GET)</a>
	
	<hr>
	<h3>FrontBoardController</h3>
	<a href="<%=request.getContextPath()%>/board?cmd=boardlist">게시판 목록보기</a>
	<br>
	<a href="<%=request.getContextPath()%>/board?cmd=boardwrite">게시판 글쓰기</a>
	<br>
	<a href="<%=request.getContextPath()%>/board">cmd 가 null 처리 유도</a>
	<br>
	<a href="<%=request.getContextPath()%>/board?cmd=boarddelete">게시판 삭제하기</a>
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/board?cmd=login">보안 페이지 로그인 보여주기</a>
	<hr>
	EL ${pageContext.request.contextPath}<br>
</body>
</html>





