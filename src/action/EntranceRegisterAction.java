package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardReplyService;
import vo.ActionForward;
import vo.BoardBean;

public class EntranceRegisterAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(false);
		String userid = (String) session.getAttribute("ID");
		Boolean islogin = (Boolean) session.getAttribute("islogin");

		ActionForward forward = null;
		BoardBean article = new BoardBean();
		article.setB_ask_number(Integer.parseInt(request.getParameter("b_ask_num")));
		article.setM_id(userid);
		article.setB_ask_title(request.getParameter("b_ask_title"));
		article.setB_ask_content(request.getParameter("b_ask_content"));
		article.setB_ask_grpnum(Integer.parseInt(request.getParameter("b_ask_grpnum")));
		article.setB_ask_grplvl(Integer.parseInt(request.getParameter("b_ask_grplvl")));
		article.setB_ask_grpseq(Integer.parseInt(request.getParameter("b_ask_grpseq")));
		BoardReplyService boardReplyService = new BoardReplyService();
		boolean isReplySuccess = boardReplyService.replyArticle(article);

		if (isReplySuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("board_ask_List.mdts");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('덧글달기 실패')");
			out.println("history.back()");
			out.println("</script>");
		}

		return forward;

	}
}