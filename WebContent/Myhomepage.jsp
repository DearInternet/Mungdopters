<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>

<html>
<meta charset="utf-8">

	<head>
		<title>Welcome to Mungdopters</title>
	</head>

	 <!-- imageslider -->

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

 	<!-- AOS -->

	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	 <!-- JQuery -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<style>
		*{margin: 0}

		@font-face {
    		src:url("./addition/BinggraeMelona-Bold.ttf");
     		font-family:"Melon";
		}

		div.body_default{
			height: 1700px;
			width: 1603px;
			margin: 0 auto;
		}

		div.imageslider{
			width: 100%;
			height: 500px;
			float: left;
			margin-top: 40px;
			z-index: -100;
		}

		div.body_image_1{
			clear: left;
			float: left;
			margin-top: 40px;
			margin-left: 40px;
		}

		div.body_image_2{
			clear: left;
			float: right;
			margin-top: 40px;
			margin-right: 40px;
		}		

		div.body_text_1{
			width: 983px;
			height: 500px;
			background-color: #FDE7F2;
			float: right;
			margin-top: 40px;
			margin-right: 40px;			
			position: relative;
		}

		div.body_text_2{
			width: 983px;
			height: 500px;
			background-color: #E3F0FF;
			float: left;
			margin-top: 40px;
			margin-left: 40px;			
		}	

		div.body_text_title{
			width: 800px;
			height: 80px;
			border-bottom-style: solid;
			border-bottom-color: green;
			text-align: center;
			padding-top: 40px;
			font-size: 30pt;
			margin: 0 auto;		
			margin-top: 50px;
			font-family: "Melon";
		}	

		div.body_text_content{
			width: 800px;
			height: 200px;
			border-bottom-style: solid;
			border-bottom-color: green;
			text-align: center;
			padding-top: 40px;
			font-size: 12pt;
			margin: 0 auto;		
			font-family: "Melon";
		}	

		/* swiper */
	.swiper-container {
		border-top-width: 2px;	
		border-top-style: solid;
		border-top-color: #BA000C;
		z-index: 0;
		position: relative;
		width:1360px;
		height:550px;
		}
	.swiper-slide {
		position: relative;
		align-items:center; 
		justify-content:center;
	}
	.swiper-slide img {
	}


	</style>

	<body>
		<div id = "header">
			<jsp:include page="MyhomepageHeader.jsp"></jsp:include>
		</div>
			
		<div class="imageslider" data-aos='fade-right' data-aos-duration='3000' data-aos-delay="2800">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide"><img src="./addition/banner1.png"></div>
					<div class="swiper-slide"><img src="./addition/banner2.png"></div>
					<div class="swiper-slide"><img src="./addition/banner3.png"></div>				
				</div>
			</div>
		</div>

		<div class="body_default">

			<div class="body_image_1" data-aos='fade-right' data-aos-duration='3000' data-aos-delay="2800">
				<img src="./addition/dog_body_1.jpg">				
			</div>

			<div class="body_text_1" data-aos='fade-left' data-aos-duration='3000' data-aos-delay="2800" >

				<div class="body_text_title">
					강아지 입양을 원하시나요?				
				</div>

				<div class="body_text_content">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
					quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
					cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
					proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</div>

			</div>

			<div class="body_image_2">
				<img src="./addition/dog_body_2.jpg">				
			</div>

			<div class="body_text_2">

				<div class="body_text_title">
					강아지 입소를 원하시나요?				
				</div>

				<div class="body_text_content">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
					quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
					cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
					proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</div>

			</div>

		</div>

		<div id="footer">
			<jsp:include page="MyhomepageFooter.jsp"></jsp:include>
		</div>



	</body>

<script>
new Swiper('.swiper-container' , {autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      }, });
</script>	
</html>