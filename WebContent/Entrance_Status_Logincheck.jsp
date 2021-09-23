<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entrance.Entrance_Request_Status_DTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="entranceidcheck" class="entrance.Entrance_Request_Status_DAO"/>

<% 
	request.setCharacterEncoding("UTF-8");
	String m_id = request.getParameter("userid_entrance_check");

	
	ArrayList<Entrance_Request_Status_DTO> result = entranceidcheck.select(m_id);
	if (result.size() == 0){
		out.println("true");
	}
	else {
		out.println("false");
	}
			
%> 