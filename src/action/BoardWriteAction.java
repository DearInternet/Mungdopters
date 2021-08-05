package action;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ActionForward;
import vo.BoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardWriteService;

public class BoardWriteAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward forward=null;
		BoardBean boardBean = null;
		HttpSession session = request.getSession(false);
		String userid = (String)session.getAttribute("ID");
		Boolean islogin = (Boolean)session.getAttribute("islogin");
		
		boolean isWriteSuccess = false;
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		String Folder=context.getRealPath("/board_ask_Uploadedfiles");   
		

		
		if(islogin == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인을 해주세요')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			MultipartRequest multi=new MultipartRequest(request, Folder, fileSize, "UTF-8", new DefaultFileRenamePolicy()); 
			// MultipartRequest 객체 생성시 바로 파일 업로드.
			boardBean = new BoardBean();
			boardBean.setM_id(userid);
			boardBean.setB_ask_title(multi.getParameter("b_ask_title"));
			boardBean.setB_ask_content(multi.getParameter("b_ask_content"));
			boardBean.setB_ask_file(
			multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
			// multi.getOriginalFileName 사용자가 올린 파일명 반환
			// multi.getFilesystemName 중복될시 변경된 파일명 반환
			// multi.getFileNames 리턴타입 Enumeration 폼요소중 input type가 file인 파라미터의 이름들을 리턴. 없을시 빈 Enumeration반환
			BoardWriteService boardWriteService = new BoardWriteService();
			isWriteSuccess = boardWriteService.writeArticle(boardBean);
		}
		
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('업로드실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("board_ask_List.mdts");
		}

		return forward;
		
	}  	
	
}