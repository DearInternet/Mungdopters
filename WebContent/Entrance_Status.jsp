<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entrance.Entrance_Request_Ready_DTO" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="entranceid" class="entrance.Entrance_Request_Ready_DAO"/>
<%
request.setCharacterEncoding("UTF-8");
String userid = (String)session.getAttribute("ID");
Boolean islogin = (Boolean)session.getAttribute("islogin");
ArrayList<Entrance_Request_Ready_DTO> addition = entranceid.select(userid);
%>


<!DOCTYPE html>
<meta charset="UTF-8">

<html>

    <head>

        <title>Entrance_Status</title>

    </head>
    
    <style type="text/css">
        
        *{
            padding: 0;
            margin: 0;
        }
        
        ul, li{
            list-style: none;
        }
        
        		#title_textarea{
            border-radius: 5px 5px;
            width: 1027px;
            height: 24px;
            resize: none;
            text-indent: 5px; /* 들여쓰기 5px*/
        }
        
	.dogimage{
		width : 230px;
		height : 300px;
		margin-top : 5px;
	}

		#details{
			margin: 0 auto;
			width: 90%;
			height: 450px;
			margin-top: 100px;
			position: relative;
			border-top: 3px solid skyblue;
		}
		
		#details_left{
		margin-top: 30px;
			width: 35%;
			height: 400px;
			float: left;
		}
		
		#details_left_title{
			position: absolute;
			left: 200px;
			font-family:"Melon";
			font-size:15pt;
		}
		
		
		#details_left_photo{
			width: 46.5%;
			height: 400px;
			float: left;
		}
		#details_left_content{
			width: 46.5%;
			height: 400px;
			float: right;
		}
		
		#details_right{
		margin-top: 30px;
			width: 60%;
			height: 400px;
			float: right;
		}
		
		#details_right_title{
			position: absolute;
			right: 446.7px;
			font-family:"Melon";
			font-size:15pt;
		}
		
		        #buttondiv{
            margin: 0 auto;
            width: 1027px;
            height: 50px;
        }

        #buttons{
            float: right;
        }
		
        #progress_bar_div {
            background: #fff;
            width: 100%;
            margin-top: 100px;
            height: 50px;
            padding-top: 10px;
            padding-bottom: 5px;
        }

        #progress_bar_ul li {
      list-style-type: none;
      width: 20%;
      float: left;
      font-size: 12px;
      text-align: center;
      position: relative;
}


#progress_bar_ul li::before {
    width: 60px;
    height: 60px;
    content: "";
    line-height: 60px;
    border: 4px solid #6AE693;
    display: block;
    text-align: center;
    margin: 0 auto 3px auto;
    border-radius: 50%;
    position: relative;
    z-index: 2;
    background-color: #fff;
} /* 원 */

#progress_bar_ul li::after {
     width: 100%;
     height: 4px;
     content: '';
     position: absolute;
     background-color: #6AE693;
     top: 30px;
     left: -50%;
     z-index: 0;
} /* 선 */

#progress_bar_ul li:first-child:after {
     content: none;
} /* 선 firstchild 로 맨앞에 선 제거 */


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

/* li class - active일시 pseudo 설정  */

