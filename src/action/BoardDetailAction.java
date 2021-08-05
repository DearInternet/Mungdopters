package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDetailService;
import svc.BoardListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

 public class BoardDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		   	
			int b_ask_num=Integer.parseInt(request.getParameter("b_ask_num"));
			String page = request.getParameter("page"); 
			// 목록으로 가면 다시 페이지 보여줄예정
			BoardDetailService boardDetailService = new BoardDetailService();
			BoardBean article = boardDetailService.getArticle(b_ask_num);
			ActionForward forward = new ActionForward();
			request.setAttribute("page", page);
		   	request.setAttribute("article", article);
	   		forward.setPath("/board/board_ask_Detail.jsp");
	   		return forward;

		 }
	 
 }