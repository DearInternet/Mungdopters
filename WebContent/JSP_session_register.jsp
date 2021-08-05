<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>

<% request.setCharacterEncoding("UTF-8"); %>
 
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<% 
	request.setCharacterEncoding("UTF-8");
	String reg_name = request.getParameter("myname");	
	String reg_id = request.getParameter("myid");
	String reg_pw = request.getParameter("mypw");
	int reg_pw_question = Integer.parseInt(request.getParameter("pwhint"));
	String reg_pw_answer = request.getParameter("pwanswer");
	String reg_email = null;
	if(request.getParameter("emailaddr")==""){
		reg_email = request.getParameter("myemail")+"@"+request.getParameter("email_dns");
	} 
	else{
		reg_email = request.getParameter("myemail")+"@"+request.getParameter("emailaddr");
	}
	String reg_address = request.getParameter("zipcode");
	String reg_phone = request.getParameter("cel1")+request.getParameter("cel2")+request.getParameter("cel3");
	String reg_phone_mobile = request.getParameter("tel1")+request.getParameter("tel2")+request.getParameter("tel3");
	int reg_receive = Integer.parseInt(request.getParameter("chk_mail"));
	int result = 0;

	Connection conn = null;
	Statement stmt = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=UTF-8", "root", "9697aa");
		if(conn == null)
			throw new Exception("데이터베이스 'Portfolio'에 연결할 수 없습니다.<br>");
		stmt = conn.createStatement();	


		result = stmt.executeUpdate("insert into member (m_name, m_id, m_pw, m_pw_question, m_pw_answer, m_email, m_address, m_phone, m_phone_mobile, m_receive) values ('"+reg_name+"', '"+reg_id+"', '"+reg_pw+"', '"+reg_pw_question+"', '"+reg_pw_answer+"', '"+reg_email+"', '"+reg_address+"', '"+reg_phone+"', '"+reg_phone_mobile+"', '"+reg_receive+"');");

	}finally{
	try{
	stmt.close();
	} catch (Exception ignored){}
	}


	response.sendRedirect("Myhomepage.jsp");
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
