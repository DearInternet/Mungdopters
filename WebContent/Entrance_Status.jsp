<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
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

        #progress_bar_div {
            background: #fff;
            width: 100%;
            margin-top: 200px;
            height: 1500px;
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
    border: 4px solid #7d7d7d;
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
     background-color: #7d7d7d;
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
    background-color: #55b776;
}

/* li class - active일시 pseudo 설정  */

#progress_bar_ul li.active::before {
    background: #55b776  url(user.svg) no-repeat center center;
    background-size: 60%;
}
#progress_bar_ul li::before {
    background: #fff url(user.svg) no-repeat center center;
    background-size: 60%;
}
    </style>

    <body>
        <div id="header">
            <jsp:include page="MyhomepageHeader.jsp"></jsp:include>
        </div>

        <div id="progress_bar_div">
            <ul id="progress_bar_ul">
              <li>입소 신청 완료</li>
              <li class="active">입소 신청서 확인</li>
              <li>입소 신청서 검토</li>
              <li>입소 상담</li>
              <li>입소 완료</li>
            </ul>
        </div>

        <div id="footer">
        <jsp:include page="MyhomepageFooter.jsp"></jsp:include>
        </div>
    </body>




</html>