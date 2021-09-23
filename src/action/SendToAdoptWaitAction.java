package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardModifyService;
import svc.SendToAdoptWaitService;
import vo.ActionForward;
import vo.BoardBean;

public class SendToAdoptWaitAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		ActionForward forward = null;
		boolean isSendingSuccess = false;
		adopt.Adopt_Wait_DTO article = new adopt.Adopt_Wait_DTO();
		

		
		SendToAdoptWaitService sendtoadoptwaitservice = new SendToAdoptWaitService();
			article.setD_info_type(request.getParameter("d_info_type"));
			article.setD_info_name(request.getParameter("d_info_name"));
			article.setD_info_sex(request.getParameter("d_info_sex"));
			article.setD_info_neutralize(request.getParameter("d_info_neutralize"));
			article.setD_info_age(Integer.parseInt(request.getParameter("d_info_age")));
			article.setD_info_photo(request.getParameter("d_info_photo"));


			isSendingSuccess = sendtoadoptwaitservice.sendArticle(article);

			if(!isSendingSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('전송실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("Entrance_Admin.mdts");
			}


		return forward;
	}

}