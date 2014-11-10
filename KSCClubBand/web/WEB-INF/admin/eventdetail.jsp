<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>event detail</title>
    </head>
    <body>
        <h1>${entity.getTitle()}</h1>
        <div>
            <img src="img/${entity.getLogo()}"/>
            <a href="ThrowLogoAway.oneandoneistwo" data-event_Id="${entity.getEvent_Id()}">Remove</a>
            <form method="POST" action="UploadLogo" enctype="multipart/form-data">
                <input type="hidden" name="event_Id" value="${entity.getEvent_Id()}"/>
                Browse<input type="file" name="logo" accept="image/*"/>
                <button type="submit">Upload Logo</button>
            </form>
        </div>
    </body>
</html>
