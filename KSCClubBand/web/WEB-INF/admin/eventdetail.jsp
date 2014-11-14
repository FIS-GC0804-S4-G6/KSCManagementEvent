<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>event detail</title>
        <style>
            label{
                font-weight: bold;
            }
            p {
                display: inline;
            }
            .participants td:first-child {
                color: blue;
                text-decoration: underline;
                cursor: pointer;
            }
        </style>
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
                <ul>
                    <li><a href="JSPEventDetail">Common Information</a></li>
                    <li><a href="JSPEventDetailTicket">Ticket</a></li>
                    <li><a href="JSPEventDetailParticipants">Participants</a></li>
                </ul>
        <div>
            <c:choose>
                <c:when test="${tab == 'detail'}">
                    <label>Description: </label>
                    <p>${entity.getDescription()}</p><br/>
                    <label>Speaker: </label>
                    <p>${entity.getSpeaker()}</p><br/>
                    <label>Category: </label>
                    <p>${entity.getCategory().getCategoryName()}</p><br/>
                    <label>Address: </label>
                    <p>${entity.getAddress()}</p><br/>
                    <label>Start Date: </label>
                    <p>${entity.getStartDate()}</p><br/>
                    <label>End Date: </label>
                    <p>${entity.getEndDate()}</p><br/>
                    <label>Slogan</label>
                    <p>${entity.getSlogan()}</p><br/>
                </c:when>
                <c:when test="${tab == 'event_price'}">
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
                </c:when>
                <c:when test="${tab == 'participants'}">
                    <table class="participants">
                        <thead>
                            <tr>
                                <th>Email</th>
                                <th>Ticket Code</th>
                                <th>Payment Type</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${mapOfCust_Events}" var="i">
                                <tr>
                                    <td>${i.value.getCustomer().getEmail()}</td>
                                    <td>${i.value.getTicketCode()}</td>
                                    <td>${i.value.getPayment_Option().getPayment_Type()}</td>
                                    <td>${i.value.getRealPrice()}</td>
                                    <td>
                                        <form action="JSPParticipantsEditing" method="POST">
                                            <input type="hidden" name="event_Id" value="${event_Id}"/>
                                            <input type="hidden" name="ticketCode" value="${i.value.getTicketCode()}"/>
                                            <button type="submit">Edit</button>
                                        </form>
                                        <a href="#">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:when test="${tab == 'participant_edit'}">
                    <form method="POST" action="ParticipantEditing" id="lonelyNight">
                        <input type="hidden" name="event_Id" value="${event_Id}"/>
                    </form>
                    <table>
                        <thead>
                            <tr>
                                <th>Email</th>
                                <th>Ticket Code</th>
                                <th>Payment Type</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>email not modify</td>
                                <td>${ticketCode}</td>
                                <td>
                                    <option name="payment_Id">
                                        <c:forEach items="${mapOfPayment_Options}" var="p">
                                            <c:if test="${p.getPayment_Id() == payment_Id}">
                                                <select value="${p.getPayment_Id()}" selected>${p.getPayment_Type()}</select>
                                            </c:if>
                                            <c:if test="${p.getPayment_Id() != payment_Id}">
                                                <select value="${p.getPayment_Id()}" selected>${p.getPayment_Type()}</select>
                                            </c:if>
                                        </c:forEach>
                                    </option>
                                </td>
                                <td><input type="text" name="price" form="lonelyNight"/></td>
                                <td>
                                    <button type="submit" form="lonelyNight">Save</button>
                                    <button>Cancel</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </c:when>
            </c:choose>
        </div>
    </body>
</html>
