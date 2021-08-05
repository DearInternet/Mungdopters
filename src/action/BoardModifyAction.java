package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardModifyService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		ActionForward forward = null;
		boolean isModifySuccess = false;
		int b_ask_num=Integer.parseInt(request.getParameter("b_ask_num"));
		String page = request.getParameter("page");
		BoardBean article=new BoardBean();
		BoardModifyService boardModifyService = new BoardModifyService();

			article.setB_ask_number(b_ask_num);
			article.setB_ask_title(request.getParameter("b_ask_title"));
			article.setB_ask_content(request.getParameter("b_ask_content")); 
			isModifySuccess = boardModifyService.modifyArticle(article);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				forward = new ActionForward();
				request.setAttribute("page", page);
				forward.setPath("board_ask_Detail.mdts?b_ask_num="+article.getB_ask_number()); 
			}


		return forward;
	}

}