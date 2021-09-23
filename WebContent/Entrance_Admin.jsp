<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.EntranceBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entrance.Entrance_Request_Status_DTO" %>
<%@ page import="java.sql.*" %>

<jsp:useBean id="entrancestatus" class="entrance.Entrance_Request_Status_DAO"/>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>

<!DOCTYPE html>
<%
    String userid = (String)session.getAttribute("ID");
    Boolean islogin = (Boolean)session.getAttribute("islogin");
    ArrayList<EntranceBean> articleList = (ArrayList<EntranceBean>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>
<html>
<head>
<meta charset="UTF-8">



<title>Board Ask</title>

<style type="text/css">
    body{
        line-height:2em;        
        font-family:"맑은 고딕";
	}	/* 모든 줄간극 2em 모든 폰트 맑은고딕 */

    ul, li{ 
        list-style: none;
        text-align:center;
        padding:0;
        margin:0;
	} /* 모든 ul li 는 앞에 점없애고, 가운데정렬, 기본들여쓰기 삭제*/

	#title{
	font-family: "Melon";
  font-size:25pt;}

    #mainWrapper{
        height: 1300px;
        width: 1300px;
        margin: 0 auto; /* 전체 div 가운데 정렬 */
        margin-top: 100px;
    }

    #mainWrapper > ul > li:first-child {
        text-align: center;
        font-size:16pt;
        height:40px;
        vertical-align:middle;
        line-height:30px;
    } /* 제목 설정 */

    #ulTable {
        margin-top:10px;
        vertical-align:middle;
    } /* Table(ul)의 마진탑 부제와의 간극 */
    

    #ulTable > li:first-child > ul > li {
        background-color:#F2E2C6;
        font-weight:bold;
        text-align:center;
}

    #ulTable > li > ul {
        clear:both;
        padding:0px auto;
        position:relative;
        min-width:40px;
}
    #ulTable > li > ul > li { 
        float:left;
        font-size:10pt;
        border-bottom:1px solid silver;

}    

    #ulTable > li > ul > li:first-child               			{width:9%;} /*No 열 크기*/
    #ulTable > li > ul > li:first-child +li           			{width:9%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li        			{width:9%;} /*작성일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li     			{width:9%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li  			{width:9%;} /*조회수 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li+li  		{width:9%;} /*조회수 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li+li+li  	{width:9%;} /*조회수 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li+li+li+li   {width:9%;} /*조회수 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li+li+li+li+li   {width:9%;} /*조회수 열 크기*/
	#ulTable > li > ul > li:first-child +li+li+li+li+li+li+li+li+li {width:9%;}
	#ulTable > li > ul > li:first-child +li+li+li+li+li+li+li+li+li+li {width:10%;}
	
	.dogimageborder{
		width : 130px;
		height :120px;
		overflow:auto;
	}
	
	.dogimage{
		width : 10px;
		height : 10px;
		margin-top : 5px;
	}
	
	.dogimagefile{
		width : 130px;
		height : 110px;
	}
	
	.contentul li:nth-child(n+2) {
		height : 75px;
		margin-top : 45px;
	}

    #divPaging {
        position: relative;
        clear:both; 
        margin:0 auto; 
        width:800px; 
        height:30px;
}

    #numbering {
        display: inline-block;
        margin:0 auto;
        text-align:center;
}
    #write{
        position : absolute;
        width: 80px;
        right: 0%;
        top: 50%;
        transform: translate(0,-50%);
        float: right;
    }

    .left {
        text-align : left;
}


</style>

</head>




