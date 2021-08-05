<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<% 
	request.setCharacterEncoding("UTF-8");
	String realid = request.getParameter("mungid");
	String realpassword = request.getParameter("mungpw");
	session.removeAttribute("ID");
	session.removeAttribute("PASSWORD");
	session.removeAttribute("islogin");
%>

<script>
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
