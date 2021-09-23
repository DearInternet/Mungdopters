<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entrance.Entrance_Admin_Details_DTO" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="entranceid" class="entrance.Entrance_Admin_Details_DAO"/>


<%
	request.setCharacterEncoding("UTF-8"); 
	String[] data = request.getParameterValues("array_data");
	
	/* 
	0 - 승인거절 Accept OR Deny
	1 - 아이디  m_id
	*/

	if(data[0].equals("Accept")){
		entranceid.StatusCountUpdate(data[1], 3);
		out.println("accept");
	}
	else if(data[0].equals("Deny")){
		out.println("denied");
	}
%> 