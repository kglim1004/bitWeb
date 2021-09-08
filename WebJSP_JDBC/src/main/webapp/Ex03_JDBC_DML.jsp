<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
DML (insert , update , delete)
JDBC API 통해서 작업
1. 결과 집합이 없다
2. 반영결과(반영된 행의 수 return)

update emp set sal=0 실행 >> return 14
update emp set sal=100 where empno=1111 >>  return 0
		
java 코드 조건처리 통해서 (성공 과 실패 판단)

KEY POINT
1. Oracle DML (developer , cmd , Tool) 하면 기본 옵션이 commit or rollback 강제
2. JDBC API 사용해서 작업 >> DML >> default >> autocommit ******************
3. java 코드에서 delete from emp >> 실행 >> 자동 commit >> 실반영
4. 필요에 따라서 commit , rollback java 코드에서 제어 가능

시작
 A계좌 인출(update)
 ...
 B계좌 입금(update)
종료
하나의 논리적인 단위(transaction) : 성공 아니면 실패
autocommit 옵션 >> false 전환
java code 명시적으로 >> commit() , rollback()구현해야 합니다

-------------------------------------------------------
create table dmlemp
as
select * from emp;

select * from dmlemp;

alter table dmlemp
add constraint pk_dmlemp_empno primary key(empno);
--------------------------------------------------------
*/

	Connection conn = null;
	Statement stmt = null;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver"); 
		System.out.println("Oracle 드라이버 로딩 ...");
		
		//연결 객체 생성
		conn =  DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.57:1521:xe","bituser","1004");
		System.out.println("연결여부 ..." + conn.isClosed());
		
		//명령 객체 생성
		stmt =  conn.createStatement();
		
		/*
		INSERT
		String sql="insert into dmlemp(empno,ename,deptno) values(2000,'홍길동',30)";
		*/
		
		/*
		UPDATE
		String sql="update dmlemp set sal=0 where deptno=20";
		//실반영 
		*/
		
		String sql="delete from dmlemp where deptno=20";
		
		int resultrow = stmt.executeUpdate(sql);
		
		if(resultrow > 0 ){
			out.print("반영된 행의 수 : "+ resultrow);
		}else{
			//POINT
			//문제가 생겨서 타는 곳이 아니고 (예외가 발생한 것이 아니고)
			//반영된 행이 없다라는 뜻
			out.print("반영된 행이 없다");
		}
	}catch(Exception e){
		//stmt.executeUpdate(sql); 구문이 실행되다 예외 발생
		out.print(e.getMessage());
	}finally{
		if(stmt != null) try{stmt.close();}catch(Exception e){}
		if(conn != null) try{conn.close();}catch(Exception e){}
	}





%>