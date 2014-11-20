<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Signup - KSCEvent</title>
        <link rel="stylesheet" type="text/css" href="lib/css/style_signup.css" />	
    </head>
    <body>
        <div class="body"></div>
        <div class="grad"></div>
        <div class="header">
            <a href="${pageContext.request.contextPath}/homeEvent"><span class="randomText">Register</span><br/><span>KSCEvent</span></a>
        </div>
        <br/>
        <form class="signup" method="post" action="authentication?act=signup">
            <input type="text" placeholder="full name" name="fullname" /><br/>
            <input type="email" placeholder="email" name="email" /><br/>
            <input type="password" placeholder="password" name="password" /><br/>
            <input type="password" placeholder="password" name="repassword" /><br/>
            <select name="gender">
                <option value="true">Male</option>
                <option value="false">Female</option>
            </select>
            <input type="submit" value="Signup" />
            <a href="login.jsp"><input type="button" value="Back Login" /></a>
            <c:if test="${!empty(msgR)}" >
                <h3 style="color:red;">${msgR}</h3>
            </c:if>
            <c:if test="${!empty(msgB)}" >
                <h2 style="color:#5379fa;">${msgB}</h2>
            </c:if>
        </form>	
        <script type="text/javascript" src="js/jquery-2.1.1.js"></script>
        <script type="text/javascript" src="js/prefixfree.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>


