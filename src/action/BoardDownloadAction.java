package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardDetailService;
import svc.BoardModifyService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardDownloadAction implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		 
			ActionForward forward = new ActionForward();
			String origin_file = request.getParameter("Original_File"); // Multipartrequest getoriginalfilename
			ServletContext context = request.getServletContext();
			String FolderPath = context.getRealPath("/board_ask_Uploadedfiles");
			String FilePath = FolderPath + "/" + origin_file;
			System.out.println("origin_file : " + origin_file);
			System.out.println("FolderPath : " + FolderPath);
			System.out.println("FilePath : " + FilePath);
	   		forward.setPath("blank");
	   		return forward;

		 }

}

/*
	String fileName = request.getParameter("file_name");

	String savePath = "newfolder";
	ServletContext context = getServletContext();
	String sDownloadPath = context.getRealPath(savePath);
	String sFilePath = sDownloadPath + "\\" + fileName;
	byte b[] = new byte[4096];
	FileInputStream in = new FileInputStream(sFilePath);
	String sMimeType = getServletContext().getMimeType(sFilePath);
	System.out.println("sMimeType>>>" + sMimeType);

	if (sMimeType == null)
		sMimeType = "application/octet-stream";
response.setContentType(sMimeType);
	String agent = request.getHeader("User-Agent");
	boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);

	if (ieBrowser) {
		fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
	} else {
		fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
	}

	response.setHeader("Content-Disposition", "attachment; filename= " + fileName);

	ServletOutputStream out2 = response.getOutputStream();
	int numRead;

	while ((numRead = in.read(b, 0, b.length)) != -1) {
		out2.write(b, 0, numRead);
	}
	out2.flush();
	out2.close();
	in.close();
%>
 */