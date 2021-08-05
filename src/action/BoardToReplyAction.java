package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardDetailService;
import svc.BoardModifyService;
import svc.BoardToReplyService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardToReplyAction implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		 
		 	BoardBean article = new BoardBean();
		 	int b_ask_num = Integer.parseInt(request.getParameter("b_ask_num"));
			ActionForward forward = new ActionForward();
			BoardToReplyService boardToReplyService = new BoardToReplyService();
			article = boardToReplyService.getArticle(b_ask_num);
			request.setAttribute("article", article);
	   		forward.setPath("/board/board_ask_Reply.jsp");
	   		return forward;

		 }

}