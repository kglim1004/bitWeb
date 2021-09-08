<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//insert into dmlemp(empno,ename,deptno) values(?,?,?)
	
	//update dmlemp set ename=? , deptno=? ,sal=? where empno=?
			
	//delete from dmlemp where deptno=?
			
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
			conn = SingletonHelper.getConnection("oracle");
			String sql="update dmlemp set ename=? , deptno=? ,sal=? where empno=?";
			pstmt = conn.prepareStatement(sql); //미리 쿼리문 오라클 서버에게 보내서 컴파일 ....대기 ..
			
			//parameter 설정
			pstmt.setString(1, "아무개");
			pstmt.setInt(2, 20);
			pstmt.setInt(3, 5555);
			pstmt.setInt(4, 5000);
			
			
			//실행
			int row = pstmt.executeUpdate();
			
			if(row > 0){
				out.print("update row count : " + row + "<br>");
			}else{
				//예외가 아니고 ... 반영된건이 없어요
				out.print("update row count  else : " + row + "<br>");
			}
		
	}catch(Exception e){
		//예외는 처리
		out.print(e.getMessage());
		//제약 (insert 시 : PK)
		//제약 (update 시 : Uk , Check)
		
	}finally{
		SingletonHelper.close(pstmt);
		
	}

%>