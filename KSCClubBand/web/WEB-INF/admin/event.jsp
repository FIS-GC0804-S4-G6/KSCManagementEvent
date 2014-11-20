<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../template/Header.jsp">
    <jsp:param name="title" value="Event Tsunami"/>
    <jsp:param name="heading" value="We Build All Magical Events Around The World With 50 Monkeys"/>
    <jsp:param name="headingNote" value="Do whatever you want if every events have fun"/>
    <jsp:param name="step1" value="Event"/>
    <jsp:param name="step2" value="Event Filter"/>
    <jsp:param name="fullName" value="${username}"/>
</jsp:include>

        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <form method="GET" action="EventFilter.guitar" role="form" class="form-inline">
                            <div class="row col-margin">
                                    <!--BLACK BIRD-->
                                    <div class="col-xs-3">
                                        <label for="title" class="control-label">What</label>
                                    </div>

                                    <div class="col-xs-3">
                                        <label for="title" class="control-label">From Time</label>
                                    </div>

                                    <div class="col-xs-3">
                                        <label for="title" class="control-label">To Time</label>
                                    </div>

                                    <div class="col-xs-3">
                                        <label for="title" class="control-label">Address</label>
                                    </div>

                                    <!--PIGGIES-->
                                    <div class="col-xs-3">
                                        <input id="title" type="text" class="form-control" size="25" placeholder="Title" name="title"/>
                                    </div>

                                    <div class="col-xs-3">
                                        <div class="date-and-time">
                                            <input placeholder="28/09/2014" name="startDate" id="startDate" type="text" class="form-control datepicker" data-format="dd/mm/yyyy">
                                            <input name="startTime" type="text" class="form-control timepicker" data-template="dropdown" data-show-seconds="false" data-default-time="11:00 AM" data-show-meridian="true" data-minute-step="5"/>
                                        </div>
                                    </div>

                                    <div class="col-xs-3">
                                        <div class="date-and-time">
                                            <input placeholder="28/11/2014" name="endDate" id="endDate" type="text" class="form-control datepicker" data-format="dd/mm/yyyy">
                                            <input name="endTime" type="text" class="form-control timepicker" data-template="dropdown" data-show-seconds="false" data-default-time="01:00 AM" data-show-meridian="true" data-minute-step="5"/>
                                        </div>
                                    </div>

                                    <div class="col-xs-2">
                                        <input id="address" type="text" class="form-control" size="25" placeholder="Address" name="address"/>
                                    </div>

                                    <div class="col-xs-1">
                                        <button class="btn btn-blue btn-single">Filter</button>
                                    </div>
                            </div>

                        </form>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-striped table-hover" id="example-2">
                            <thead>
                                <tr role="row">
                                    <th class="middle-align">#</th>
                                    <th class="middle-align">Title</th>
                                    <th class="middle-align">Address</th>
                                    <th class="middle-align">Time</th>
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
                                        <td>
                                            Start Date: <joda:format value="${i.value.getStartDate()}" pattern="dd MMM yyyy - HH:mm"/><br/><br/>
                                            End Date: <joda:format value="${i.value.getEndDate()}" pattern="dd MMM yyyy - HH:mm"/></td>
                                        <td>${i.value.getCategory().getCategoryName()}</td>
                                        <td class="col-sm-1">${i.value.getAmountPaticipants()}</td>
                                        <td class="col-sm1">${i.value.getSumPrice()}</td>
                                        <td>
                                            <a href="#" class="btn btn-secondary btn-sm btn-icon icon-left btn-edit">Edit</a>
                                            <a href="#" class="btn btn-danger btn-sm btn-icon icon-left btn-delete">Delete</a>
                                            <a href="JSPEventInfo?event_Id=${i.value.getEvent_Id()}" class="btn btn-info btn-sm btn-icon icon-left">Profile</a>
                                        </td>
                                    </tr>
                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                </c:forEach>
                            </tbody>
                        </table>
                        <form method="GET" action="JSPEventNext"><button class="btn next-btn pull-right btn-blue" type="submit">Next</button></form>
                        <form method="GET" action="JSPEventPrev"><button class="btn pre-btn pull-right btn-blue"" type="submit">Previous</button></form>
                    </div>
                </div>
            </div>
        </div><%-- /row--%>
        <jsp:include page="../template/Footer.jsp"/>
        
        <!-- Imported styles on this page -->
        <link rel="stylesheet" href="xenon/assets/js/daterangepicker/daterangepicker-bs3.css">
        <link rel="stylesheet" href="xenon/assets/js/select2/select2.css">
        <link rel="stylesheet" href="xenon/assets/js/select2/select2-bootstrap.css">
        <link rel="stylesheet" href="xenon/assets/js/multiselect/css/multi-select.css">
	<link rel="stylesheet" href="xenon/assets/js/datatables/dataTables.bootstrap.css">

	<!-- Bottom Scripts -->
	<script src="xenon/assets/js/bootstrap.min.js"></script>
	<script src="xenon/assets/js/TweenMax.min.js"></script>
	<script src="xenon/assets/js/resizeable.js"></script>
	<script src="xenon/assets/js/joinable.js"></script>
	<script src="xenon/assets/js/xenon-api.js"></script>
	<script src="xenon/assets/js/xenon-toggles.js"></script>
        <script src="xenon/assets/js/moment.min.js"></script>
	<script src="xenon/assets/js/datatables/js/jquery.dataTables.min.js"></script>


	<!-- Imported scripts on this page -->
        <script src="xenon/assets/js/daterangepicker/daterangepicker.js"></script>
	<script src="xenon/assets/js/datepicker/bootstrap-datepicker.js"></script>
	<script src="xenon/assets/js/timepicker/bootstrap-timepicker.min.js"></script>
	<script src="xenon/assets/js/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script src="xenon/assets/js/select2/select2.min.js"></script>
	<script src="xenon/assets/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="xenon/assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="xenon/assets/js/tagsinput/bootstrap-tagsinput.min.js"></script>
	<script src="xenon/assets/js/typeahead.bundle.js"></script>
	<script src="xenon/assets/js/handlebars.min.js"></script>
	<script src="xenon/assets/js/multiselect/js/jquery.multi-select.js"></script>
	<!-- <script src="xenon/assets/js/datatables/dataTables.bootstrap.js"></script> -->
	<script src="xenon/assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
	<!-- <script src="xenon/assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script> -->


	<!-- JavaScripts initializations and stuff -->
	<script src="xenon/assets/js/xenon-custom.js"></script>
    </body>
</html>