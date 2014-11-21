<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../template/Header.jsp">
    <jsp:param name="title" value="Event Participants"/>
    <jsp:param name="heading" value="Participant"/>
    <jsp:param name="headingNote" value="Our Jobs Are Bringing All Fun To Everyone"/>
    <jsp:param name="step1" value="Event"/>
    <jsp:param name="step2" value="Participants"/>
    <jsp:param name="pageName" value="participant"/>
</jsp:include>

<div class="row">
    <div class="col-md-8">
        <div class="panel panel-default">
            <div class="panel-body panel-border">
                <div class="row">
                    <div class="col-sm-12">
                        <a href="JSPEventInfo?event_Id=${event_Id}" style="color: blue; text-decoration: underline;">Back</a><br/>
                        <strong>Membership</strong>

                        <table class="table table-model-2 table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>
                                        Registrant<br/>
                                        <span>Name, Email</span>
                                    </th>
                                    <th>
                                        Payment Information<br>
                                        <span>Type, Lastest Due</span>
                                    </th>
                                    <th>
                                        Registration<br/>
                                        <span>Amount, Ticket Code</span>
                                    </th>
                                    <th>
                                        Status
                                    </th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:set var="count" value="1" scope="page"/>
                                <c:forEach items="${mapCust_Events}" var="i">
                                    <tr>
                                        <td class="text-right">${count}</td>
                                        <td class="text-right">
                                            <a href="#">${i.value.getCustomer().getFullName()}</a><br/>
                                            ${i.value.getCustomer().getEmail()}
                                        </td>
                                        <td class="text-right">
                                            <em>
                                                <c:choose>
                                                    <c:when test="${i.value.getPayment_Option().getPayment_Id() == 4}">
                                                        Cash
                                                    </c:when>
                                                    <c:when test="${i.value.getPayment_Option().getPayment_Id() != 4}">
                                                        ${i.value.getPayment_Option().getPayment_Type()} - 
                                                    </c:when>
                                                </c:choose>
                                                $${i.value.getEvent_Price().getPrice()}
                                            </em>
                                        </td>
                                        <td class="text-right">
                                            Pay: <em>$${i.value.getRealPrice()}</em><br/>
                                            Ticket Code: <strong>${i.value.getTicketCode()}</strong>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${i.value.getPayment_Option().getPayment_Id() == 4}">
                                                    <em class="status no-paid">No Paid</em>
                                                </c:when>
                                                <c:when test="${i.value.getPayment_Option().getPayment_Id() != 4}">
                                                    <em class="status paid">Paid</em>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="panel panel-flat">
            <div class="panel-heading">
                <h3 class="panel-title">Sumarize</h3>
            </div>
            <table class="table table-condensed">
                <thead>
                </thead>

                <tbody>
                    <tr>
                        <th class="text-right">Resgistration Amount:</th>
                        <td>${registrationAmount} (people/person)<td>
                        
                    </tr>
                    <tr>
                        <th class="text-right">Paid Amount:</th>
                        <td>${paidAmount} (people/person)</td>
                    </tr>
                    <tr>
                        <th class="text-right">Total Price:</th>
                        <td>$${totalPrice}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div><!-- /row -->
<jsp:include page="../template/Footer.jsp"/>
    </body>
</html>
