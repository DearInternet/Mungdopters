<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("UTF-8");
	String userid = (String)session.getAttribute("ID");
	Boolean islogin = (Boolean)session.getAttribute("islogin");
%>



<html>
<meta charset="utf-8">

	<head>
		<title>Header</title>
	</head>

 	<!-- AOS -->

	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	 <!-- JQuery -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	
	<script>
	
	

		$(document).ready(function(){
			AOS.init();
    			$(".nav_main_div ul li").hover(function(){
     				$(this).find("ul").stop().fadeToggle(300);
    			});


		$('.nav_main_goes1').hover(function(){
			$('.temp1start').append("<div class='temp1' data-aos='zoom-in' style='width: 110px; height: 3px; background-color: #FCCEE2; position: absolute; z-index:200;'</div>");
			},function(){
				$(".temp1").remove(); 
			});		

		$('.nav_main_goes2').hover(function(){
			$('.temp2start').append("<div class='temp2' data-aos='zoom-in' style='width: 110px; height: 3px; background-color: #FDB7BA; position: absolute; z-index:200;'</div>");
			},function(){
				$(".temp2").remove(); 
			});	

		$('.nav_main_goes3').hover(function(){
			$('.temp3start').append("<div class='temp3' data-aos='zoom-in' style='width: 110px; height: 3px; background-color: #FC7399; position: absolute; z-index:200;'</div>");
			},function(){
				$(".temp3").remove(); 
			});	

		$('.nav_main_goes4').hover(function(){
			$('.temp4start').append("<div class='temp4' data-aos='zoom-in' style='width: 110px; height: 3px; background-color: #EE4A5D; position: absolute; z-index:200;'</div>");
			},function(){
				$(".temp4").remove(); 
			});	

		$('.nav_main_goes5').hover(function(){
			$('.temp5start').append("<div class='temp5' data-aos='zoom-in' style='width: 110px; height: 3px; background-color: #BEEBFD; position: absolute; z-index:200;'</div>");
			},function(){
				$(".temp5").remove(); 
			});	

		$('.nav_main_goes6').hover(function(){
			$('.temp6start').append("<div class='temp6' data-aos='zoom-in' style='width: 110px; height: 3px; background-color: #A9A0FC; position: absolute; z-index:200;'</div>");
			},function(){
				$(".temp6").remove(); 
			});	

		$('.nav_main_goes7').hover(function(){
			$('.temp7start').append("<div class='temp7' data-aos='zoom-in' style='width: 110px; height: 3px; background-color: #AFCB3D; position: absolute; z-index:200;'</div>");
			},function(){
				$(".temp7").remove(); 
			});	

		$('.nav_main_goes8').hover(function(){
			$('.temp8start').append("<div class='temp8' data-aos='zoom-in' style='width: 110px; height: 3px; background-color: #D3C0D3; position: absolute; z-index:200;'</div>");
			},function(){
				$(".temp8").remove(); 
			});	


		})



	</script>

	<style>
	*{margin: 0}

	@font-face {
     src:url("./addition/BinggraeMelona-Bold.ttf");
     font-family:"Melon";
	}



		.hiddenlists {
		}

		div.header_default{
			width: 100%;
			height: 150px;
			border-bottom-style: solid;
			position: relative;
			background-color: #F1F1F1;
		}

		div.header_default_mainlogo{
			float: left;
			margin-left: 150px;
		}

		div.nav_sub_1_div{
			width: 500px;
			height: 50px;
			float: right;
			margin-right: 150px;

		}

		.nav_sub_1{
			list-style-type: none;
			padding: 0;
			float: right;
		}

		.nav_sub_1 a{
			text-decoration: none;
			color: black;
		}

		.nav_sub_1 > li {
			text-align: center;
			font-family: "Melon";
			vertical-align: middle;
			display: inline-block;	
			width: 110px;
			height: 50px;
			color: black;
			float: right;
			margin-right: 5px;
		}

		
		
		div.nav_main_div{
			width: 1000px;
			height: 50px;
			float: right;
			clear: right;
			margin-right: 150px;
			margin-top: 50px;
			position: absolute;
			right: 0%;
			bottom: 0%;
		}

		ul.nav_main{
			font-family: "Melon";
			background-color: #CAA6FE;
			padding: 0;
		}

		ul.nav_main li{
			text-align: center;
		}

		ul.nav_main .nav_main_goes1{
			width: 110px;
			float: right;
			margin-right: 5px;
		}

		ul.nav_main .nav_main_goes2{
			width: 110px;
			float: right;
			margin-right: 5px;
		}

		ul.nav_main .nav_main_goes3{
			width: 110px;
			float: right;
			margin-right: 5px;
		}

		ul.nav_main .nav_main_goes4{
			width: 110px;
			float: right;
			margin-right: 5px;
		}

		ul.nav_main .nav_main_goes5{
			width: 110px;
			float: right;
			margin-right: 5px;
		}

		ul.nav_main .nav_main_goes6{
			width: 110px;
			float: right;
			margin-right: 5px;
		}

		ul.nav_main .nav_main_goes7{
			width: 110px;
			float: right;
			margin-right: 5px;
		}

		ul.nav_main .nav_main_goes8{
			width: 110px;
			float: right;
		}

		div.nav_main_div ul ul {
			z-index: 100;
			position: absolute;
			display: none;
			padding: 0;
		} /* div??? ul??? li1 - ???????????? li2 - ???????????? , li1??? ul1  ????????????*/

		div.nav_main_div ul ul li {
			display: block;
			background-color: lightyellow;
			opacity: 0.8;
		}
		/* ?????????a ?????????b???.. */

		div.nav_main_div ul li{
			display: inline-block; 
		}
		/* ?????? ????????? */

		div.nav_main_div a{
			display: block; width: 110px; height: 50px; color: black; line-height: 43px;
       		text-decoration: none;
    		}


	</style>

	<body>

		<div class="header_default">

			<div class="header_default_mainlogo">
				<img src="./addition/logos.png" width="300px" height="150px" data-aos='zoom-in-up' data-aos-duration='3000' onclick="tohome()">
			</div>

			<div class="nav_sub_1_div">
				<ul class="nav_sub_1" id="navsub">
					<li data-aos='fade-up' data-aos-duration='3000' data-aos-delay="0" style='margin-right: 0px; line-height: 3em;' id="Homebtn">Home</li>
					<li data-aos='fade-up' data-aos-duration='3000' data-aos-delay="400" style=' line-height: 3em;' id = "Loginbtn"><a href="javascript:popup()" target = "_parent">Login</a></li>
					<li data-aos='fade-up' data-aos-duration='3000' data-aos-delay="800" style=' line-height: 3em;' id="Registerbtn"><a href="./Register.jsp">Register</a></li>
				</ul>
			</div>

			<div class="nav_main_div">

				<ul class="nav_main">
					<li class='nav_main_goes8'>
						<a href="#">?????? ??????</a>
						<div class="temp8start"></div>	
						<ul style='margin-right: 0px; line-height: 3em;'>
							<li><a href="#">?????? ??????</a></li>
							<li><a href="#">????????????</a></li>						
						</ul>
					</li>

					<li class='nav_main_goes7'>
						<a href="#">????????????</a>
						<div class="temp7start"></div>	
						<ul style='margin-right: 0px; line-height: 3em;'>
							<li><a href="./Mall.jsp">????????????</a></li>
							<li><a href="#">????????????</a></li>	
							<li><a href="#">????????????</a></li>												
						</ul>
					</li>

					<li class='nav_main_goes6'>
						<a href="#">????????????</a>
						<div class="temp6start"></div>	
						<ul style=' line-height: 3em;'>
							<li><a href="#">????????????A</a></li>
							<li><a href="#">????????????B</a></li>	
							<li><a href="#">????????? ?????? A</a></li>
							<li><a href="#">????????? ?????? B</a></li>			
						</ul>
					</li>

					<li class='nav_main_goes5'>
						<a href="#">????????????</a>
						<div class="temp5start"></div>	
						<ul style=' line-height: 3em;'>
							<li><a href="#">?????? ?????????</a></li>
							<li><a href="#">?????? ?????????</a></li>	
							<li><a href="board_ask_List.mdts">?????? ????????? A</a></li>
							<!--  a????????? ???????????? Controller?????? doGet????????? ?????? -->
							<!--  request.getContextPath()?????? ???????????? ????????????. 1. PortfolioReply Eclipse WebProjectSettings?????? ????????? 2.Servers???????????? Path?????????. -->
							<li><a href="#">?????? ?????????</a></li>	
						</ul>
					</li>

					<li class='nav_main_goes4'>
						<a href="#">????????????</a>
						<div class="temp4start"></div>	
						<ul style=' line-height: 3em;'>
							<li><a href="#">????????????</a></li>
							<li><a href="#">?????? ????????????</a></li>	
						</ul>
					</li>

					<li class='nav_main_goes3'>
						<a href="#">??????</a>
						<div class="temp3start"></div>	
						<ul style=' line-height: 3em;'>
							<li><a href="#">???????????????</a></li>
							<li><a href="./Adopt_Wait.jsp">?????? ??????</a></li>	
							<li><a href="#">?????? ????????????</a></li>
							<li><a href="#">?????? ??????</a></li>
							<li class="hiddenlists"><a href="#">?????? ??????</a></li>
						</ul>
					</li>

					<li class='nav_main_goes2'>
						<a href="#">??????</a>
						<div class="temp2start"></div>	
						<ul style=' line-height: 3em;'>
							<li><a href="./Entrance_Info.jsp">?????? ??????</a></li>
							<li><a href="./Entrance_Request.jsp">?????? ??????</a></li>	
							<li><a href="./Entrance_Status.jsp">?????? ????????????</a></li>
							<li class="hiddenlists"><a href="Entrance_Admin.mdts">?????? ??????</a></li>
						</ul>
					</li>

					<li class='nav_main_goes1'>
						<a href="#">?????? ??????</a>
						<div class="temp1start"></div>						
						<ul style=' line-height: 3em;'>
							<li><a href="./Aboutus.jsp">???????????? ??????</a></li>
							<li><a href="./Board.jsp">????????????</a></li>
						</ul>
					</li>
				</ul>				
			</div>			

		</div>




	</body>
