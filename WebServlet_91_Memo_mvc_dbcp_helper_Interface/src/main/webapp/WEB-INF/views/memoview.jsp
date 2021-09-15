<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table {
	
		    font-family: arial, sans-serif;
		    border-collapse: collapse; /* 붕괴하다 , 무너지다 */
		    width: 100%;
		}
		
		th {
		    border: 1px solid #dddddd;
		    text-align: center;
		    padding: 8px;
		}
		td{
		    border: 1px solid #dddddd;
			text-align: center;
			padding: 8px;
		}
		tr:nth-child(even) {  /* even 짝수     odd 홀수 */
		    background-color: #dddddd;
		}
	</style>
	
</head>
<body>
<c:set var="memo" value="${requestScope.memo}"></c:set>
<div align=center>
<hr color=green width=400><h2> Line Memo List </h2><hr color=green width=400>
<table> 
	 <tr>
	 	<th>Writer</th> 
	 	<th>MemoContent</th>
	 	<th>Email</th>
	 </tr>
	<tr>
			<td>${memo.id}</td>
			<td>${memo.email}</td>
			<td>${memo.content}</td>
	</tr>
</table>
</div>
<a href='memo.html'>글쓰기</a>
<hr>
<a href="MemoList.memo">목록보기</a> 
<hr>
<a href="MemoEdit.memo?id=${memo.id}">수정하기</a> 
<hr>
<a href="MemoDelete.memo?id=${memo.id}">삭제하기</a> 
</body>
</html>