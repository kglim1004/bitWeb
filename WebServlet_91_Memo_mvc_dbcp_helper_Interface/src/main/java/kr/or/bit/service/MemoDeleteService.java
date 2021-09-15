package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;

public class MemoDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
    	String id = request.getParameter("id");
       	//memo m = new memo();  //권장사항
    	//m.setId(id);
    	
    	memodao dao = new memodao(); //POINT
		int result = dao.deleteMemo(id);
    	
		 	String msg="";
		 	String url="";
		    if(result > 0){
		    	msg ="삭제성공";
		    	url ="MemoList.memo";
		    }else{
		    	msg="삭제실패";
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






