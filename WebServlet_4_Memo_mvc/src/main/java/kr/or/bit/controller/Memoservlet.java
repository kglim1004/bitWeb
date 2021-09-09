package kr.or.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.MemoDao;
import kr.or.bit.dto.Memo;

//localhost:8090/WebServlet_3/MemoServlet
@WebServlet("/MemoServlet")
public class Memoservlet extends HttpServlet {
 private static final long serialVersionUID = 1L;
       
   
    public Memoservlet() {
        super();
       
    }

 
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doProcess(request, response);
 }

 
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doProcess(request, response);
 }
 private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  //1.한글처리
	 
  //2.데이터 받기
	 
  //3.DB연결
	 
  //4.Insert 실행
	 
  //5.응답구성
	 
	 
	 
  request.setCharacterEncoding("UTF-8");
  
  response.setContentType("text/html;charset=UTF-8"); //클라언트에게 전달한 페이지의 정보 구성
  PrintWriter out = response.getWriter();
  
  String id = request.getParameter("id");
  String email = request.getParameter("email");
  String content = request.getParameter("memo");
  //out.print(id + "," + email + "," + memo);
  
  
  try{
	  	MemoDao dao = new MemoDao();
	  	int n =dao.insertMemo(new Memo(id,email,content));
   
   if(n>0){
	    out.print("<script>");
     	out.print("alert('등록성공..');");
     	out.print("location.href='MemoList';");  //jsp  >>   /MemoList
     	//주소창에 입력 enter (F5) 요청
     	//localhost:8090/WebServlet_3/MemoList
     	out.print("</script>");
   }else{ //insert 에서 현실적으로 경우 ...
	    out.print("<script>");
	    out.print("alert('등록실패..');");
	    out.print("location.href='memo.html';");
	    out.print("</script>");
   }
   
   	 
  }catch(Exception e){
	  out.print("<b> 오류 :" +  e.getMessage()  + "</b>");
   
  }
  
  
     
  
  
 }
 
}
