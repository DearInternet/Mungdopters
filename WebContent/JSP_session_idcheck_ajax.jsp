<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>

<% request.setCharacterEncoding("UTF-8"); %>
 
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<% 
	request.setCharacterEncoding("UTF-8");
	String reg_id = request.getParameter("myid");
	String id_check = null;
	Connection conn = null;
	Statement stmt = null;
	Boolean check_result = false;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=UTF-8", "root", "9697aa");
		if(conn == null)
			throw new Exception("데이터베이스 'Portfolio'에 연결할 수 없습니다.<br>");
		stmt = conn.createStatement();	
	
	
		ResultSet rs = null;
		rs = stmt.executeQuery("select m_id from member where m_id = '"+reg_id+"';");

		if(rs.next()){
			id_check = rs.getString("m_id");
		}

		if(id_check != null){
			check_result = true;
			request.setAttribute("check_result",check_result);
			out.println("중복된 아이디입니다");
		}
		else {
			check_result = false;
			request.setAttribute("check_result",check_result);
			out.println(reg_id+"는 사용 가능한 아이디입니다. 사용하시겠습니까?");
			out.println("<input type='button' value='test' id='use_btn' class='buttons'>");
		}
	}finally{
	try{
	stmt.close();
	} catch (Exception ignored){}
	}


%>