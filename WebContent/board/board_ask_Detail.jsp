<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@page import="vo.BoardBean"%>
<% response.setContentType("text/html;charset=UTF-8"); %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<%
    Boolean islogin = (Boolean)session.getAttribute("islogin");
    String userid = (String)session.getAttribute("ID");
	BoardBean article = (BoardBean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
%>
<html>

    <head>

        <title>Board_Content</title>

    </head>
    
    <style type="text/css">
        
        *{
            padding: 0;
            margin: 0;
        }

        #maindiv{
            margin: 0 auto;
            width: 800px;
            height: 800px;
            border-style: solid;
            margin-top: 100px;
        }

        #titlediv{
            height: 60px;
        }

        .inside_left{
            width: 20%;
            height: 100%;
            background-color: #F1F1F1;
            float: left;
            display: table;
        }

        .inside_right{
            width: 80%;
            height: 100%;
            float: right;
            display: table;
        }

        .center{
            display: table-cell;
            vertical-align: middle;
            text-align: center;
        }

        #details{
            height: 60px;
            border-top-style: solid;
        }
        
        #details2{
            height: 60px;
            border-top-style: solid;
            border-bottom-style: solid;
        }

        #date{
            width: 50%;
            height: 100%;
            float: left;
        }

        #views{
            width: 50%;
            height: 100%;
            float: right;
        }
        
        #writer{
         	width: 50%;
            height: 100%;
            float: left;
        }
        
        #file{
        	width: 50%;
            height: 100%;
            float: right;
        }

        #buttondiv{
            width: 800px;
            margin: 0 auto;
        }

        #buttons{
            float: right;
        }
        
    </style>


    <body>
        <div id="header">
            <jsp:include page="../MyhomepageHeader.jsp"></jsp:include>
        </div>
            <div id="maindiv">
                

                <div id="titlediv">
                    <div class="inside_left">
                        <div class="center">
                            	제목
                        </div>
                    </div>

                    <div class="inside_right">
                        <div class="center">
                            <%= article.getB_ask_title() %> 
                        </div>
                    </div>
                </div>
                
                <div id="details">
                    <div id="date">
                        <div class="inside_left">
                            <div class="center">
                            	날짜
                            </div>
                        </div>

                        <div class="inside_right">
                            <div class="center">
                                <%= article.getB_ask_date() %> 
                            </div>
                        </div>
                    </div>

                    <div id="views">
                        <div class="inside_left">
                            <div class="center">
                                	조회수
                            </div>
                        </div>

                        <div class="inside_right">
                            <div class="center">
                                	<%= article.getB_ask_count() %>
                            </div> 
                        </div>
                    </div>
                </div>
                
                <div id="details2">
                    <div id="writer">
                        <div class="inside_left">
                            <div class="center">
                            	글쓴이
                            </div>
                        </div>

                        <div class="inside_right">
                            <div class="center">
                                <%= article.getM_id() %>
                            </div>
                        </div>
                    </div>

                    <div id="file">
                        <div class="inside_left">
                            <div class="center">
                               	 첨부파일
                            </div>
                        </div>

                        <div class="inside_right">
                            <div class="center">
                               <%if(article.getB_ask_file()==null){
                            	   out.println("첨부파일이 없습니다.");
                               } else {
                            	   out.println("<a href=file_Down.mdts?Original_File="+article.getB_ask_file()+">"+article.getB_ask_file()+"</a>");   
                               }%>
                            </div> 
                        </div>
                    </div>
                </div>

                <div id="contentdiv" style="padding-top: 10px; padding-left: 10px;">
                    <%= article.getB_ask_content() %> 
                </div>

            </div>

            <div id="buttondiv">
                <div id="buttons">
                    <button id="modify_btn">수정하기</button>
                    <button id="delete_btn">삭제하기</button>
                    <button id="toreply_btn" onclick="toreply()">답글달기</button>
                    <button id="toboard_btn" onclick="toboard()">목록</button>
                    <form name="action_reply" action="board_ask_toReply.mdts" method="post">
                    	<input type="hidden" name="b_ask_num" value="<%= article.getB_ask_number()%>"/>
                    </form>
                    <form name="action_modify" action="board_ask_toModify.mdts" method="post">
                        <input type="hidden" name="b_ask_num" value="<%= article.getB_ask_number()%>"/>
                        <input type="hidden" name="page" value="<%= nowPage %>"/>
                    </form>
                    <form name="action_delete" action="board_ask_Delete.mdts" method="post">
                        <input type="hidden" name="b_ask_num" value='<%= article.getB_ask_number() %>'/>
                    </form>
                </div>
            </div>
        <div id="footer">
        <jsp:include page="../MyhomepageFooter.jsp"></jsp:include>
        </div>    
    </body>

    <script type="text/javascript">
        var userid = "<%= userid %>";
        var contentid = "<%= article.getM_id() %>";
        
        if (<%= islogin %> == true && userid == contentid) {
            document.getElementById("modify_btn").style.display="inline-block";
            document.getElementById("delete_btn").style.display="inline-block";
        }
        else{
            document.getElementById("modify_btn").style.display="none";
            document.getElementById("delete_btn").style.display="none";
        }
        
        if (<%= islogin %> == true) {
            document.getElementById("toreply_btn").style.display="inline-block";
        }
        else{
            document.getElementById("toreply_btn").style.display="none";
        }
        
        document.getElementById('modify_btn').onclick = function(){
            action_modify.submit();
        }

        document.getElementById('delete_btn').onclick = function(){
            if(confirm("정말 삭제하시겠습니까?")){
            	action_delete.submit();
            }
        }
        
        function toboard(){
            location.href="board_ask_List.mdts?page="+"<%= nowPage %>";
        }
        
        function toreply(){
            action_reply.submit();
        }

    </script>



</html>