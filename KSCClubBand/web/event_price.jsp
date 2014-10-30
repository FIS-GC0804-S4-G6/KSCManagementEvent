<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>Number</th>
                    <th>Price</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listOfEvent_Prices}" var="i">
                    <tr>
                        <td>${i.getPrice_Id()}</td>
                        <td>${i.getPrice()}</td>
                        <td>${i.getDescription()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
