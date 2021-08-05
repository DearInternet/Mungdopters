<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<meta charset="UTF-8">

<html>

    <head>

        <title>Entrance_Info</title>

    </head>
    
    <style type="text/css">
        
        *{
            padding: 0;
            margin: 0;
        }
    </style>

    <body>
        <div id="header">
            <jsp:include page="MyhomepageHeader.jsp"></jsp:include>
        </div>

        <div id="Entrance_Image">
            <img src="./addition/EntranceInfo.jpg">
        </div>

        <div id="footer">
        <jsp:include page="MyhomepageFooter.jsp"></jsp:include>
        </div>
    </body>




</html>