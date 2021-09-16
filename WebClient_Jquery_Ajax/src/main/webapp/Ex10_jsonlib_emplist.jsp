<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.bit.dto.Emp"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//CORS policy: No 'Access-Control-Allow-Origin'
//다른 도메인 요청에 대한 거부

//나 허락할게  와서 내 데이터 가져가 
//API 서버가 ..다른 사용자(도메인)이 사용가능
response.addHeader("Access-Control-Allow-Origin", "*");


Class.forName("oracle.jdbc.OracleDriver"); 
Connection conn = null;
conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bituser","1004");

Statement stmt =  conn.createStatement(); //명령객체 얻어오기
String sql="select empno , ename , sal , job , comm from emp"; //주의 사항 Date 타입은 변환 안되요
ResultSet rs= stmt.executeQuery(sql);

//POINT
//가지고 데이터는 DTO 객체에 담아야 한다
//14건
List<Emp> list = new ArrayList<>();

while(rs.next()){
	Emp emp = new Emp();
	emp.setEmpno(rs.getInt("empno"));
	emp.setEname(rs.getString("ename"));
	emp.setSal(rs.getInt("sal"));
	emp.setJob(rs.getString("job"));
	emp.setComm(rs.getInt("comm"));
	
	list.add(emp);
}
/*
for(Emp e : list){
	out.print(e.toString() +"<br>");
}
*/
//[{},{},{},{}.....]  14건
JSONArray jsonlist = JSONArray.fromObject(list);

/*
[ 
  {"comm":0,"empno":7369,"ename":"SMITH","job":"CLERK","sal":800},
  {"comm":300,"empno":7499,"ename":"ALLEN","job":"SALESMAN","sal":1600},
  {"comm":200,"empno":7521,"ename":"WARD","job":"SALESMAN","sal":1250},
  {"comm":30,"empno":7566,"ename":"JONES","job":"MANAGER","sal":2975},
  {"comm":300,"empno":7654,"ename":"MARTIN","job":"SALESMAN","sal":1250},
  {"comm":0,"empno":7698,"ename":"BLAKE","job":"MANAGER","sal":2850},
  {"comm":0,"empno":7782,"ename":"CLARK","job":"MANAGER","sal":2450},
  {"comm":0,"empno":7788,"ename":"SCOTT","job":"ANALYST","sal":3000},
  {"comm":3500,"empno":7839,"ename":"KING","job":"PRESIDENT","sal":5000},
  {"comm":0,"empno":7844,"ename":"TURNER","job":"SALESMAN","sal":1500},
  {"comm":0,"empno":7876,"ename":"ADAMS","job":"CLERK","sal":1100},
  {"comm":0,"empno":7900,"ename":"JAMES","job":"CLERK","sal":950},
  {"comm":0,"empno":7902,"ename":"FORD","job":"ANALYST","sal":3000},
  {"comm":0,"empno":7934,"ename":"MILLER","job":"CLERK","sal":1300}
]


*/
stmt.close();
rs.close();
conn.close();
%>    
<%=jsonlist%>






