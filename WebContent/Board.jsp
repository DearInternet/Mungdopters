<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mypacks.DTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%
    String userid = (String)session.getAttribute("ID");
    Boolean islogin = (Boolean)session.getAttribute("islogin");
%>

<title>Canvas</title>

<jsp:useBean id="bean" class="mypacks.Announce_DAO"/>
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

    #mainWrapper{
        height: 800px;
        width: 800px;
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
    } /* Table(ul)의 마진탑 부제와의 간극 */
    

    #ulTable > li:first-child > ul > li {
        background-color:#c9c9c9;
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
        vertical-align:baseline;
}    

    #ulTable > li > ul > li:first-child               {width:10%;} /*No 열 크기*/
    #ulTable > li > ul > li:first-child +li           {width:45%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li        {width:20%;} /*작성일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li     {width:15%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li  {width:10%;} /*조회수 열 크기*/

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

    #liSearchOption {clear:both;}
    #liSearchOption > div {
        margin:0 auto; 
        margin-top: 30px; 
        width:auto; 
        height:100px;

}

    .left {
        text-align : left;
}


</style>

</head>




<body>
    <div id="header">
        <jsp:include page="MyhomepageHeader.jsp"></jsp:include>
    </div>

    <div id="mainWrapper">

        <ul>
            <!-- 게시판 제목 -->
            <li><p>공지사항</p></li>

            <!-- 게시판 목록  -->
            <li>

                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>No</li>
                            <li>제목</li>
                            <li>작성일</li>
                            <li>작성자</li>
                            <li>조회수</li>
                        </ul>
                    </li>
                    <!-- 게시물이 출력될 영역 -->
                   
                    <% ArrayList<DTO> btoarr = bean.select();
                        if(btoarr.size()<10){
                            for(int pages=0; pages<btoarr.size(); pages++){
                                out.println("<li>");
                                out.println("<ul>");
                                out.println("<li>"+btoarr.get(pages).getB_announce_number()+"</li>");
                                out.println("<li class='left'><a href='./Board_Content.jsp?contentnum="+pages+"'>"+btoarr.get(pages).getB_announce_title()+"</a></li>");
                                out.println("<li>"+btoarr.get(pages).getB_announce_date()+"</li>");
                                out.println("<li>"+btoarr.get(pages).getM_id()+"</li>");
                                out.println("<li>0</li>");
                                out.println("</ul>");
                                out.println("</li>");
                            }
                        }
                        else{
                            for(int pages=0; pages<10; pages++){                     
                            out.println("<li>");
                            out.println("<ul>");
                            out.println("<li>"+btoarr.get(pages).getB_announce_number()+"</li>");
                            out.println("<li class='left'><a href='./Board_Content.jsp?contentnum="+pages+"'>"+btoarr.get(pages).getB_announce_title()+"</a></li>");
                            out.println("<li>"+btoarr.get(pages).getB_announce_date()+"</li>");
                            out.println("<li>"+btoarr.get(pages).getM_id()+"</li>");
                            out.println("<li>0</li>");
                            out.println("</ul>");
                            out.println("</li>");                        
                            }
                        }
                    %>
                    

                </ul>
            </li>

            <!-- 게시판 페이징 영역 -->
            <li>
                <div id="divPaging">
                    <div id="numbering">◀&nbsp;&nbsp;<b>1</b>&nbsp;&nbsp;2&nbsp;&nbsp;3&nbsp;&nbsp;4&nbsp;&nbsp;5&nbsp;&nbsp;▶</div>
                    <div id="write"><button id="write">글 작성</button></div>
                </div>

                
            </li>

            <!-- 검색 폼 영역 -->
            <li id='liSearchOption'>
                <div>
                    <select id='selSearchOption' >
                        <option value='A'>제목+내용</option>
                        <option value='T'>제목</option>
                        <option value='C'>내용</option>
                    </select>
                    <input id='txtKeyWord' />
                    <input type='button' value='검색'/>
                </div>
            </li>

        </ul>
    </div>

    <div id="footer">
        <jsp:include page="MyhomepageFooter.jsp"></jsp:include>
    </div>
</body>


<script type="text/javascript">

if (<%= islogin %> == true) {
            document.getElementById("write").style.display="inline-block";
        }
        else{
            document.getElementById("write").style.display="none";
        }

document.getElementById("write").onclick = function(){
    location.href="./Board_Content_Write.jsp"
}

</script>


</html>