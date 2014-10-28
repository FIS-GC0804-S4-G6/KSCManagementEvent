<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Creating</title>
        <link rel="stylesheet" href="rome-datetime/dist/rome.css"/>
        <link rel="stylesheet" href="rome-datetime/example/example.css"/>
    </head>
    <body>
        <form method="get" action="EventCreating">
            Title<input type="text" name="title"/><br/>
            Logo<input type="file" name="logo" accept="image/*"/><br/>
            Description<textarea name="description"></textarea><br/>
            Speaker<input type="text" name="speaker"/><br/>
            Address<textarea name="address"></textarea><br/>
            Slogan<input type="text" name="slogan"/><br/>
            <div class='parent'>
                <label for='st'>Starting Time: </label>
                <input id='st' class='input' type="text" name="starttime"/>
            </div>
            <div class='parent'>
                <label for='et'>Ending Time: </label>
                <input id='et' class='input' type="text" name="endtime"/>
            </div>
            <select name="cate_Id">
                <c:forEach items="${listOfCategories}" var="c">
                    <option value="${c.getCate_Id()}">${c.getCategoryName()}</option>
                </c:forEach>
            </select>
            <button type="submit">Submit</button>
        </form>

        <script type="text/javascript" src="rome-datetime/dist/rome.js"></script>
        <script type="text/javascript" src="rome-datetime/example/example.js"></script>
    </body>
</html>