<script>

var userid = "<%= userid %>" ;
var islogin = "<%= islogin %>" ;

	$(document).ready(function(){
		
		$('.hiddenlists').hide();
		
		
		if(islogin === 'true' && userid === 'admin'){
		$('.hiddenlists').show();
		} else {}
		
	})


	function popup(){
		var url = "./Login.jsp";
		var name = "popup test";
		var option = "width = 601, height = 401, top = 0, left = 0";
		window.open(url, name, option);
	}

	function loggingout(){
		var logouturl = "./JSP_session_logout.jsp";
		var logoutname = "logout test";
		var logoutoption = "";
		window.open(logouturl, logoutname, logoutoption);
	}

	function tohome(){
		location.href="./Myhomepage.jsp"
	}

	if(islogin === 'true'){
		document.getElementById('Registerbtn').remove();
		document.getElementById('Loginbtn').remove();
		var navSsub = document.getElementById('navsub');
		var loginstatus = document.createElement('li');
		var logout = document.createElement('li');
		var logoutlink = document.createElement('a');
		loginstatus.innerHTML=userid+"??? ???????????????!!";
		loginstatus.style.width = 250+"px";
		loginstatus.style.lineHeight = 3+"em";
		logout.style.width = 110+"px";
		logout.style.lineHeight = 3+"em";
		logoutlink.setAttribute('href', 'javascript:loggingout()');
		logoutlink.innerHTML="????????????";
		logout.appendChild(logoutlink);
		navSsub.appendChild(logout);
		navSsub.appendChild(loginstatus);

	}else{}
	

</script>	
</html>