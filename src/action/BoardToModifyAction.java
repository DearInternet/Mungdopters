package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDetailService;
import svc.BoardModifyService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardToModifyAction implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		   	
			int b_ask_num=Integer.parseInt(request.getParameter("b_ask_num"));
			String page = request.getParameter("page");
			BoardDetailService boardDetailService = new BoardDetailService();
			BoardBean article = boardDetailService.getArticle(b_ask_num);
			ActionForward forward = new ActionForward();
		   	request.setAttribute("article", article);
		   	request.setAttribute("page", page);
		   	request.setAttribute("b_ask_num", b_ask_num);
	   		forward.setPath("/board/board_ask_Modify.jsp");
	   		return forward;

		 }

}