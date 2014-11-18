<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<jsp:include page="../template/Header.jsp">
    <jsp:param name="title" value="Event Price Creating"/>
    <jsp:param name="heading" value="${title}"/>
    <jsp:param name="headingNote" value="Event Creating is first step to have fun"/>
    <jsp:param name="step1" value="Event"/>
    <jsp:param name="step2" value="Event Price Creating"/>
</jsp:include>--%>
<jsp:include page="../template/Header.jsp">
    <jsp:param name="title" value="Event Tsunami"/>
    <jsp:param name="heading" value="We Build All Magical Events Around The World With 50 Monkeys"/>
    <jsp:param name="headingNote" value="Do whatever you want if every events have fun"/>
    <jsp:param name="step1" value="Event"/>
    <jsp:param name="step2" value="Event Filter"/>
</jsp:include>
<%-- ====================================================== --%>
        <form method="GET" action="EventFilter.guitar">
            Title<input type="text" name="title"/>
            Start Date<input type="text" name="startDate"/>
            End Date<input type="text" name="endDate"/>
            Addresss<input type="text" name="address"/>
            <button id="filter-btn">Filter</button>
        </form>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body">
                    <table class="table table-bordered table-striped table-hover" id="example-2">
                        <thead>
                            <tr role="row">
                                <th class="middle-align">#</th>
                                <th class="middle-align">Title</th>
                                <th class="middle-align">Address</th>
                                <th class="middle-align">Start Date</th>
                                <th class="middle-align">End Date</th>
                                <th class="middle-align">Category</th>
                                <th class="middle-align">Amount People</th>
                                <th class="middle-align">Sum Price</th>
                                <th class="middle-align">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="middle-align">
                            <c:set var="count" value="1" scope="page"/>
                            <c:forEach items="${mapOfEvents}" var="i">
                                <tr>
                                    <%-- 29/01/1994 19:30 --%>
                                    <td data-event-id="${i.value.getEvent_Id()}">${count}</td>
                                    <td class="setWidth concat"><div>${i.value.getTitle()}</div></td>
                                    <td>${i.value.getAddress()}</td>
                                    <td><joda:format value="${i.value.getStartDate()}" pattern="dd MMM yyyy - HH:mm"/></td>
                                    <td><joda:format value="${i.value.getEndDate()}" pattern="dd MMM yyyy - HH:mm"/></td>
                                    <td>${i.value.getCategory().getCategoryName()}</td>
                                    <td>${i.value.getAmountPaticipants()}</td>
                                    <td>${i.value.getSumPrice()}</td>
                                    <td>
                                        <a href="#" class="btn btn-secondary btn-sm btn-icon icon-left btn-edit">Edit</a>
                                        <a href="#" class="btn btn-danger btn-sm btn-icon icon-left btn-delete">Delete</a>
                                        <a href="#" class="btn btn-info btn-sm btn-icon icon-left">Profile</a>
                                    </td>
                                </tr>
                                <c:set var="count" value="${count + 1}" scope="page"/>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            
            
            <%--
            <table border="1">
                <thead>
                    <tr>
                        <th>Event_Id</th>
                        <th>Title</th>
                        <th>Address</th>
                        <th>StartDate</th>
                        <th>EndDate</th>
                        <th>Category</th>
                        <th>Detail</th>
                        <th>Amount Paticipants</th>
                        <th>Sum Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${mapOfEvents}" var="i">
                        <tr>
                            <td>${i.value.getEvent_Id()}</td>
                            <td>${i.value.getTitle()}</td>
                            <td>${i.value.getAddress()}</td>
                            <td>${i.value.getStartDate()}</td>
                            <td>${i.value.getEndDate()}</td>
                            <td>${i.value.getCategory().getCategoryName()}</td>
                            <td><a href="JSPEventDetail?event_Id=${i.value.getEvent_Id()}">MORE INFO</a></td>
                            <td>${i.value.getAmountPaticipants()}</td>
                            <td>${i.value.getSumPrice()}</td>
                            <td>
                                <button>Edit</button>
                                <button>Update</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            --%>
            <form method="GET" action="JSPEventPrev"><button class="pre-btn" type="submit">Previous</button></form>
            <form method="GET" action="JSPEventNext"><button class="next-btn" type="submit">Next</button></form>
        </div>
        <jsp:include page="../template/Footer.jsp"/>
        
        <!-- Imported styles on this page -->
	<link rel="stylesheet" href="xenon/assets/js/datatables/dataTables.bootstrap.css">

	<!-- Bottom Scripts -->
	<script src="xenon/assets/js/bootstrap.min.js"></script>
	<script src="xenon/assets/js/TweenMax.min.js"></script>
	<script src="xenon/assets/js/resizeable.js"></script>
	<script src="xenon/assets/js/joinable.js"></script>
	<script src="xenon/assets/js/xenon-api.js"></script>
	<script src="xenon/assets/js/xenon-toggles.js"></script>
	<script src="xenon/assets/js/datatables/js/jquery.dataTables.min.js"></script>


	<!-- Imported scripts on this page -->
	<!-- <script src="xenon/assets/js/datatables/dataTables.bootstrap.js"></script> -->
	<script src="xenon/assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
	<!-- <script src="xenon/assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script> -->


	<!-- JavaScripts initializations and stuff -->
	<script src="xenon/assets/js/xenon-custom.js"></script>
    </body>
</html>