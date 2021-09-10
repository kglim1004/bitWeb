package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.RegisterDao;
import kr.or.bit.dto.RegisterDto;


//ok.do , regiseter.do ....
@WebServlet("*.do")
public class RegisterFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public RegisterFrontController() {
        super();
      
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//@WebServlet("*.do")
    	//목록보기   : list.do
    	//글쓰기    : write.do
    	//글쓰기완료 : writeok.do
    	
    	//서비스판단 
    	//판단      1. command 방식 :  servlet.do?cmd=login&id=kglim&pwd=1004   > cmd > if(cmd.equals("login"))
        //         2. url 방식 :      login.do?id=kglim&pwd=1004  :  login.do > url 주소로 
    	
    	
    	//웹에서 요청 2가지
    	//1. 저 화면 주세요 (회원가입) >> 전달
    	//2. 처리 해주세요 (회원가입)  >> 로직 (DB)
    	
    	
    	
    	//http://localhost:8090/WebServlet_7_Member_Model2_Mvc_Command/register.do?cmd=register
    	//1
    	request.setCharacterEncoding("UTF-8");
    	
    	//2
    	//String command = request.getParameter("cmd");
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String urlcommand = requestURI.substring(contextPath.length());
    	
    	System.out.println("requestURI : " + requestURI);
    	System.out.println("contextPath : " + contextPath);
    	System.out.println("urlcommand : " + urlcommand);
    	
    	
    	//requestURI : /WebServlet_8_Member_Model2_Mvc_Url/register.do
    	//contextPath : /WebServlet_8_Member_Model2_Mvc_Url
    	//urlcommand : /register.do   >> 나온 값이 판단 근거
    	
        //http://localhost:8090/WebServlet_8_Member_Model2_Mvc_Url/registerok.do
    	
 
    	String viewpage="";
    	if(urlcommand.equals("/register.do")) {  
    		//화면단 전달
    		viewpage = "/WEB-INF/Register/Register.jsp";
    	}else if(urlcommand.equals("/registerok.do")) { //
    		//로직 처리
    		//회원가입 데이터 받아서 DB연결 insert .....
    		RegisterDao  dao = new RegisterDao();
    		RegisterDto dto = new RegisterDto();
    		dto.setId(Integer.parseInt(request.getParameter("id")));
    		dto.setPwd(request.getParameter("pwd"));
    		dto.setEmail(request.getParameter("email"));
    		
    		
    		System.out.println("data : " + dto.toString());
    		
    		int result = dao.writeOk(dto);
    		
    		String resultdata="";
    		if(result > 0) {
    			resultdata = "welcome to bit" + dto.getId() + "님";
    		}else {
    			resultdata = "insert fail retry";
    		}
    		
    		//
    		request.setAttribute("data", resultdata);
     		viewpage = "/WEB-INF/Register/Register_welcome.jsp";
    	}
    	
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	dis.forward(request, response);

	}
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
