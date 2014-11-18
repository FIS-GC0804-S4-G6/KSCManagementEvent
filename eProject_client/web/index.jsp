<%-- 
    Document   : index
    Created on : Jun 23, 2014, 3:39:50 PM
    Author     : Mike
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome to KSCEvent School</title>
        <link rel="stylesheet" type="text/css" href="lib/css/superslides.css" />
        <link rel="stylesheet" type="text/css" href="lib/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="lib/css/main.css" />
    </head>
    <body>
        <ul class="header">
            <li id="logo" class="multicolore">
                <a href="index.jsp"><i class="fa fa-heart-o"></i>&nbsp;KSCEvent</a>
            </li>
        </ul>
        <ul class="menu multicolore">
            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
                    response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
                    response.addHeader("Pragma", "no-cache");
                    response.addDateHeader("Expires", 0);
            %>
            <%--<jsp:include page="/showEvent" flush="true"></jsp:include>--%>
            <li><a href="${pageContext.request.contextPath}/showEvent"><i class="fa fa-calendar"></i>&nbsp;Event</a></li>
            <li><a href="#"><i class="fa fa-university"></i>&nbsp;About</a></li>
            <li><a href="#"><i class="fa fa-search"></i>&nbsp;Search</a></li> 
            <li class="dropdown">
                <a href="#"><i class="fa fa-user"></i>&nbsp;<%= username%></a>
                <a href="index.jsp" id="login">
                    <i class="fa fa-times-circle"></i>&nbsp;Logout
                </a>
            </li>
            <%
            } else {
                response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
                response.addHeader("Pragma", "no-cache");
                response.addDateHeader("Expires", 0);
            %>
            <li><a href="${pageContext.request.contextPath}/showEvent"><i class="fa fa-calendar"></i>&nbsp;Event</a></li>
            <li><a href="#"><i class="fa fa-university"></i>&nbsp;About</a></li>
            <li><a href="#"><i class="fa fa-search"></i>&nbsp;Search</a></li> 
            <li><a href="login.jsp" id="login"><i class="fa fa-gittip"></i>&nbsp;Log In</a></li>
            <li><a href="signup.jsp"><i class="fa fa-user"></i>&nbsp;Sign Up</a></li>
                <%
                    }
                %>
        </ul>

        <div id="slides">
            <ul class="slides-container">
                <li>
                    <img src="lib/img/people.jpeg">
                    <div class="container">
                        <h1>Hello, World</h1>
                    </div>
                    <div class="contrast">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<a href="#"><i class="fa fa-chevron-right fa-1x"></i></a></p>
                    </div>
                </li>
                <li>
                    <img src="lib/img/cinelli-front.jpeg">
                    <div class="container">
                        <h1>Hello, World</h1>
                    </div>
                    <div class="contrast">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<a href="#"><i class="fa fa-chevron-right fa-1x"></i></a></p>
                    </div>
                </li>
                <li>
                    <img src="lib/img/cinelli.jpeg">
                    <div class="container">
                        <h1>Hello, World</h1>
                    </div>
                    <div class="contrast">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<a href="#"><i class="fa fa-chevron-right fa-1x"></i></a></p>
                    </div>
                </li>
                <li>
                    <img src="lib/img/surly.jpeg">
                    <div class="container">
                        <h1>Hello, World</h1>
                    </div>
                    <div class="contrast">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum. <a href="#"><i class="fa fa-chevron-right fa-1x"></i></a></p>
                    </div>
                </li>
            </ul>
            <nav class="slides-navigation">
                <a href="#" class="next">
                    <i class="fa fa-chevron-circle-right fa-4x"></i>
                </a>
                <a href="#" class="prev">
                    <i class="fa fa-chevron-circle-left fa-4x"></i>
                </a>
            </nav>
        </div>
        <script type="text/javascript" src="lib/js/jquery-2.1.1.js"></script>
        <script type="text/javascript" src="lib/js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="lib/js/jquery.animate-enhanced.min.js"></script> 
        <script type="text/javascript" src="lib/js/jquery.superslides.min.js"></script> 
        <script type="text/javascript" src="lib/js/script.js"></script>
    </body>
</html>
