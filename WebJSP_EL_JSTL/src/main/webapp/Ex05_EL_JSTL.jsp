<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%

/* JSTL 구문
*1. <c:set 변수 생성, 값을 저장
2. <c:remove 변수 삭제
*3. <c:if test="조건문"  단일if 문 
*4. <c:choose 여러가지 조건에 따라 처리 가능(if 보다 활용도가 높아요)
*5. <c:forEach 반복문
6. <c:forTokens  for 문과 split 결합
7. <c:out   출력보다는 EL ${} 선호
8. <c:catch   예외처리도 가능
*/
 %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>EL & JSTL</h3>
		EL parameter 사용:
		${param.id}-${param.pwd}<br>
		
		<h3>EL parameter  값을 변수 저장</h3>
		<c:set var="userid" value="${param.id}" />
		<c:set var="userpwd" value="${param.pwd}" />
		<hr>
		<h3>JSTL 변수 값을 출력</h3>
		id : ${userid}<br>
		pwd: ${userpwd}<br>
		<hr>
		<c:if test="${!empty userpwd}">  <!--비번이 존재하면  -->
			<h3>not empty userpwd</h3>
			<c:if test="${userpwd == '1004'}">
				<h3>welcome Admin page</h3>
			</c:if>
		</c:if>
		
		<!--  
		http://localhost:8090/WebJSP_EL_JSTL/Ex05_EL_JSTL.jsp?id=kglim&pwd=1004
		http://localhost:8090/WebJSP_EL_JSTL/Ex05_EL_JSTL.jsp?id=kglim&pwd=1007
		-->
</body>
</html>














