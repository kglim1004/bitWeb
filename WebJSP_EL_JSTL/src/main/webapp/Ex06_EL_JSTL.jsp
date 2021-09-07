<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ot.bit.Emp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>JSTL for</h3>
		<!-- 
			int sum=0;
			for(int i = 0 ; i <= 10 ; i++){
				sum+=i;
			}
		
			개선된 for
			for(String s : list){}
		 -->
		 
		 <c:forEach var="i" begin="1" end="10">
		 		<c:set var="sum" value="${sum+i}" />
		 		<b>${i}</b><br>
		 </c:forEach>
		 
		 sum: ${sum}<br>
		 
		 <h3>forEach</h3>
		 <ul>
		 	<c:forEach var="i" begin="1" end="9">
		 		<li>5*${i}=${5*i}</li>
		 	</c:forEach>
		 </ul>
		 
		 <h3>forEach & Choose</h3>
		 <table border="1">
		 	<c:forEach var="i" begin="2" end="9">
		 		<c:forEach var="j" begin="0" end="9">
		 			<c:choose>
		 				<c:when test="${j == 0}">
		 					<tr bgcolor="gold"><th>${i}단</th></tr>
		 				</c:when>
		 				<c:otherwise>
		 					 <tr><td>${i}*${j}=${i*j}</td></tr>
		 				</c:otherwise>
		 			</c:choose>		
		 		</c:forEach>
	 	 	</c:forEach>
		  </table>
		 
		 <h3>JSTL forEach</h3>
		 <%
		 	//자바코드로 해야되는 것
		 	int[] arr = new int[]{10,20,30,40,50};
		 	for(int i : arr){
		 		out.print("출력값 : <b><i>" + i + "</i></b><br>" );
		 	}
		 
		 %>
		 
		 <h3>EL java객체에 직접 접근 불가 >> JSTL 통해서 ...</h3>
		 arr객체 접근 : ${arr}<br>
		 
		 <c:set var="intarr" value="<%=arr %>" />
		 EL 접근 : ${intarr}<br>
		 <hr>
		 <h3>forEach (items) 개선된 for문</h3>
		 <c:forEach var="i" items="${intarr}">
		 		배열값 : ${i}<br>
		 </c:forEach>
		 
		 <h3>단순하게</h3>
		 <c:forEach var="i" items="<%=arr %>">
		 		배열값2 : ${i}<br>
		 </c:forEach>
		 
		 
		  <h3>재미삼아</h3>
		 <c:forEach var="i" items="<%=new int[]{1,2,3,4,5} %>">
		 		배열값3 : ${i}<br>
		 </c:forEach>
		 
		 <h3>forEach 속성활용하기</h3>
		 <c:forEach var="i" items="${intarr}" varStatus="status">
		 	index : ${status.index}-count : ${status.count}-value : ${i}<br>
		 </c:forEach>
		 
		 <h3>TODAY POINT (게시판 화면 구성)</h3>
		 <%
		 
		 	//servlet 에서 작성
		 
		 	//사원 정보를 담는 테이블 DB
		 	//select .....
		 	//데이터를 가지고 와서 객체에 담았어요
		 	List<Emp> emplist = new ArrayList<>();
		 	//데이터가 3건이라는 가정
		 	emplist.add(new Emp(100,"A"));
		 	emplist.add(new Emp(200,"B"));
		 	emplist.add(new Emp(300,"C"));

		 	for(Emp e : emplist){
		 		out.print(e.getEmpno() + "/" + e.getEname() + "<br>");
		 	}
		 	
		 	//저장해서 view 전달
		 	request.setAttribute("list",emplist);
		 	
		 	//forward >> list.jsp >> EL & JSTL 사용해서 출력
		 
	 %>
	 <h3>게시판 데이터 출력(EL&JSTL)******************</h3>
	 <c:set var="list" value="<%=emplist%>" />
	 <table border="1">
	 	<tr><td>사번</td><td>이름</td></tr>
	 		<c:forEach var="emp" items="${list}">
				<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
			</c:forEach>
	 </table>
	 
	 <hr>
	 
	 <h3>게시판 데이터 출력(EL&JSTL)</h3>
	 <table border="1">
	 	<tr><td>사번</td><td>이름</td></tr>
	 		<c:forEach var="emp" items="<%=emplist%>">
				<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
			</c:forEach>
	 </table>
	 
	 <hr>
	 
	 <h3>게시판 데이터 출력(requestScope)</h3>
	 <table border="1">
	 	<tr><td>사번</td><td>이름</td></tr>
	 		<c:forEach var="emp" items="${requestScope.list}">
				<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
			</c:forEach>
	 </table>
	 
	 <h3>java Map 객체를 EL&JSTL 사용해서 출력</h3>
	 <%
	 	Map<String,Object> hm = new HashMap<>();
	 	
	 	hm.put("name", "hong");
	 	hm.put("pwd","1004");
	 	hm.put("date" ,new Date());
	 %>
	 
	 <c:set var="hm" value="<%=hm%>" />
	 <c:forEach var="obj" items="${hm}">
	   ${obj.key} -> ${obj.value}<br>
	 </c:forEach>
	 
	 
	 <hr>
	 key:name > ${hm.name}<br>
	 key:pwd  > ${hm.pwd}<br>
	 key:date > ${hm.date}<br>
	 
	 
	 <h3>기타 옵션</h3>
	 <h3>JSTL 구분자 기준 처리</h3>
	 <c:forTokens var="token" items="A.B.C.D" delims=".">
	 		${token}<br>
	 </c:forTokens>
	 
	 
	  <h3>JSTL 복합구분자 기준 처리</h3>
	 <c:forTokens var="token" items="A.B/C-D" delims="./-">
	 		${token}<br>
	 </c:forTokens>
	 
	 <!--  
	 	forEach  step=-1 안되요 ...
	 -->
	 
	 <c:set var="nownum" value="10" />
	 <c:forEach var="i" begin="0"  end="${nownum}" step="1">
	 	${nownum - i}<br>
	 </c:forEach>
</body>
</html>









