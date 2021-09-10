package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.or.bit.dto.RegisterDto;
import kr.or.bit.utils.DbcpHelper;

//CRUD 함수 생성

public class RegisterDao {

	
	//insert into mvcregister(id, pwd, email) values(?,?,?)
	public int writeOk(RegisterDto dto) {
		
		Connection conn = null;
		PreparedStatement pstmt=null;
		int resultrow=0;
		try {
			  conn = DbcpHelper.getConnection("oracle");
			  String sql="insert into mvcregister(id, pwd, email) values(?,?,?)";
			  pstmt = conn.prepareStatement(sql);
			  
			  pstmt.setInt(1, dto.getId());
			  pstmt.setString(2, dto.getPwd());
			  pstmt.setString(3, dto.getEmail());
			  
			  resultrow = pstmt.executeUpdate();
		} catch (Exception e) {
				System.out.println(e.getMessage());
		}finally {
			DbcpHelper.close(pstmt);
			DbcpHelper.close(conn); //반환하기
		}
		return resultrow;
	}
}
