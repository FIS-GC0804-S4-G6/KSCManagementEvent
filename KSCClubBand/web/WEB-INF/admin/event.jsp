<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>Event_Id</th>
                    <th>Title</th>
                    <th>StartDate</th>
                    <th>EndDate</th>
                    <th>Logo</th>
                    <th>Cate_Id</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="" var="i">
                    <tr>
                        <td>${i.getEvent_Id()}</td>
                        <td>${i.getTitle()}</td>
                        <td>${i.getStartDate()}</td>
                        <td>${i.getEndDate()}</td>
                        <td><img src="${i.getLogo()}"/></td>
                        <td>${i.getCate_Id()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
