<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mypacks.DTO" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="beancontent" class="mypacks.Announce_DAO"/>
<!DOCTYPE html>
<meta charset="UTF-8">
<%
    Boolean islogin = (Boolean)session.getAttribute("islogin");
    String userid = (String)session.getAttribute("ID");
    ArrayList<DTO> cont = beancontent.select();
    String contentid = cont.get(Integer.parseInt(request.getParameter("contentnum"))).getM_id();
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
            height: 100px;
        }

        .inside_left{
            width: 15%;
            height: 100%;
            background-color: #F1F1F1;
            float: left;
            display: table;
        }

        .inside_right{
            width: 85%;
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
            height: 100px;
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
            <jsp:include page="MyhomepageHeader.jsp"></jsp:include>
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
                            <%= cont.get(Integer.parseInt(request.getParameter("contentnum"))).getB_announce_title() %> 
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
                                <%= cont.get(Integer.parseInt(request.getParameter("contentnum"))).getB_announce_date() %> 
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
                                조회수 표시예정
                            </div> 
                        </div>
                    </div>
                </div>

                <div id="contentdiv" style="padding-top: 10px; padding-left: 10px;">
                    <%= cont.get(Integer.parseInt(request.getParameter("contentnum"))).getB_announce_content() %> 
                </div>

            </div>

            <div id="buttondiv">
                <div id="buttons">
                    <button id="modify_btn">수정하기</button>
                    <button id="delete_btn">삭제하기</button>
                    <button id="toboard_btn" onclick="toboard()">목록</button>
                    <form name="action_fix" action="./Board_Content_Fix.jsp" method="post">
                        <input type="hidden" name="contentnumedit" value="${param.contentnum}"/>
                    </form>
                    <form name="action_delete" action="./JSP_session_delete.jsp" method="post">
                        <input type="hidden" name="contentnumdelete" value='<%= cont.get(Integer.parseInt(request.getParameter("contentnum"))).getB_announce_number() %>'/>
                    </form>
                    <form>
                        <input type="hidden" id = "hiddenuserid" value="<%= userid %>"/>
                        <input type="hidden" id = "hiddencontentid" value="<%= contentid %>"/>
                    </form>
                </div>
            </div>
        <div id="footer">
        <jsp:include page="MyhomepageFooter.jsp"></jsp:include>
        </div>    
    </body>

    <script type="text/javascript">
        var userid = "<%= userid %>";
        var contentid = "<%= contentid %>"
        if (<%= islogin %> == true && userid == contentid) {
            document.getElementById("modify_btn").style.display="inline-block";
            document.getElementById("delete_btn").style.display="inline-block";
        }
        else{
            document.getElementById("modify_btn").style.display="none";
            document.getElementById("delete_btn").style.display="none";
        }
        document.getElementById('modify_btn').onclick = function(){
            action_fix.submit();
        }

        document.getElementById('delete_btn').onclick = function(){
            action_delete.submit();
        }

        function toboard(){
            location.href="./Board.jsp";
        }

    </script>



</html>