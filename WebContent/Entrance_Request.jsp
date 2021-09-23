<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%
request.setCharacterEncoding("UTF-8");
String userid = (String)session.getAttribute("ID");
Boolean islogin = (Boolean)session.getAttribute("islogin");
%>
<!DOCTYPE html>
<meta charset="UTF-8">

<html>

<head>

    <title>Entrance_Status</title>

</head>

<link href='https://fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'>
<style type="text/css">

*{
    padding: 0;
    margin: 0;
}
body {
  font-family: 'Lato', sans-serif;
}

div.wrap {
  width: 500px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  vertical-align: middle;
}

.input {
  position: relative;
  margin: 50px 0;
}

label {
  position: absolute;
  top: 0;
  font-size: 30px;
  margin: 10px;
  padding: 0 10px;
  -webkit-transition: top .2s ease-in-out, 
  font-size .2s ease-in-out;
  transition: top .2s ease-in-out, 
  font-size .2s ease-in-out;
  top: -50px;
  font-size: 20px;
}

input[type=text] {
  width: 100%;
  padding: 20px;
  border: 1px solid black;
  font-size: 20px;
  background-color: white;
  color: black;
} 

input[type=text]:focus {
  outline: none;
}

#hidden_dogimage {
	position : absolute;
	top: 70px;
	left : 20px;
	display: none;
}

#maindiv{
    height: 600px;
    width: 1603px;
    margin: 0 auto;
}

/* ------ 버튼 ------ */

.buttoncanceldiv {
    position: absolute;
    top: 130px;
    left: 0px;
}

.buttondiv {
    position: absolute;
    top: 130px;
    right: -45px;
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

/* ------ 진행바 ------ */

#progress_bar_div {
    background: #fff;
    width: 90%;
    margin-top: 80px;
    height: 100px;
    padding-top: 10px;
    padding-bottom: 5px;
    float: right;
}

#progress_bar_ul li {
  list-style-type: none;
  width: 12.5%;
  float: left;
  font-size: 12px;
  text-align: center;
  position: relative;
}


#progress_bar_ul li::before {
    width: 40px;
    height: 40px;
    content: "";
    line-height: 60px;
    border: 4px solid #7d7d7d;
    display: block;
    text-align: center;
    margin: 0 auto 3px auto;
    border-radius: 50%;
    position: relative;
    z-index: 2;
    background-color: #fff;
}

#progress_bar_ul li::after {
     width: 100%;
     height: 4px;
     content: '';
     position: absolute;
     background-color: #7d7d7d;
     top: 20px;
     left: -50%;
     z-index: 0;
}

#progress_bar_ul li:first-child:after {
	content: none;
}
#progress_bar_ul li.active {
	color: green;
	font-weight: bold;  
}
#progress_bar_ul li.active::before {
	border-color: #55b776;
	background: green;
}
#progress_bar_ul li.active + li::after {
	background-color: #6AE693;
}
#progress_bar_ul li.active::before {
	background: #6AE693  url(user.svg) no-repeat center center;
	background-size: 60%;
}
#progress_bar_ul li::before {
	background: #fff url(user.svg) no-repeat center center;
	background-size: 60%;
}
    </style>

    <!-- AOS -->

    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <body>
        <div id="header">
            <jsp:include page="MyhomepageHeader.jsp"></jsp:include>
        </div>



        <div id="maindiv">
            <div id="progress_bar_div">
                <ul id="progress_bar_ul">
                    <li class="active">견종 입력</li>
                    <li>강아지 이름 입력</li>
                    <li>강아지 성별 입력</li>
                    <li>강아지 나이 입력</li>
                    <li>강아지 중성화 여부 입력</li>
                    <li>강아지 사진 등록</li>
                    <li>추가 요청사항</li>
                </ul>
            </div>

            <div class="wrap">
                <div class="input">
                    <form id="theform">
                        <label for="fname" id="labelhead">견종을 입력해주세요</label>
                        <input id="fname" type="text" class="cool"/>
                    </form>
                </div>
				
				<div class="buttoncanceldiv">
                    
                </div>
				
                <div class="buttondiv">
                    <button id="hoverbtntemp1" class="hoverbtn" data-aos="fade-up" data-aos-duration="1000">
                        	다음
                    </button>
                </div>

                <div id="hidden">
                    <form id="requests" action="./Entrance_Request_Result.jsp" method="post" enctype="multipart/form-data">
                    	<input type="hidden" id="hidden_userid" name="userid" class="inputs" value="<%= userid %>"/>
                        <input type="hidden" id="hidden_dogbreed" name="dogbreed" class="inputs"/>
                        <input type="hidden" id="hidden_dogname" name="dogname" class="inputs"/>
                        <input type="hidden" id="hidden_dogsex" name="dogsex" class="inputs"/>
                        <input type="hidden" id="hidden_dogage" name="dogage" class="inputs"/>
                        <input type="hidden" id="hidden_dogneutralize" name="dogneutralize" class="inputs"/>
                        <input type="file" id="hidden_dogimage" name="dogimage" class="inputs"/>
                        <input type="hidden" id="hidden_dogaddition" name="dogaddition" class="inputs"/>
                    </form>
                </div>

                <div id="hiddenresult">
                	<input type="hidden" id="hidden_result" value=""/>
                </div>
            </div>
        </div>


    </div>