<body>
    <div id="header">
        <jsp:include page="./MyhomepageHeader.jsp"></jsp:include>
    </div>

    <div id="mainWrapper">

        <ul>
            <!-- 게시판 제목 -->
            <li id="title"><p>사용자 입소 관리</p></li>

            <!-- 게시판 목록  -->
            <li>

                <ul id ="ulTable">
                    <li>
                        <ul>
                        	<li>강아지 사진</li>
                            <li>ID</li>
                            <li>견종</li>
                            <li>강아지 이름</li>
                            <li>강아지 성별</li>
                            <li>강아지 나이</li>
                            <li>강아지 중성화 여부</li>
                            <li>상세 정보</li>
                            <li>승인/거절</li>
                            <li>상담하기</li>
                            <li>최종승인</li>
                        </ul>
                    </li>
                    <!-- 게시물이 출력될 영역 -->
                   <% for (int i=0; i < articleList.size(); i++ ) { %>
                   	<li class = "contentli">
                    	<ul class = "contentul">
                    		<li>
                    			<div class="dogimageborder">
                    				<div class="dogimage">
                    					<img class="dogimagefile" src='${pageContext.request.contextPath}/Entrance_Upload/<%=articleList.get(i).getR_photo() %>'>
                    					
                    				</div>
                    			</div>
                    		</li> <!-- 사진 -->
                    		<li><%=articleList.get(i).getM_id() %></li>
                    		<li><%=articleList.get(i).getR_type()%></li>
							<li><%=articleList.get(i).getR_name()%></li>
                    		<li><%=articleList.get(i).getR_sex()%></li>
                    		<li><%=articleList.get(i).getR_age() %></li>
                    		<li><%=articleList.get(i).getR_neutralize()%></li>
                    		<li><button onclick="javascript:popup('<%=articleList.get(i).getM_id() %>')" target = "_parent">확인하기</button></li>
                    		<li>
                    		
                    			<%
									
									if (entrancestatus.select(articleList.get(i).getM_id()).get(0).getS_status() != 3) {
								%>
                    		
                    			<button onclick="accept('<%=articleList.get(i).getM_id() %>', '<%= i %>');">승인</button>
                    			<button onclick="deny('<%=articleList.get(i).getM_id() %>', '<%= i %>');">반려</button>
                    			<% } else { %>
										
										<div class="acceptdenyresult<%= i %>"> 선택 완료 </div>
									<% } %>
								
                    			
                    		</li>
                    		<li><button>상담하기</button></li>
                    		<li><button onclick="send('<%=articleList.get(i).getR_type() %>', '<%=articleList.get(i).getR_name() %>', '<%=articleList.get(i).getR_sex() %>', '<%=articleList.get(i).getR_neutralize() %>', '<%=articleList.get(i).getR_age() %>', '<%=articleList.get(i).getR_photo() %>');">입양등록</button></li>
                    	</ul>
                    </li>
                   <% }%>
                    

                </ul>
            </li>

            <!-- 게시판 페이징 영역 -->
            <li>
                <div id="divPaging">
                    <div id="numbering">
                   		<% if (nowPage <= 1) { %>
                   		 ◀&nbsp;&nbsp;
                   		<% } else { %>
                   		 <a href="board_ask_List.mdts?page=<%=nowPage - 1%>" style="text-decoration:none;">◀&nbsp;&nbsp;</a>
                   		<% } %>
                   		
                   		
                   		
						<%
							for (int a = startPage; a <= endPage; a++) {
							if (a == nowPage) {
						%>
						<b><%=a%>&nbsp;&nbsp;</b>
						<%
							} else {
						%>
						<a href="board_ask_List.mdts?page=<%=a%>" style="text-decoration:none;"><%=a%></a>&nbsp;&nbsp;
						<% } } %>
                   		 
                   		 
                   		 <% if (nowPage >= maxPage) { %>
                   		 ▶
                   		<% } else { %>
                   		 <a href="board_ask_List.mdts?page=<%=nowPage + 1%>" style="text-decoration:none;">▶</a>
                   		<% } %>
                    </div>
                    
                    
                </div>

                
            </li>

            

        </ul>
    </div>

    <div id="footer">
        <jsp:include page="./MyhomepageFooter.jsp"></jsp:include>
    </div>
</body>


<script type="text/javascript">

function popup(m_id){
	var url = "./Entrance_Admin_Details.jsp?m_id="+m_id;
	var name = "popup test";
	var option = "width = 503, height = 447, top = 0, left = 0";
	window.open(url, name, option);
}

function accept(m_id, resultnum){
	 var array_data = new Array();

	    array_data = ["Accept" , m_id];

    	 $.ajax({
    	        url : "Entrance_Admin_AcceptDeny.jsp",
    	        type : "post",
    	        traditional : true,
    	        data : {"array_data": array_data},
    	        success : function(data){
    	        	
    	        	
    	       	 	alert(data);	  
    	            
    	        },
    	        error : function(err){
    	            alert(err);
    	        }

    	    });
	
}

function deny(m_id, resultnum){
	 var array_data = new Array();

	    array_data = ["Deny" , m_id];	

	 $.ajax({
	        url : "Entrance_Admin_AcceptDeny.jsp",
	        type : "post",
	        traditional : true,
	        data : {"array_data": array_data},
	        success : function(data){
	        	alert(data);

	        },
	        error : function(err){
	            alert(err);
	        }

	    });
	
}

function send(d_info_type, d_info_name, d_info_sex, d_info_neutralize, d_info_age, d_info_photo){
	
	var form = document.createElement("form");

	form.setAttribute("method","post");
	form.setAttribute("action","Send_To_Adopt_Wait.mdts");

	document.body.appendChild(form);

	//input
	var input_id1 = document.createElement("input");
	var input_id2 = document.createElement("input");
	var input_id3 = document.createElement("input");
	var input_id4 = document.createElement("input");
	var input_id5 = document.createElement("input");
	var input_id6 = document.createElement("input");
	
	input_id1.setAttribute("type", "hidden");
	input_id1.setAttribute("name", "d_info_type");
	input_id1.setAttribute("value", d_info_type);
	form.appendChild(input_id1);
	
	input_id2.setAttribute("type", "hidden");
	input_id2.setAttribute("name", "d_info_name");
	input_id2.setAttribute("value", d_info_name);
	form.appendChild(input_id2);
	
	input_id3.setAttribute("type", "hidden");
	input_id3.setAttribute("name", "d_info_sex");
	input_id3.setAttribute("value", d_info_sex);
	form.appendChild(input_id3);
	
	input_id4.setAttribute("type", "hidden");
	input_id4.setAttribute("name", "d_info_neutralize");
	input_id4.setAttribute("value", d_info_neutralize);
	form.appendChild(input_id4);
	
	input_id5.setAttribute("type", "hidden");
	input_id5.setAttribute("name", "d_info_age");
	input_id5.setAttribute("value", d_info_age);
	form.appendChild(input_id5);
	
	input_id6.setAttribute("type", "hidden");
	input_id6.setAttribute("name", "d_info_photo");
	input_id6.setAttribute("value", d_info_photo);
	form.appendChild(input_id6);
	

	//폼전송

	
	form.submit();
	
}


</script>


</html>