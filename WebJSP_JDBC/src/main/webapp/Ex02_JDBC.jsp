<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Connection conn =null;
	Statement stmt = null;
	ResultSet rs = null;


	try{
		//드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver"); 
		System.out.println("Oracle 드라이버 로딩 ...");
		
		//연결 객체 생성
		conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bituser","1004");
		System.out.println("연결여부 ..." + conn.isClosed());
		
		//명령 객체 생성
		stmt =  conn.createStatement();
		 
		//parameter 설정하기 (옵션)
		String job="";
		job = "CLERK";
		String sql="select empno, ename, job from emp where job='" + job + "'";
		                                            //where job= 'SALES'
		//명령 실행
		//DQL(select)                  : rs= stmt.executeQuery(sql)  >> 결과 집합이 있다  
		//DML(insert , update, delete) > 결과 집합(x) > 반영된 행의 개수 리턴 : int row = stmt.executeUpdate(sql)
		//delete from emp 실행 > return 14
		
		 rs= stmt.executeQuery(sql);                                            		
		
		//명령처리 방법
		//DQL (select)  1. 결과가 없는 경우 (where empno=1111)
		//              2. 결과가 1건인 경우 (PK , Unique) where empno=7788 
		//              3. 결과가 여러건 : where deptno=20
		
		/*
			1.가장 단순한 방법
			while(rs.next()){ //너 결과 집합이 있니(row)
				rs.getInt("empno")
			}
		
			2.결과가 있는 경우와 없는 경우
			그 결과 있는 경우 1건 , 여러건이냐
			if(rs.next()){
				rs.getInt("empno")
			}else{
				조회된 데이터가 없습니다
			}
			
			
			1번 로직 하고 2번 합쳐서
			-single row
			-multi row
			-결과가 없는 경우 만족
			
		
		*/
		
		//공식같은 로직
		 if(rs.next()){
				do{
					out.print(rs.getInt("empno") +" / " + rs.getString("ename") + " / " + rs.getString("job"));
					out.print("<br>");
				}while(rs.next());
		 }else{
			   out.print("조회된 데이터가 없습니다");	
		 }
			
		
		
		/*                                            
		  while(rs.next()){
		    	out.print(rs.getInt("empno") +" / " + rs.getString("ename") + " / " + rs.getString("job"));
		    	out.print("<br>");
		    }
		*/	
	}catch(Exception e){
		System.out.println(e.getMessage());
		
	}finally{
		//자원해제
		stmt.close();
		rs.close();
		conn.close();
	}


%>