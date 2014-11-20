<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags"%>
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
                                <td><joda:format value="${i.value.getStartDate()}" pattern="dd MMM yyyy - HH:mm"/></td>
                                <td><joda:format value="${i.value.getEndDate()}" pattern="dd MMM yyyy - HH:mm"/></td>
                                <td>${i.value.getType()}</td>
                                <td><a href="JSPEventInfo?event_Id=${i.key}">Go Detail</a></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
<jsp:include page="../template/Footer.jsp"/>
    </body>
</html>
