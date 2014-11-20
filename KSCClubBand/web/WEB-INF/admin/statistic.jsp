<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../template/Header.jsp">
    <jsp:param name="title" value="Events Each Month"/>
    <jsp:param name="heading" value="You Must Always Plan Everything Or Go To Die"/>
    <jsp:param name="headingNote" value="This Page May Help You"/>
    <jsp:param name="step1" value="Statistic"/>
    <jsp:param name="step2" value="Event"/>
</jsp:include>
<div class="row">
    <div class="col-md-8">
        <h5>You Know How Hard It Can Be. Just Make It Easy</h5>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Year: ${currentYear}</h3>
            </div>
            <table class="table table-striped table-bordered">
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
                            <td>$${i.value}</td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <td>Amount Participants<br/>(person/people)</td>
                        <c:forEach items="${mapAmountParticipants}" var="p">
                            <td>${p.value}</td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <td>Amount Events<br/></td>
                        <c:forEach items="${mapAmountEvents}" var="a">
                            <td><a href="SelectAmountClassifyEventsMonth?year=${currentYear}&month=${a.key}">${a.value}</a></td>
                        </c:forEach>
                    </tr>
                </tbody>
            </table>
                <a href="JSPPrevSumPriceEveryMonthOfYear?currentYear=${currentYear}"><button class="btn btn-orange">Prev</button></a>
            <a href="JSPNextSumPriceEveryMonthOfYear?currentYear=${currentYear}"><button class="btn btn-orange">Next</button></a>
        </div>
    </div>
     <div class="col-sm-4">
        <c:if test="${not empty mapAmountClassifyEventsMonth}">
            <h5>Classify Events</h5>								
            <div class="list-group list-group-minimal"><!-- Add class "list-group-minimal" for less padding between list items -->
                <%
                    String[] colorsClassCSS = {"badge-info", "badge-danger", "badge-success", "badge-warning"};
                    int i = 0;
                %>
                <c:forEach items="${mapAmountClassifyEventsMonth}" var="b">
                    <a href="#" class="list-group-item">
                        <span class="badge <%=colorsClassCSS[i]%>">${b.value}</span>
                        ${b.key}
                    </a>
                    <% i++;%>
                </c:forEach>
                <a href="SelectClassifyEventsMonth?year=${currentYear}&month=${month}" class="list-group-item">
                    <button class="btn btn-turquoise">Get Detail</button>
                </a>
            </div>
        </c:if>
    </div>
</div>
<jsp:include page="../template/Footer.jsp"/>
    </body>
</html>
