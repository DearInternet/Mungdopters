<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mypacks.DTO" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="beandel" class="mypacks.Announce_DAO"/>

<% 
	int deletenumber = Integer.parseInt(request.getParameter("contentnumdelete"));
	beandel.delete(deletenumber);
	response.sendRedirect("./Board.jsp");
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
