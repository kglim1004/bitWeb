package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.or.bit.dto.Memo;
import kr.or.bit.utils.SingletonHelper;

/*
1. db연결
2. CRUD 함수 생성 (1개의 테이블 대상으로) >> memo
2.1 전제 데이터 조회 : select id, email, content from memo
2.2 조건 조회(PK)  : select id, email, content from memo where id=? (id >> pK 조건)
2.3 삽입 : insert into memo(id,email,content) values(?,?,?)
2.4 수정 : update memo set email=? , content=? where id=? (id >> pK 조건)
2.5 삭제 : delete from memo where id=?
추가
2.6 Like 조건검색 : where email like '%naver@%'

+

ArrayList
HashMap 


*/
public class MemoDao {
	/*
	 싱글톤 사용하지 않을 거예요
			Connection conn = null;
			
			public MemoDao() {
				conn = SingletonHelper.getConnection("oracle");
			}
	*/
	//5개의 함수 구현
	
	//pool
	DataSource ds = null;
	public MemoDao() {
		
		try {
				Context context = new InitialContext();  //검색기능
				ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			  System.out.println(e.getMessage());
		}
		
	}
	
	
	
	
	
	
	
	
	//select id, email, content from memo
	//전체 조회
	public List<Memo> getMemoList() throws SQLException{  //예외를 던져서 getMemoList() 사용하는 사람이 처리
		PreparedStatement pstmt = null;
		String sql= "select id, email, content from memo";
		
		////////////////////////////////////  튜브하나 빌려주세요
		Connection conn = ds.getConnection();
		////////////////////////////////////
		
		pstmt = conn.prepareStatement(sql);
		
		
		
		ResultSet rs = pstmt.executeQuery();
		
		//TODAY POINT  
		List<Memo> memolist = new ArrayList<Memo>();
		//데이터 4건
		//[Memo][Memo][Memo][Memo]
		//memolist.add()
		
		while(rs.next()) {  //데이터 건수 만큼 반복
			Memo m = new Memo();
			m.setId(rs.getString("id"));
			m.setEmail(rs.getString("email"));
			m.setContent(rs.getString("content"));
			
			memolist.add(m);
		}
		
		SingletonHelper.close(rs);
		SingletonHelper.close(pstmt);
		
		//반드시 반환  pool//////////////////////
		conn.close();
		///////////////////////////////////////
		
		return memolist; //Arraylist 주소를 리턴
	}
	
	
	//select id, email, content from memo where id=?
	//조건조회
	public Memo getMemoListById(String id) {
		
		//select id, email, content from memo where id=?
		//Memo m = new Memo();
		//return m;
		
		return null;
	}
	
	
	//insert into memo(id,email,content) values(?,?,?)
	//데이터 삽입
	//public int insertMemo(String id , String email , String content) ... 틀리지 않아요
	//객체 지향언어 (객체 형태로 주고) ....Memo
	public int insertMemo(Memo m) {
		System.out.println(m.toString());
		
		int resultrow=0;
		PreparedStatement pstmt = null;
		String sql="insert into memo(id,email,content) values(?,?,?)";
		
		
		Connection conn = null; //POOL
		
		try {
			
				////////////////////////////////////  튜브하나 빌려주세요
				conn = ds.getConnection();
				////////////////////////////////////
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, m.getId());
				pstmt.setString(2, m.getEmail());
				pstmt.setString(3, m.getContent());
				
				resultrow = pstmt.executeUpdate(); //반영된 행의 수
			
		} catch (Exception e) {
			 System.out.println(e.getMessage());
		}finally {
			SingletonHelper.close(pstmt);
			
			//반드시 반환  pool//////////////////////
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			///////////////////////////////////////
		}
		
		return resultrow;
	}
	
	//update memo set email=? , content=? where id=? (id >> pK 조건)
	public int updateMemo(Memo m) {
		return 0;
	}
	
	public int deleteMemo(String id) {
		return 0;
	}
	
	//검색
	//결과 여러건 (Memo)
	//결과 한건  (Memo)
	public List<Memo> idSearchByEmail(String email){
		return null;
	}
	
}