#progress_bar_ul li.active::before {
    background: #6AE693  url(user.svg) no-repeat center center;
    background-size: 60%;
}
#progress_bar_ul li::before {
    background: #fff url(user.svg) no-repeat center center;
    background-size: 60%;
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
    </style>

    <body>
        <div id="header">
            <jsp:include page="MyhomepageHeader.jsp"></jsp:include>
        </div>

        <div id="progress_bar_div">
            <ul id="progress_bar_ul">
              <li>입소 신청 완료</li>
              <li>입소 신청서 확인</li>
              <li>입소 신청서 검토</li>
              <li>입소 상담</li>
              <li>입소 완료</li>
            </ul>
        </div>

		<div id="details">
			<div id="details_left">
				<div id="details_left_title">내 입소 신청정보</div>
				<br>
				<br>
				<div id="details_left_photo">
					<label>
            			<div>사진</div>
            			<img class="dogimage" src='${pageContext.request.contextPath}/Entrance_Upload/<%=addition.get(0).getR_photo() %>'>
            		</label>
            	</div>
            	<div id="details_left_content">
				<label>
            		<div>이름</div>
               		<input type="text" class="input_text" name="name" id="name" value="<%= addition.get(0).getR_name() %>" disabled>
            	</label>
            	<br>
            	<br>
            	<label>
                	<div>성별</div>
                	<input type="text" class="input_text" name="email" id="email" value="<%= addition.get(0).getR_sex() %>" disabled>
            	</label>
            	<br>
            	<br>
             	<label>
                	<div>나이</div>
                	<input type="text" class="input_text" name="email" id="email" value="<%= addition.get(0).getR_age() %>" disabled>
            	</label>
            	<br>
            	<br>
             	<label>
                	<div>중성화 여부</div>
                	<input type="text" class="input_text" name="subject" id="subject" value="<%= addition.get(0).getR_neutralize() %>" disabled>
            	</label>
            	<br>
            	<br>
            	<label>
                	<div>추가 요청사항</div>
                	<textarea class="message" name="feedback" id="feedback" disabled><%= addition.get(0).getR_addition() %></textarea>
            	</label>
            	</div>
            	<br>
			</div>
			
			<div id="details_right">
				<div id="details_right_title">추가 자료 제출</div>
				<br>
				<form action="JSP_session_fix.jsp" method="post" name="fix">
                <ul>
                    <li>제목</li>
                        <ul>
                        <li><textarea id="title_textarea" name="board_title">제목</textarea></li>
                        </ul>
                    <li>내용</li>
                        <ul>
                            <li>
                            <textarea id="summernote_content" name="board_content">내용</textarea> 
                            </li>
                        </ul>
                </ul>
                <input type="hidden" name="board_photo" value="0">
                <input type="hidden" name="board_num" value="${param.contentnumedit}">
            </form>
            <div id="buttondiv">
                <div id="buttons">
                    <button id="board_fix_cancel" class="hoverbtn">취소</button>
                    <button id="board_fix_confirm" class="hoverbtn">작성</button>
                </div>
            </div>
			</div>
		</div>
		

        <div id="footer">
        <jsp:include page="MyhomepageFooter.jsp"></jsp:include>
        </div>
    </body>

    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script>
 $(document).ready(function(){

	 $('#summernote_content').summernote({
         height: 250,                 // set editor height
         minHeight: 250,             // set minimum height of editor
         maxHeight: 250,             // set maximum height of editor
         focus: false                  // set focus to editable area after initializing summernote
 });
	 
        var userid = "<%= userid %>";
        var islogin = "<%= islogin %>";
        var entrance_status;

        if(islogin === 'true' && userid != null){
            // ajax 사용자 입소 단계
            $.ajax({
                url : "Entrance_Status_Logincheck.jsp",
                type : "post",
                data : {"userid_entrance_check": userid},
                success : function(data){
                	 
                	 var trimdata = $.trim(data);
                	 if(trimdata == "true"){
                		 alert("먼저 입소신청을 해주세요")
                		 location.href="./Entrance_Request.jsp";
                	 }
                	 
                	 else if(trimdata == "false"){
                		
                		 $.ajax({
                		        url : "Entrance_Status_Result.jsp",
                		        type : "post",
                		        traditional : true,
                		        data : {"userid_entrance_status": userid},
                		        success : function(data){
                		        	
                		            var trimdata = $.trim(data);
                		       	 	
                		       	 	switch(trimdata){
                		       	 		case "1" : $('#progress_bar_ul li:nth-child(-n+1)').addClass('active'); break;
                		       	 		case "2" : $('#progress_bar_ul li:nth-child(-n+2)').addClass('active'); break;
                		       	 		case "3" : $('#progress_bar_ul li:nth-child(-n+3)').addClass('active'); break;
                		       	 		case "4" : $('#progress_bar_ul li:nth-child(-n+4)').addClass('active'); break;
                		       			case "5" : $('#progress_bar_ul li:nth-child(-n+5)').addClass('active'); break;
                		       			default : alert("Error!");
                		       			break;
                		       	 	}
                		       		
                		            
                		        },
                		        error : function(err){
                		            alert(err);
                		        }

                		    });

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
        
        
 })
</script>

</html>