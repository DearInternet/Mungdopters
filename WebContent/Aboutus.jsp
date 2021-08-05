<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<meta charset="UTF-8">

<html>

    <head>

        <title>Board_Content_Write</title>

    </head>
    
    <style type="text/css">
        
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
  height:  400px;
}

#main {
margin: 0 auto;
width: 1500px;
height: 600px;
}
        .box {
           float: left;
           width: 400px;
           height: 500px;
           margin-right: 50px;
           margin-left: 50px;
           margin-bottom: 16px;
        }
        .card {
          text-align: center;
          width: 100%;
          height: 100%;
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }

.images{
  width: 150px;
  height: 150px;
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
    </style>

    <body>
        <div id="header">
            <jsp:include page="./MyhomepageHeader.jsp"></jsp:include>
        </div>


        <div id="intro">
            <h1>
              Mungdopters
            </h1>
            <br>
            <br>
            <h3>
              “사람과 동물이 행복하게 공존하는 그날까지.”
            </h3>
            <br>
            <br>
            <hr width="30%" color= "red" style="margin: 0 auto;">
            <br>
            <br>
            <br>
            한국에서 발생하는 유기동물은 한해 약 130,000마리에 이르지만,<br>
            그중 약 1/4은 새로운 보호자를 만나지 못해 안락사되고 있습니다.<br>
            멍답터스는 ‘유기동물 안락사 제로, 입양 100%’실현을 위하여,<br>
            유기동물의 치료와 입양을 포함해 여러분께 건강한 반려동물이 입양되도록 힘쓰고 있습니다.<br>
            앞으로 유기동물 입양이 우리 사회의 보편적인 반려동물 문화가 될 수 있도록<br>
           여러분의 많은 관심과 성원 부탁드립니다.

        </div>
<div id="main">
<div class="box">
  <div class="card">
      <img src="./addition/Aboutus1.png" class="images">

        <h2>의료 서비스</h2>
        <p class="marginbottom">애완견이 아픈가요?</p>
        <p><button class="hoverbtn">Contact</button></p>
  </div>
</div>
 <div class="box">
  <div class="card">
      <img src="./addition/Aboutus2.png" class="images">

        <h2>입소 서비스</h2>
        <p class="marginbottom">입소를 원하시나요?</p>
        <p><button class="hoverbtn">Contact</button></p>
  </div>
</div>

<div class="box">
  <div class="card">
      <img src="./addition/Aboutus3.png" class="images">

        <h2>입양 서비스</h2>
        <p class="marginbottom">강아지를 입양하고 싶으신가요?</p>
        <p><button class="hoverbtn">Contact</button></p>
  </div>
</div>
</div>
        <div id="footer">
        <jsp:include page="./MyhomepageFooter.jsp"></jsp:include>
        </div>
    </body>




</html>