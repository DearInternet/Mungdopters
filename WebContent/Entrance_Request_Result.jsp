<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entrance.Entrance_Request_Ready_DTO" %>
<%@ page import="entrance.Entrance_Request_Status_DTO" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<jsp:useBean id="entranceid" class="entrance.Entrance_Request_Ready_DAO"/>
<jsp:useBean id="entranceidcheck" class="entrance.Entrance_Request_Status_DAO"/>
<% request.setCharacterEncoding("UTF-8"); %>
 
<div id="header">
            <jsp:include page="MyhomepageHeader.jsp"></jsp:include>
</div>
<% 
	String realFolder="";
	String saveFolder="/Entrance_Upload";
	int fileSize=5*1024*1024;
	ServletContext context = request.getServletContext();
	realFolder=context.getRealPath(saveFolder);   		
	MultipartRequest multi=new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
	request.setCharacterEncoding("UTF-8");

	/* 
			0 - 아이디 userid
			1 - 견종 dogbreed
			2 - 이름 dogname
			3 - 성별 dogsex
			4 - 나이 dogage
			5 - 중성화여부 dogneutralize
			6 - 사진 dogimage
			7 - 추가사항 dogaddition
	*/
	
	entranceid.insert(multi.getParameter("userid"),
			multi.getParameter("dogbreed"),
			multi.getParameter("dogname"),
			multi.getParameter("dogsex"),
			Integer.parseInt(multi.getParameter("dogage")),
			multi.getParameter("dogneutralize"),
			multi.getOriginalFileName((String)multi.getFileNames().nextElement()),
			multi.getParameter("dogaddition"));
	
	entranceidcheck.insert(multi.getParameter("userid"), 1);
	
	out.println("<script>");
	out.println("alert('등록이 완료되었습니다');");
	out.println("location.href='./Myhomepage.jsp';");
	out.println("</script>");
%> 