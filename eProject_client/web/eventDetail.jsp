<%-- 
    Document   : eventDetail
    Created on : 11-Nov-2014, 22:18:28
    Author     : Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <td>Title</td>
                <td>
                    ${title}
                </td>
            </tr>
            <tr>
                <td>Description</td>
                <td>${description}</td>
            </tr>
            <tr>
                <td>Speaker</td>
                <td>${speaker}</td>
            </tr>
            <tr>
                <td>Address</td>
                <td>${address}</td>
            </tr>
            <tr>
                <td>Slogan</td>
                <td>${slogan}</td>
            </tr>
            <tr>
                <td>Start Date</td>
                <td>${startDate}</td>
            </tr>
            <tr>
                <td>End Date</td>
                <td>${endDate}</td>
            </tr>
            <tr>
                <td>Category</td>
                <td>${evtCate}</td>
            </tr>
            <tr>
                <td>Price</td>
                <td>
                    <c:forEach items="${price}" var="p" >
                        ${p.getPrice()}
                    </c:forEach>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>Avatar</td>
                <td>Full Name</td>
                <td>Email</td>
                <td>Payment Type</td>
            </tr>

            <c:forEach items="${listCusEvt}" var="c">
                <tr>
                    <td>${c.getAvatar()}</td>
                    <td>${c.getFullName()}</td>             
                    <td>${c.getEmail()}</td>
                    <td>${c.getPaymentType()}</td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
