<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mypacks.DTO" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="beanfix" class="mypacks.Announce_DAO"/>

<% 
	ArrayList<DTO> sel = beanfix.select();

	String title = request.getParameter("board_title");
	String photo = request.getParameter("board_photo");
	String content = request.getParameter("board_content");
	int num = sel.get(Integer.parseInt(request.getParameter("board_num"))).getB_announce_number();

	beanfix.update(title, photo, content, num);
	response.sendRedirect("./Board_Content.jsp?contentnum="+request.getParameter("board_num"));
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
