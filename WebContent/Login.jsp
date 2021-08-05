<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>

	<head>
		<title> Mungdopters에 오신것을 환영합니다. </title>
	</head>

	<style>
	*{margin: 0}

	#login{
		width: 600px;
		height: 400px;
	}

	#login_image_div{
		float: left;
		width: 300px;
		height: 400px;
	}

	#login_context{
		background-color: #DAF0F3;
		float: right;
		width: 299px;
		height: 400px;
	}

	@font-face {
     src:url("./addition/BinggraeMelona-Bold.ttf");
     font-family:"Melon";
	}
	</style>

	<body>


		<div id="login">
			<div id="login_image_div">
				<img src="./addition/dog_login.jpg" id="login_image">
			</div>
			<div id="login_context">
				<img src="./addition/paperplane.png" style="width: 50px; height: 50px;">
				<p style="font-family: Melon;">Mungdopters에 오신것을 환영합니다.</p>
				<br>
				<br>
				<form action="JSP_session_login2.jsp" method=post>
					아이디 : <input type="text" name="mungid"> <br>
					패스워드 : <input type="password" name="mungpw"> <br>
					<input type="submit" value="확인">
				</form>
			</div>
		<div>
	</body>

</html>
