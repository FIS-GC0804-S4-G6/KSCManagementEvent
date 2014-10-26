<%-- 
    Document   : eventcreating
    Created on : Oct 26, 2014, 8:12:31 PM
    Author     : hai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Creating</title>
    </head>
    <body>
        <form method="get" action="/eventcreating">
            Title<input type="text" name="title"/><br/>
            Logo<input type="image" name="logo"/><br/>
            Description<textarea name="description"></textarea><br/>
            Speaker<input type="text" name="speaker"/><br/>
            Address<textarea name="address"></textarea><br/>
            Slogan<input type="text" name="slogan"/><br/>
            StartDate<input type="datetime" name="startdate"/><br/>
            EndDate<input type="datetime" name="enddate"/><br/>
            Hometag:<br/>
                Yes<input type="radio" name="hometag" value="yes"/>
                No<input type="radio" name="hometag" value="no"/><br/>
                <button type="submit">Submit</button>
        </form>
    </body>
</html>
