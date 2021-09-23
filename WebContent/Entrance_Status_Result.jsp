<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entrance.Entrance_Request_Status_DTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="entranceidcheck" class="entrance.Entrance_Request_Status_DAO"/>

<% 
	request.setCharacterEncoding("UTF-8");
	String m_id = request.getParameter("userid_entrance_status");

	
	ArrayList<Entrance_Request_Status_DTO> result = entranceidcheck.select(m_id);
	out.println(result.get(0).getS_status());
			
%> 