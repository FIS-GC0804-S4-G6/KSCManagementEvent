<%-- 
    Document   : event
    Created on : 18-Nov-2014, 03:05:57
    Author     : Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome to KSCEvent School</title>
        <link rel="stylesheet" type="text/css" href="lib/css/superslides.css" />
        <link rel="stylesheet" type="text/css" href="lib/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="lib/css/event.css" />
    </head>
    <body>
        <div class="navbar">
            <ul class="header">
                <li id="logo" class="multicolore">
                    <a href="index.html"><i class="fa fa-heart-o"></i>&nbsp;KSCEvent</a>
                </li>
            </ul>
            <ul class="menu multicolore">
                <li><a href="${pageContext.request.contextPath}/showEvent"><i class="fa fa-calendar"></i>&nbsp;Event</a></li>
                <li><a href="#"><i class="fa fa-university"></i>&nbsp;About</a></li>
                <li><a href="#"><i class="fa fa-search"></i>&nbsp;Search</a></li>
                <li><a href="login.html" id="login"><i class="fa fa-gittip"></i>&nbsp;Log In</a></li>
                <li><a href="signup.html"><i class="fa fa-user"></i>&nbsp;Sign Up</a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
        <div class="event-item">
            <ul class="item">
                <c:forEach items="${listEvents}" var="e">
                    <li>
                        <a href="#"><h2 class="multicolore">${e.getTitle()}</h2></a>
                        <img src="${e.getLogo()}"/>
                        <p>
                            ${e.getDescription()}
                        </p>
                        <a href="${pageContext.request.contextPath}/showEventDetail"><i class="fa fa-angle-right fa-4x" id="${e.getEvent_Id()}"></i></a>
                    </li>
                </c:forEach>
<!--                <li>
                    <img src="lib/img/icon.jpg" />
                    <a href="#"><h2 class="multicolore">Hello, World</h2></a>
                    <span>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    </span>
                    <a href="#"><i class="fa fa-angle-right fa-4x"></i></a>
                </li>-->
            </ul>
        </div>

        <script type="text/javascript" src="lib/js/jquery-2.1.1.js"></script>
        <script type="text/javascript" src="lib/js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="lib/js/jquery.animate-enhanced.min.js"></script> 
        <script type="text/javascript" src="lib/js/jquery.superslides.min.js"></script> 
        <script type="text/javascript" src="lib/js/script.js"></script>
    </body>
</html>
