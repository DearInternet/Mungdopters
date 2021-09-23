<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="adopt.Adopt_Wait_DTO" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="adopt" class="adopt.Adopt_Wait_DAO"/>
<% response.setContentType("text/html;charset=UTF-8"); %>

<!DOCTYPE html>
<%
    String userid = (String)session.getAttribute("ID");
    Boolean islogin = (Boolean)session.getAttribute("islogin");
    int pagenum;
    if(request.getParameter("pagenum")==null){
    	pagenum = 1;
    } else {
    	pagenum = Integer.parseInt(request.getParameter("pagenum"));
    }
    ArrayList<Adopt_Wait_DTO> data = adopt.selectquantity((pagenum-1)*12, 12);
    
	if(data.size()<12){
		Adopt_Wait_DTO dtobj;
		int datasize = data.size();
		for(int i=0 ; i<12-datasize ; i++){
			dtobj = new Adopt_Wait_DTO();
			dtobj.setD_info_name("정보가 없습니다");
			dtobj.setD_info_photo("none.png");
			data.add(dtobj);
		}
	}
%>






<meta charset="UTF-8">

<html>

<head>

  <title>Adopt_Wait</title>

</head>

<style>


*{
  padding: 0;
  margin: 0;
}  


#intro{
  text-align: center;
  margin: 0 auto;
  margin-top: 100px;
  margin-bottom: 100px;
  width: 1500px;
  height:  50px;
  font-family: "Melon";
  font-size:25pt;
}

#main {
  margin: 0 auto;
  width: 1500px;
  height: 1300px;
}
.box {
 float: left;
 width: 250px;
 height: 350px;
 margin-left: 100px;
 margin-bottom: 30px;

}

.boxright{
  float: right;
  width: 250px;
  height: 350px;
  margin-right: 100px;
  margin-bottom: 30px;
}
.card {
  text-align: center;
  width: 100%;
  height: 100%;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  position: relative;
}

.moreinfo {
  position: absolute;
  bottom: 2.8%;
  left: 2.5%;
  width: 95%;
  height: 10%;
  background-color: #ddffff;
  opacity: 0.8;
}

.images{
  width: 95%;
  height: 95%;
  margin-top: 2.5%;

}

.heart{
	width:15px; 
	height:15px; 
	position:absolute;
	top:3px;
	right:5px;
}

.hoverbtn{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:1em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.hoverbtn:hover{
  background:#fff;
  color:#1AAB8A;
}
.hoverbtn:before,.hoverbtn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
.hoverbtn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.hoverbtn:hover:before,.hoverbtn:hover:after{
  width:100%;
  transition:800ms ease all;
}

.marginbottom{
  margin-top: 50px;
  margin-bottom: 50px;
}

ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
a {text-decoration:none;}

.quickmenu {position:absolute;width:90px;top:50%;margin-top:-50px;right:10px;background:#fff;}
.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
.quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
.quickmenu ul li a {position:relative;float:left;width:100%;height:30px;line-height:30px;text-align:center;color:#999;font-size:9.5pt;}
.quickmenu ul li a:hover {color:#000;}
.quickmenu ul li:last-child {border-bottom:0;}

.content {position:relative;min-height:1000px;}
</style>

<body>
  <div id="header">
    <jsp:include page="./MyhomepageHeader.jsp"></jsp:include>
  </div>


  <div id="intro">
    미니펫 전체보기
    <br>
   View All

  </div>
  <div id="main">
<div class="quickmenu"> 
	<ul> 
		<li><a href="./Adopt_Wait_Cookie.jsp">애견 즐겨찾기</a></li>
		<li><a href="#">입소 신청</a></li>
		<li><a href="#">1:1문의</a></li>
	</ul>
</div>
		<%
			for (int x = 0; x < 3; x++) {
				char quote = '"';
				out.println("<div class='boxes'>");
				for (int y = 0; y < 2; y++) {
					out.println("<div class='box'>");
					out.println("<div class='card'>");
					out.println("<img src='"); %>
					${pageContext.request.contextPath}/Entrance_Upload/
					<%
					out.println(data.get(y+x*2).getD_info_photo()+"'");
					out.println("class='images'>");
					out.println("<div class='moreinfo'>");%>
					<%
					out.println(data.get(y+x*2).getD_info_name());
					out.println("<img src='./addition/heartno.png' class='heart' id="+quote+"heart"+(y+x*2)+quote+" onclick="+quote+"favoritedog("+(y+x*2)+")"+quote+">");
					out.println("</div>");
					out.println("</div>");
					out.println("</div>");
				}
				
				for (int z = 0; z < 2; z++) {
					out.println("<div class='boxright'>");
					out.println("<div class='card'>");
					out.println("<img src='"); %>
					${pageContext.request.contextPath}/Entrance_Upload/
					<%
					out.println(data.get(6+z+x*2).getD_info_photo()+"'");
					out.println("class='images'>");
					out.println("<div class='moreinfo'>");%>
					<%
					out.println(data.get(6+z+x*2).getD_info_name());
					out.println("<img src='./addition/heartno.png' class='heart' id="+quote+"heart"+(6+z+x*2)+quote+" onclick="+quote+"favoritedog("+(6+z+x*2)+")"+quote+">");
					out.println("</div>");
					out.println("</div>");
					out.println("</div>");
				}
				out.println("</div>");
			}
		%>


    <div id="numbering"></div>

  </div>
  <div id="footer">
    <jsp:include page="./MyhomepageFooter.jsp"></jsp:include>
  </div>
</body>

<script>


			function setCookie(name, value, exp) {
				var date = new Date();
				date.setTime(date.getTime() + exp*24*60*60*1000);
				document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
				};
				
			function getCookie(name) {
				var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
				return value? value[2] : null;
				};
			
			function deleteCookie(name) {
				var date = new Date();
				date.setDate(date.getDate()-100);
				document.cookie = name + '=; expires=' + date.toUTCString() + ';path=/';
				};

			function favoritedog(number){
				if($("#heart"+number).attr("src") == "./addition/heartno.png"){
					setCookie('dog'+number, number, 1);
					$("#heart"+number).attr("src", "./addition/heartyes.png");
				}
				else if($("#heart"+number).attr("src") == "./addition/heartyes.png"){
					deleteCookie('dog'+number);
					$("#heart"+number).attr("src", "./addition/heartno.png");
				}
			};
			

			$(document).ready(function(){ 
				var currentPosition = parseInt($(".quickmenu").css("top")); 
				
				$(window).scroll(function() { 
				var position = $(window).scrollTop(); 
				$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000); 
				}); 
				
				
				for(var a=0 ; a<13 ; a++){
					if(getCookie('dog'+a)){
						$("#heart"+a).attr("src", "./addition/heartyes.png");
					}
				}
				
			});		

</script>

</html>