</div>

<div id="footer">
    <jsp:include page="MyhomepageFooter.jsp"></jsp:include>
</div>
</body>


<script>

    $(document).ready(function(){
        var userid = "<%= userid %>";
        var islogin = "<%= islogin %>";
        var entrance_request_status;

        if(islogin === 'true' && userid != null){
            // ajax 사용자 입소 단계
            $.ajax({
                url : "Entrance_Request_Logincheck.jsp",
                type : "post",
                data : {"userid_entrance_check": userid},
                success : function(data){
                	 
                	 var trimdata = $.trim(data);
                	 if(trimdata == "true"){}
                	 else if(trimdata == "false"){
                		 alert("이미 입소신청을 완료했습니다.")
                		 location.href="./Entrance_Status.jsp";
                	 }
                },
                error : function(err){
                    alert(err);
                }

            });
        } else{
            alert("로그인을 하셔야 합니다!");
            tohome();
        }
        
        $(document).on("click", "#hoverbtntemp1", function() {

            var labeltitle = "강아지 이름을 입력해주세요";
            var btnnumber = 2;

            var labeldiv = "<form id='theform'><label for='fname' id='labelhead'>"+labeltitle+"</label><input id='fname' type='text' class='cool'/></form>"
            var cancelbtn = "<button id='hoverbtncanceltemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>이전</button>"
            var btn = "<button id='hoverbtntemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>다음</button>"

            var temp = $('#fname').val();

            $('#hidden_dogbreed').val(temp);
            $('#theform').remove();
            $('#hoverbtntemp1').remove();

            $('.input').append(labeldiv);  
            $('.buttoncanceldiv').append(cancelbtn); 
            $('.buttondiv').append(btn);  
            $('#progress_bar_ul li:nth-child('+btnnumber+')').addClass('active');
        }); 

        $(document).on("click", "#hoverbtncanceltemp2", function() {

            var labeltitle = "견종을 입력해주세요";
            var btnnumber = 1;

            var labeldiv = "<form id='theform'><label for='fname' id='labelhead'>"+labeltitle+"</label><input id='fname' type='text' class='cool'/></form>"
            var btn = "<button id='hoverbtntemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>다음</button>"

            $('#theform').remove();
            $('#hoverbtntemp2').remove();
            $('#hoverbtncanceltemp2').remove();

            $('.input').append(labeldiv);  
            $('.buttondiv').append(btn);  
            btnnumber++;
            $('#progress_bar_ul li:nth-child('+btnnumber+')').removeClass('active');
        }); 
        
        
        $(document).on("click", "#hoverbtntemp2", function() {

            var labeltitle = "강아지 성별을 입력해주세요";
            var btnnumber = 3;

            var labeldiv = "<form id='theform'><label for='fname' id='labelhead'>"+labeltitle+"</label><input id='fname' type='text' class='cool'/></form>"
            var cancelbtn = "<button id='hoverbtncanceltemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>이전</button>"
            var btn = "<button id='hoverbtntemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>다음</button>"

            var temp = $('#fname').val();

            $('#hidden_dogname').val(temp);
            $('#theform').remove();
            $('#hoverbtntemp2').remove();
            $('#hoverbtncanceltemp2').remove();

            $('.input').append(labeldiv);   
            $('.buttondiv').append(btn);   
            $('.buttoncanceldiv').append(cancelbtn); 
            $('#progress_bar_ul li:nth-child('+btnnumber+')').addClass('active');              
        }); 

        $(document).on("click", "#hoverbtncanceltemp3", function() {

            var labeltitle = "강아지 이름을 입력해주세요";
            var btnnumber = 2;

            var labeldiv = "<form id='theform'><label for='fname' id='labelhead'>"+labeltitle+"</label><input id='fname' type='text' class='cool'/></form>"
            var cancelbtn = "<button id='hoverbtncanceltemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>이전</button>"
            var btn = "<button id='hoverbtntemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>다음</button>"

            $('#theform').remove();
            $('#hoverbtntemp3').remove();
            $('#hoverbtncanceltemp3').remove();

            $('.input').append(labeldiv);  
            $('.buttondiv').append(btn);  
            $('.buttoncanceldiv').append(cancelbtn); 
            btnnumber++;
            $('#progress_bar_ul li:nth-child('+btnnumber+')').removeClass('active');
        }); 
        
        $(document).on("click", "#hoverbtntemp3", function() {

            var labeltitle = "강아지 나이를 입력해주세요";
            var btnnumber = 4;

            var labeldiv = "<form id='theform'><label for='fname' id='labelhead'>"+labeltitle+"</label><input id='fname' type='text' class='cool'/></form>"
            var cancelbtn = "<button id='hoverbtncanceltemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>이전</button>"
            var btn = "<button id='hoverbtntemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>다음</button>"

            var temp = $('#fname').val();

            $('#hidden_dogsex').val(temp);
            $('#theform').remove();
            $('#hoverbtntemp3').remove();
            $('#hoverbtncanceltemp3').remove();

            $('.input').append(labeldiv);   
            $('.buttondiv').append(btn);    
            $('.buttoncanceldiv').append(cancelbtn); 
            $('#progress_bar_ul li:nth-child('+btnnumber+')').addClass('active');           
        }); 

        $(document).on("click", "#hoverbtncanceltemp4", function() {

            var labeltitle = "강아지 성별을 입력해주세요";
            var btnnumber = 3;

            var labeldiv = "<form id='theform'><label for='fname' id='labelhead'>"+labeltitle+"</label><input id='fname' type='text' class='cool'/></form>"
            var cancelbtn = "<button id='hoverbtncanceltemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>이전</button>"
            var btn = "<button id='hoverbtntemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>다음</button>"

            $('#theform').remove();
            $('#hoverbtntemp4').remove();
            $('#hoverbtncanceltemp4').remove();

            $('.input').append(labeldiv);  
            $('.buttondiv').append(btn);  
            $('.buttoncanceldiv').append(cancelbtn); 
            btnnumber++;
            $('#progress_bar_ul li:nth-child('+btnnumber+')').removeClass('active');
        }); 
        
        $(document).on("click", "#hoverbtntemp4", function() {

            var labeltitle = "강아지 중성화여부를 입력해주세요";
            var btnnumber = 5;

            var labeldiv = "<form id='theform'><label for='fname' id='labelhead'>"+labeltitle+"</label><input id='fname' type='text' class='cool'/></form>"
            var cancelbtn = "<button id='hoverbtncanceltemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>이전</button>"
            var btn = "<button id='hoverbtntemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>다음</button>"

            var temp = $('#fname').val();

            $('#hidden_dogage').val(temp);
            $('#theform').remove();
            $('#hoverbtntemp4').remove();
            $('#hoverbtncanceltemp4').remove();

            $('.input').append(labeldiv);   
            $('.buttondiv').append(btn); 
            $('.buttoncanceldiv').append(cancelbtn); 
            $('#progress_bar_ul li:nth-child('+btnnumber+')').addClass('active');            
        }); 

        $(document).on("click", "#hoverbtncanceltemp5", function() {

            var labeltitle = "강아지 나이를 입력해주세요";
            var btnnumber = 4;

            var labeldiv = "<form id='theform'><label for='fname' id='labelhead'>"+labeltitle+"</label><input id='fname' type='text' class='cool'/></form>"
            var cancelbtn = "<button id='hoverbtncanceltemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>이전</button>"
            var btn = "<button id='hoverbtntemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>다음</button>"

            $('#theform').remove();
            $('#hoverbtntemp5').remove();
            $('#hoverbtncanceltemp5').remove();

            $('.input').append(labeldiv);  
            $('.buttondiv').append(btn);  
            $('.buttoncanceldiv').append(cancelbtn); 
            btnnumber++;
            $('#progress_bar_ul li:nth-child('+btnnumber+')').removeClass('active');
        }); 
        
        $(document).on("click", "#hoverbtntemp5", function() {

            var labeltitle = "강아지 사진을 등록해주세요";
            var btnnumber = 6;

            var labeldiv = "<form id='theform'><label for='fname' id='labelhead'>"+labeltitle+"</label><input id='fname' type='text' class='cool' disabled='true'/></form>"
            var cancelbtn = "<button id='hoverbtncanceltemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>이전</button>"
            var btn = "<button id='hoverbtntemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>다음</button>"

            var temp = $('#fname').val();

            $('#hidden_dogneutralize').val(temp);
            $('#theform').remove();
            $('#hoverbtntemp5').remove();
            $('#hoverbtncanceltemp5').remove();
            
            $('#hidden_dogimage').show();
            $('.input').append(labeldiv);   
            $('.buttondiv').append(btn);   
            $('.buttoncanceldiv').append(cancelbtn); 
            $('#progress_bar_ul li:nth-child('+btnnumber+')').addClass('active');           
        }); 
        
        $(document).on("click", "#hoverbtncanceltemp6", function() {

            var labeltitle = "강아지 중성화여부를 입력해주세요";
            var btnnumber = 5;

            var labeldiv = "<form id='theform'><label for='fname' id='labelhead'>"+labeltitle+"</label><input id='fname' type='text' class='cool'/></form>"
            var cancelbtn = "<button id='hoverbtncanceltemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>이전</button>"
            var btn = "<button id='hoverbtntemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>다음</button>"

            $('#theform').remove();
            $('#hoverbtntemp6').remove();
            $('#hoverbtncanceltemp6').remove();

            $('.input').append(labeldiv);  
            $('.buttondiv').append(btn);  
            $('.buttoncanceldiv').append(cancelbtn); 
            btnnumber++;
            $('#progress_bar_ul li:nth-child('+btnnumber+')').removeClass('active');
        }); 

        $(document).on("click", "#hoverbtntemp6", function() {

            var labeltitle = "추가적인 요청사항이 있으면 입력해주세요";
            var btnnumber = 7;

            var labeldiv = "<form id='theform'><label for='fname' id='labelhead'>"+labeltitle+"</label><input id='fname' type='text' class='cool'/></form>"
            var cancelbtn = "<button id='hoverbtncanceltemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>이전</button>"
            var btn = "<button id='hoverbtntemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>완료</button>"

            $('#hidden_dogimage').hide();
            $('#theform').remove();
            $('#hoverbtntemp6').remove();
            $('#hoverbtncanceltemp6').remove();
            
            $('.input').append(labeldiv);   
            $('.buttondiv').append(btn);   
            $('.buttoncanceldiv').append(cancelbtn); 
            $('#progress_bar_ul li:nth-child('+btnnumber+')').addClass('active');           
        }); 
        
        $(document).on("click", "#hoverbtncanceltemp7", function() {

            var labeltitle = "강아지 사진을 등록해주세요";
            var btnnumber = 6;

            var labeldiv = "<form id='theform'><label for='fname' id='labelhead'>"+labeltitle+"</label><input id='fname' type='text' class='cool' disabled='true'/></form>"
            var cancelbtn = "<button id='hoverbtncanceltemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>이전</button>"
            var btn = "<button id='hoverbtntemp"+btnnumber+"' class='hoverbtn' data-aos='fade-up' data-aos-duration='1000'>다음</button>"

            $('#theform').remove();
            $('#hoverbtntemp7').remove();
            $('#hoverbtncanceltemp7').remove();

            $('#hidden_dogimage').show();
            $('.input').append(labeldiv);  
            $('.buttondiv').append(btn);  
            $('.buttoncanceldiv').append(cancelbtn); 
            btnnumber++;
            $('#progress_bar_ul li:nth-child('+btnnumber+')').removeClass('active');
        }); 
        
        $(document).on("click", "#hoverbtntemp7", function() {

            var temp = $('#fname').val();

            $('#hidden_dogaddition').val(temp);
            $('#theform').remove();
            $('#hoverbtntemp7').remove();
            $('#hoverbtncanceltemp7').remove();
            submit();
        }); 
    })

function submit(){

    var array_data = new Array();

    array_data = [userid, $('#requests input:nth-child(1)').val(), $('#requests input:nth-child(2)').val(), $('#requests input:nth-child(3)').val(), $('#requests input:nth-child(4)').val(), $('#requests input:nth-child(5)').val(), $('#requests input:nth-child(6)').val(), $('#requests input:nth-child(7)').val()];

    var check = confirm(" 입력하신 정보는\n 견종 : " + array_data[2] + "\n 강아지 이름 : " + array_data[3] + "\n 강아지 성별 : " + array_data[4] + "\n 강아지 나이 : " + array_data[5] + "\n 강아지 중성화 여부 : " + array_data[6] + "\n 강아지 사진 : " + array_data[7] + "\n 입니다.\n 맞으면 확인, 틀리면 취소를 누르십시오." );
    
    if(check == true){
    	$('#requests').submit();
    } else {
    	alert("false!");
    	location.href = "./Entrance_Request.jsp";
    }
    
    
   
}
    
</script>



</html>

