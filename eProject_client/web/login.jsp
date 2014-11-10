<%-- 
    Document   : login
    Created on : Nov 4, 2014, 10:20:38 PM
    Author     : Mike
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - KSCEvent</title>
        <link rel="stylesheet" type="text/css" href="lib/css/style_login.css" />	
    </head>
    <body onload="noBack();">
        <div class="body"></div>
        <div class="grad"></div>
        <div class="header">
            <a href="index.jsp"><span class="randomText">Login</span><br/><span>KSCEvent</span></a>
        </div>
        <br/>
        <form class="login" method="post" action="authentication?act=login">
            <input type="email" placeholder="email" name="email" /><br/>
            <input type="password" placeholder="password" name="password" /><br/>
            <select name="persistent">
                <option value="Don't Remember">Don't Remember</option>
                <option value="Remember me">Remember me</option>
            </select>
            <input type="submit" value="Login" />
            <a href="signup.jsp"><input type="button" value="Let's Signup" /></a>
        </form>
        <script type="text/javascript" src="lib/js/jquery-2.1.1.js"></script>
        <script type="text/javascript" src="lib/js/prefixfree.min.js"></script>
        <script type="text/javascript" src="lib/js/script.js"></script>
    </body>
</html>
