<%-- 
    Document   : eventDetail
    Created on : 11-Nov-2014, 22:18:28
    Author     : Nguyen
--%>

<%@page import="java.util.Random"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome to KSC Event School</title>
        <link rel="stylesheet" type="text/css" href="lib/css/superslides.css" />
        <link rel="stylesheet" type="text/css" href="lib/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="lib/css/event_detail.css" />
        <link rel="stylesheet" type="text/css" href="lib/css/normalize.css">
    </head>
    <body>
        <div class="navbar">
            <ul class="header">
                <li id="logo" class="multicolore">
                    <a href="index.html"><i class="fa fa-heart-o"></i>&nbsp;KSCEvent</a>
                </li>
            </ul>
            <ul class="menu multicolore">
                <li><a href="${pageContext.request.contextPath}/showEvent"><i class="fa fa-calendar"></i>&nbsp;Event</a></li>
                <li><a href="#"><i class="fa fa-university"></i>&nbsp;About</a></li>
                <li><a href="#"><i class="fa fa-search"></i>&nbsp;Search</a></li>
                <li><a href="login.jsp" id="login"><i class="fa fa-gittip"></i>&nbsp;Log In</a></li>
                <li><a href="signup.jsp"><i class="fa fa-user"></i>&nbsp;Sign Up</a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
        <div class="event-item iCielCadena">
            <h1 class="title">
                ${title}
            </h1>
            <h3 class="slogan center">
                ${slogan}
            </h3>
            <div class="category">
                <div id="bigPic">
                    <img alt="" src="lib/img/${logo}"/>
                    <c:forEach items="${listEvtPic}" var="ep">
                        <img alt="" src="lib/img/${ep.getPicturePath()}">
                    </c:forEach>
                </div>

                <ul id="thumbs">
                    <c:forEach items="${listEvtPic}" var="ep">
                        <li rel="2"><img alt="" src="lib/img/${ep.getPicturePath()}"> </li>
                        </c:forEach>
                    <!-- <li class="active" rel="1"><img alt="" src="imgs/1_thumb.jpg"></li>-->
                </ul>
            </div>
        </div>

        <div class="content">
            <div id="detail">
                <h3>Information:</h3>
                <p>Speaker: <span>${speaker}</span></p>
                <p>Start Date: <span>${startDate}</span></p>
                <p>End Date: <span>${endDate}</span></p>
                <p>Category: <span>${evtCate}</span></p>
                <p>Description: <span>${description}</span></p>
                <p>Address: <span>${address}</span></p>
                <p>Price: 

                    <c:forEach items="${price}" var="p" >
                        <span>
                            <a class="a_demo_two" id="${p.getPrice_Id()}" href="#payment">${p.getPrice()}</a>
                        </span>

                    </c:forEach>
                </p>
            </div>

            <br/>
            <h3 id="titleMember">List Member:</h3>
            <table id="member" align="center" cellpadding="1" cellspacing="1">
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

            <div id="payment" class="paymentJoin">
                <p class="payTitle"> Pay and Join</p>
                <a href="#" class="close"><img src="lib/img/close.png" class="img-close" title="Close Window" alt="Close" /></a>
                <form method="post" class="paymentContent" action="showEventDetail?act=eventDetail">
                    <label class="price">
                        <span>Price:</span>
                        <!--<p id="pId" name="priceId"></p>-->
                        <!--<p class="setPrice" name="price">0</p>-->

                        <input id="pId" name="priceId" type="hidden"/>
                        <label for="price"></label>
                        <input id="price" class="setPrice" name="price" type="hidden"/>
                    </label>
                    <label>
                        <%
                            Random rand = new Random();
                            int randomnumber = rand.nextInt(90000) + 10000;
                        %>
                        <span>Ticket code:</span>
                        <label for="ticketcode"></label>
                        <input value="<%=randomnumber%>" id="ticketCode" type="text" name="ticketcode" type="hidden"/>
                    </label>
                    <label class="paymentType">
                        <span>Payment Type:</span>
                        <select name="paymentId">
                            <c:forEach items="${listPaymentType}" var="p">
                                <option value="${p.getPayment_Id()}">${p.getPaymentType()}</option>
                            </c:forEach>
                        </select>
                    </label>
                    <label>
                        <!--<button class="button submit-button" type="button" value="">Pay & Join</button>-->      
                        <input type="submit" class="button submit-button" value="Pay & Join"/>
                    </label>
                </form>
            </div>
        </div>
        <br/><br/>
        <script type="text/javascript" src="lib/js/jquery-2.1.1.js"></script>
        <script type="text/javascript" src="lib/js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="lib/js/jquery.animate-enhanced.min.js"></script>
        <script type="text/javascript" src="lib/js/jquery.superslides.min.js"></script> 
        <script type="text/javascript" src="lib/js/eventDetail.js"></script>
    </body>
</html>