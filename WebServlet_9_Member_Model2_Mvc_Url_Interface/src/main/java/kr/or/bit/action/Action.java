package kr.or.bit.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public ActionForward execute(HttpServletRequest request , HttpServletResponse response);
	
	//당신이 만약 Action 인터페이스 구현한다면 당신은 반드시 execute 함수를 재정의 해서 사용한다  (강제사용)
	
	//class a implements Action { execute(){ return new ActionForward(); } }
}
