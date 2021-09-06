package com;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/*
1. @WebServlet 어노테이션을 삭제
web.xml 을 통해서 설정작업 

jsp 배울떄는 웹 브라우져에서
http://192.168.0.57:8090/WebJSP/login.jsp 요청

현재 작업
http://192.168.0.57:8090/WebJSP/SimpleController.java 요청되는데 
이렇게 요청이 되지 않아요 

어떤 요청 주소를 별도로 생성하고 그 요청에 대해서 SimpleController 컴파일 되고 실해되고 만들어야 해요
web.xml에서 설정했어요
  <servlet>
  	<servlet-name>simplecontroller</servlet-name>
 	<servlet-class>com.SimpleController</servlet-class>
  </servlet>
  <servlet-mapping>
  	<servlet-name>simplecontroller</servlet-name>
  	<url-pattern>/simple</url-pattern>
  </servlet-mapping> 
실행되도록 ...... 
192.168.0.57:8090/WebServlet_1/simple 입력하면 >> com.SimpleController 자바 파일을 실행

설정방법
1. web.xml  다른 코드 해석 및 유지보수
2. @WebServlet 통해서 권장방법

[servlet (java 로 만든 웹 전용 파일)]
조건 : java 파일이 반드시 extends HttpServlet 상속 >> 웹 요청 처리 >> request 객체 , response 객체 사용
-servlet 은 url 에서 요청이 안되요 >> 요청 >> mapping 작업 >> 주소 요청 
-1.web.xml
-2.@WebServlet 가 있어요

--------------------------------------------------------------------------------------------
[동작방식]
servlet 은 [이벤트 기반]으로 동작합니다 : 
servelt 가지고 있는 [특정함수]는 [특정사건]이 발생하면(이벤트) 자동 호출

[특정함수]
protected void doGet
protected void doPost
특정 사건이 발생하면 자동 호출 

Client 요청
192.168.0.57:8090/WebServlet_1/simple?id=kglim&pwd=1004  : GET 방식 ... 자동 doGET 호출
1. <form method="GET"
2. <a href="/simple?num=1000"></a>


192.168.0.57:8090/WebServlet_1/simple : POST 방식 : 자동 doPOST 호출
1. <form method="POST"


doGET , doPOST 역할은 
데이터 받기 
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
-HttpServletRequest request = new HttpServletRequest();

HttpServletRequest request  JSP 사용했던 그 request

*/
public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SimpleController() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("클라이언트 요청 : GET");
		
		//1. 한글처리
		request.setCharacterEncoding("UTF-8");
		
		//2. 데이터 받기 (요청 의도 파악)
		String type= request.getParameter("type");
			
		
		//3. 로직 처리(요청에 따른 업무 수행) >> Service
		Object resultObj = null;
		if(type == null || type.equals("greeting")) {
			resultObj = "hello World";
		}else if(type.equals("date")) {
			resultObj = new Date();
		}else {
			resultObj = "invalid String  Type";
		}
		
			
		//4. 요청 완료에 따른 결과를 저장
		//MVC 패턴 방식 :
		//잘하는 것만 하세요
		//화면 : JSP , 서블릿에서 만든 어떤 정보를 JSP 전달
		//결과를 저장
		//1. session 변수 , 특정 페이지(include,forward) request 변수 사용
		request.setAttribute("result", resultObj);
		
		
		//5. 저장한 결과를 JSP 전달 (UI) 구성하도록
		//결과를 forward 방식을 사용 JSP 전달
		//요청한 주소는 변화가 없고 buffer 내용만 바꾸어서 전달하는 방식
		
		RequestDispatcher dis = request.getRequestDispatcher("/simpview.jsp");
		//view 페이지 정의
		
		//view 페이지에 출력할 데이터 전성
		dis.forward(request, response);
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("클라이언트 요청 : POST");
		
	}

}
