package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.RegisterDao;
import kr.or.bit.dto.RegisterDto;

public class RegisterOkServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 회원가입 서비스
		
		RegisterDto dto = new RegisterDto();
		dto.setId(Integer.parseInt(request.getParameter("id")));
		dto.setPwd(request.getParameter("pwd"));
		dto.setEmail(request.getParameter("email"));
		
		RegisterDao  dao = new RegisterDao();
		int result = dao.writeOk(dto);
		
		String resultdata="";
		if(result > 0) {
			resultdata = "welcome to bit" + dto.getId() + "님";
		}else {
			resultdata = "insert fail retry";
		}
		
		//결과 저장하기
		request.setAttribute("data", resultdata);
 		
		//ActionForward
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/Register/Register_welcome.jsp");
	
		return forward;
	}

}
