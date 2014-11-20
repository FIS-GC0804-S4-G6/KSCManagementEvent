<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Classify Event</title>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Type</th>
                    <th>Info</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty mapClassifyEvents}">
                    <tr>
                        <td colspan="4">No Data</td>
                    </tr>
                </c:if>
                <c:if test="${not empty mapClassifyEvents}">
                    <c:forEach items="${mapClassifyEvents}" var="i">
                        <tr>
                            <td>${i.value.getTitle()}</td>
                            <td>${i.value.getStartDate()}</td>
                            <td>${i.value.getEndDate()}</td>
                            <td>${i.value.getType()}</td>
                            <td><a href="JSPEventInfo?event_Id=${i.key}">Go Detail</a></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </tbody>
        </table>
    </body>
</html>
