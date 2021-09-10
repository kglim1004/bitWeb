package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.RegisterDao;
import kr.or.bit.dto.RegisterDto;
import kr.or.bit.service.LoginOkServiceAction;
import kr.or.bit.service.RegisterOkServiceAction;

@WebServlet("*.do")
public class RegisterFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public RegisterFrontController() {
        super();
      
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	/*
    	command 방식
		@WebServlet("/web.do")
		web.do?cmd=login
		web.do?cmd=loginok
		
		
		url 방식
		주소가 고정되어 있으면 안되요
		@WebServlet("*.do")
		login.do 처리
		loginok.do 처리
		
		*/
    	
    	
    	
    	//1. 처리 (요청)
    	//1.1 : 화면주세요
    	//1.2 : 처리해주세요 (업무적인 로직 : DB연결 ,암호화 ...)
    	
    	//2개를 표준화 , 공통적인 모습 만들면 ......
    	//Interface ... 강제 ...
    	//kr.or.bit.action >  ActionForward 클래스 , Action 인터페이스 
    	
    	//설계한 이유
    	//FrontController 가 너무 무거워요 (너무나 많은 일을) ... 줄여 주고 싶다
    	//요청 받기 > 판단하기 > [서비스 요청하기] > forward
    	
    	//서비스 클래스 탄생 >> 표준화 >> Action 인터페이스 구현 >> 요청 처리 개수만큼 >> 서비스 클래스 생성
    	
    	
    	//화면단 >> 서비스 클래스 생성 안해요
    	//처리단 >> 서비스 클래스 생성
    	
  
    	request.setCharacterEncoding("UTF-8");
      	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String urlcommand = requestURI.substring(contextPath.length());
    	
    	System.out.println("requestURI : " + requestURI);
    	System.out.println("contextPath : " + contextPath);
    	System.out.println("urlcommand : " + urlcommand);
    	
    	
    	ActionForward forward =null;
    	Action action = null;
    	
 
    	String viewpage="";
    	if(urlcommand.equals("/Register.do")) {  
    		//화면단 전달 (UI 만 >> 서비스 클래스 만들지 않는다)
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Register/Register.jsp");
    		
    	}else if(urlcommand.equals("/registerok.do")) { //
    		// UI 제공 + 처리 .... >> service 클래스에게
    		action = new RegisterOkServiceAction();
    		forward = action.execute(request, response); ////// KEY POINT (현재 페이지가 가지고 있는 request객체 주소 전달)
      
    	}else if(urlcommand.equals("/login.do")) {
      		//화면
      		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/login/login.jsp");
      
      	}else if(urlcommand.equals("/loginok.do")) {
      		
      		action = new LoginOkServiceAction();
    		forward = action.execute(request, response); ////// KEY POINT (현재 페이지가 가지고 있는 request객체 주소 전달)
      	}
    	
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true 페이지 재요청
    			response.sendRedirect(forward.getPath());
    		}else { //false
    			//1. UI + 로직
    			//2. UI 있는 경우
    			System.out.println("forward : " + forward.getPath());
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    	    	dis.forward(request, response);
    		}
    	}
    	
    	
    

	}
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
