package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;

public class MemoEditOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
    	String id = request.getParameter("id");
    	String email = request.getParameter("email");
    	String content = request.getParameter("memo");
    	
    	//memo m = new memo();  //권장사항
    	//m.setId(id);
    	
    	memodao dao = new memodao(); //POINT
    	memo m = new memo();
    	m.setId(id);
    	m.setEmail(email);
    	m.setContent(content);
		int result = dao.updateMemo(m);
    	
		 	String msg="";
		 	String url="";
		    if(result > 0){
		    	msg ="수정성공";
		    	url ="MemoView.memo?id="+id;
		    }else{
		    	msg="수정실패";
		    	url="memo.html";
		    }
		    
		    request.setAttribute("board_msg",msg);
		    request.setAttribute("board_url", url);
		
		    ActionForward forward = new ActionForward();
		    forward.setRedirect(false);
		    forward.setPath("/WEB-INF/views/redirect.jsp");
		    
		return forward;
	}

}





