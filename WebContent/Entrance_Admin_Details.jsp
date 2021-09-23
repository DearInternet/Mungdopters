<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entrance.Entrance_Admin_Details_DTO" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="entranceid" class="entrance.Entrance_Admin_Details_DAO"/>


<%
	request.setCharacterEncoding("UTF-8"); 
	String m_id = request.getParameter("m_id");
	ArrayList<Entrance_Admin_Details_DTO> addition = entranceid.select(m_id);
	entranceid.StatusCountUpdate(m_id, 2);
%>







<!DOCTYPE html>
<html>

	<head>
		<title> Mungdopters에 오신것을 환영합니다. </title>
	</head>
<style>

	@font-face {
     src:url("./addition/BinggraeMelona-Bold.ttf");
     font-family:"Melon";
	}
	
*{ margin:0; padding:0;}
body{ font:100% normal Arial, Helvetica, sans-serif; background:#161712;}
form,input,select,textarea{margin:0; padding:0; color:#ffffff;}

div.box {
width:500px;
background:#222222;
position:relative;
border:1px solid #262626;
}

div.box h1 { 
font-size:18px;
text-transform:uppercase;
padding:5px 0 5px 5px;
border-bottom:1px solid #161712;
border-top:1px solid #161712; 
}

div.box label {
width:100%;
display: block;
background:#1C1C1C;
border-top:1px solid #262626;
border-bottom:1px solid #161712;
padding:10px 0 10px 0;
}

div.box label span {
display: block;
color:#bbbbbb;
font-size:12px;
float:left;
width:100px;
text-align:right;
padding:5px 20px 0 0;
}

div.box .input_text {
padding:10px 10px;
width:200px;
background:#262626;
border-bottom: 1px double #171717;
border-top: 1px double #171717;
border-left:1px double #333333;
border-right:1px double #333333;
}

div.box .message{
padding:7px 7px;
width:350px;
background:#262626;
border-bottom: 1px double #171717;
border-top: 1px double #171717;
border-left:1px double #333333;
border-right:1px double #333333;
overflow:hidden;
height:150px;
}

div.box .button
{
margin:0 0 10px 0;
padding:4px 7px;
background:#CC0000;
border:0px;
position: relative;
top:10px;
left:382px;
width:100px;
border-bottom: 1px double #660000;
border-top: 1px double #660000;
border-left:1px double #FF0033;
border-right:1px double #FF0033;
}
</style>




	<body>


<form>
          <div class="box">
            <h1>세부 사항</h1>
            <label>
               <span>이름</span>
               <input type="text" class="input_text" name="name" id="name" value="<%= addition.get(0).getM_name() %>" disabled>
            </label>
             <label>
               <span>주소</span>
               <input type="text" class="input_text" name="email" id="email" value="<%= addition.get(0).getM_address() %>" disabled>
            </label>
             <label>
                <span>전화번호</span>
                <input type="text" class="input_text" name="subject" id="subject" value="<%= addition.get(0).getM_phone() %>" disabled>
            </label>
            <label>
                <span>추가 요청사항</span>
                <textarea class="message" name="feedback" id="feedback" disabled><%= addition.get(0).getR_addition() %></textarea>
                <input type="button" class="button" value="확인">
            </label>
            
            
         </div>
    </form>


	</body>

</html>
