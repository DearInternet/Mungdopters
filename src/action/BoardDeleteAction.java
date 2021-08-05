package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDeleteService;
import vo.ActionForward;

public class BoardDeleteAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward forward = null;
		int b_ask_num=Integer.parseInt(request.getParameter("b_ask_num"));
		BoardDeleteService boardDeleteService = new BoardDeleteService();
			
			boolean isDeleteSuccess = boardDeleteService.removeArticle(b_ask_num);

			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('삭제실패');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("board_ask_List.mdts");
			}



		return forward;
	}

}