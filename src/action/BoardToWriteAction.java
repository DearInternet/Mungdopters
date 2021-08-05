package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardDetailService;
import svc.BoardModifyService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardToWriteAction implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		 
			ActionForward forward = new ActionForward();
	   		forward.setPath("/board/board_ask_Write.jsp");
	   		return forward;

		 }

}