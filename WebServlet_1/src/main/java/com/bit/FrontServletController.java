package com.bit;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(description = "여기는 설명을 하는 곳입니다", 
            urlPatterns = { "/action.do" })
public class FrontServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FrontServletController() {
        super();
       System.out.println("FrontServletController 최초 컴파일시 한번 호출 초기화");
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//192.168.0.57:8090/WebServlet_1/action.do?cmd=greeting
		System.out.println("GET");
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		
		//데이터 받기
		String cmd= request.getParameter("cmd");
		
		
		//판단하기
		String msg="";
		
		if(cmd.equals("greeting")) {
			Message m = new Message();
			msg = m.getMessage(cmd);
		}
		
		//데이터 저장하기
		request.setAttribute("msg", msg);
		
		//view page 정의하기
		RequestDispatcher dis = request.getRequestDispatcher("/greeting.jsp");
		
		//view forward를 통해 데이터 전달하기
		dis.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST");
	}

}
