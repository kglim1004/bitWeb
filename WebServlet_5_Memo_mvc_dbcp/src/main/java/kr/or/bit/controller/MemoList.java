package kr.or.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.MemoDao;
import kr.or.bit.dto.Memo;


@WebServlet("/MemoList")
public class MemoList extends HttpServlet {
 private static final long serialVersionUID = 1L;
       

    public MemoList() {
        super();
       
    }

 
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  doProcess(request, response);
 }

 
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  doProcess(request, response);
 }

 private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	System.out.println("목록보기 서비스 요청");
	 	
	 	MemoDao dao = new MemoDao();
	 	
	    try {
				List<Memo> memolist = dao.getMemoList();
				
				//memolist view 단에 전달
				//View JSP 사용
				
				//데이터 저장
				request.setAttribute("memolist", memolist);
				
				//view 지정
				RequestDispatcher dis = request.getRequestDispatcher("/memolist.jsp");
				
				//view forward
				dis.forward(request, response);
				
		} catch (SQLException e) {
				e.printStackTrace();
		}
 
 
 	}//End service()------------ 
}
