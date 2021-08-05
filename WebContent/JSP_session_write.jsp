<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mypacks.DTO" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="beanwrite" class="mypacks.Announce_DAO"/>

<% 
	
	String title = request.getParameter("board_title");
	String photo = request.getParameter("board_photo");
	String content = request.getParameter("board_content");
	String id = (String)session.getAttribute("ID");

	beanwrite.insert(id, title, photo, content);
	ArrayList<DTO> sendto = beanwrite.select();
	int lastindex = sendto.size()-1;
	response.sendRedirect("./Board_Content.jsp?contentnum="+lastindex);
%>


<script>

</script>

<html>

	<head>
		<title></title>
	</head>

	<body>
	</body>

</html>
