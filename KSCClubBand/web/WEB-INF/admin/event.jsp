<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>event</title>
        <style>
            img {
                width: 110px;
                height: 110px;
            }
        </style>
    </head>
    <body>
        <form method="GET" action="FilterEvent.guitar">
            Title<input type="text" name="title"/>
            <button id="filter-btn">Filter</button>
        </form>
        
        <table>
            <thead>
                <tr>
                    <th>Event_Id</th>
                    <th>Title</th>
                    <th>StartDate</th>
                    <th>EndDate</th>
                    <th>Cate_Id</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${mapOfEvents}" var="i">
                    <tr>
                        <td>${i.value.getEvent_Id()}</td>
                        <td>${i.value.getTitle()}</td>
                        <td>${i.value.getStartDate()}</td>
                        <td>${i.value.getEndDate()}</td>
                        <td>${i.value.getCate_Id()}</td>
                        <td><a href="JSPEventDetail?event_Id=${i.value.getEvent_Id()}">MORE INFO</a></td>
                        <td>
                            <button>Edit</button>
                            <button>Update</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
