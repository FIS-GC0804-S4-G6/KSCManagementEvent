<%-- 
    Document   : login
    Created on : 20-Nov-2014, 02:07:11
    Author     : Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form class="login" method="post" action="Customer">
            <input type="email" placeholder="email" name="email" wi/><br/>
            <input type="password" placeholder="password" name="password" /><br/>
            <select name="persistent">
                <option value="Don't Remember">Don't Remember</option>
                <option value="Remember me">Remember me</option>
            </select>
            <input type="submit" value="Login" />
        </form> 
    </body>
</html>
