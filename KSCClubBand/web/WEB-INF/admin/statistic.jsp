<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistic Page</title>
    </head>
    <body>
        Year: ${currentYear}
        <table border="1">
            <thead>
                <tr>
                    <th>Month</th>
                    <c:forEach items="${mapSumPrices}" var="i">
                        <th>${i.key}</th>
                    </c:forEach>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Sum Price</td>
                    <c:forEach items="${mapSumPrices}" var="i">
                        <td>${i.value}</td>
                    </c:forEach>
                </tr>
                <tr>
                    <td>Amount Participants Each Month</td>
                    <c:forEach items="${mapAmountParticipants}" var="p">
                        <td>${p.value}</td>
                    </c:forEach>
                </tr>
                <tr>
                    <td>Amount Events Each Month</td>
                    <c:forEach items="${mapAmountEvents}" var="a">
                        <td><a href="SelectAmountClassifyEventsMonth?year=${currentYear}&month=${a.key}">${a.value}</a></td>
                    </c:forEach>
                </tr>
            <tbody>
        </table>
        <a href="JSPPrevSumPriceEveryMonthOfYear?currentYear=${currentYear}">Prev</a>
        <a href="JSPNextSumPriceEveryMonthOfYear?currentYear=${currentYear}">Next</a>
        <c:if test="${not empty mapAmountClassifyEventsMonth}">
            <ul>
                <c:forEach items="${mapAmountClassifyEventsMonth}" var="b">
                    <li>${b.key}: ${b.value}</li>
                </c:forEach>
                <a href="SelectClassifyEventsMonth?year=${currentYear}&month=${month}">Get Detail</a>
            </ul>
        </c:if>
    </body>
</html>
