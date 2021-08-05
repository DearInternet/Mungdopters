<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>

<% request.setCharacterEncoding("UTF-8"); %>
 
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<% 
	request.setCharacterEncoding("UTF-8");
	String realid = request.getParameter("mungid");
	String realpassword = request.getParameter("mungpw");
	Boolean islogin_result = false;
	session.setAttribute("ID",realid);
	session.setAttribute("PASSWORD",realpassword);
	Boolean checklogin = false;

	String m_id = null;
	String m_pw = null;

	Connection conn = null;
	Statement stmt = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=UTF-8", "root", "9697aa");
		if(conn == null)
			throw new Exception("데이터베이스 'Portfolio'에 연결할 수 없습니다.<br>");
		stmt = conn.createStatement();	
	
	
		ResultSet rs = null;
		rs = stmt.executeQuery("select m_id, m_pw from member where m_id = '"+realid+"' and m_pw = '"+realpassword+"';");

		if(rs.next()){
			m_id = rs.getString("m_id");
			m_pw = rs.getString("m_pw");
		}

		if(m_id != null && m_pw != null){
			islogin_result = true;
			session.setAttribute("islogin",islogin_result);	
			checklogin = true;		
		}
		else {
			islogin_result = false;
			session.setAttribute("islogin",islogin_result);	
			session.removeAttribute("ID");
			session.removeAttribute("PASSWORD");
			checklogin = false;
		}
	}finally{
	try{
	stmt.close();
	} catch (Exception ignored){}
	}


%>
<script>
var check = <%=checklogin%>;

if (check === false) {
	alert("아이디 혹은 비밀번호를 다시 확인해주세요!");
}
else{}

setTimeout(function() {
    opener.location.reload();
    self.close();
    }, 100);	


</script>





<html>

	<head>
		<title></title>
	</head>

	<body>
	</body>

</html>
