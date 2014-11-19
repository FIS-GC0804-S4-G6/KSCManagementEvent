<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../template/Header.jsp">
    <jsp:param name="title" value="Event Detail"/>
    <jsp:param name="heading" value="${entity.getTitle()}"/>
    <jsp:param name="headingNote" value="Dig a hole and you'll get the treasure. These are all Infomation from Event"/>
    <jsp:param name="step1" value="Event"/>
    <jsp:param name="step2" value="Event Filter"/>
    <jsp:param name="pageName" value="event-info"/>
</jsp:include>
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <button class="btn btn-primary">Edit</button>
                        <button class="btn btn-secondary">Delete Event</button>
                        <button class="btn btn-purple">Active</button>
                        <button class="btn btn-pink">Ticket</button>
                        <button class="btn btn-orange">Participants</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="col-md-4">
                    <div class="panel panel-color panel-success"><!-- Add class "collapsed" to minimize the panel -->
                        <div class="panel-heading">
                            <h3 class="panel-title">Basic Information</h3>
                        </div>

                        <div class="panel-body">
                            <div class="panel panel-flat">
                                <table class="table table-condensed">
                                    <tbody>
                                        <tr>
                                            <th class="text-right">Title:</th>
                                            <td>${entity.getTitle()}</td>
                                        </tr>
                                        <tr>
                                            <th class="text-right">Category</th>
                                            <td>${entity.getCategory().getCategoryName()}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div><%-- /panel-body --%>
                    </div>

                </div>

                <div class="col-md-4">
                    <div class="panel panel-color panel-warning"><!-- Add class "collapsed" to minimize the panel -->
                        <div class="panel-heading">
                            <h3 class="panel-title">Where and When</h3>
                        </div>

                        <div class="panel-body">
                            <div class="panel panel-flat">
                                <table class="table table-condensed">
                                    <tbody>
                                        <tr>
                                            <th class="text-right">Start Date:</th>
                                            <td><joda:format value="${entity.getStartDate()}" pattern="dd MMM yyyy - HH:mm"/></td>
                                        </tr>
                                        <tr>
                                            <th class="text-right">End Date:</th>
                                            <td><joda:format value="${entity.getEndDate()}" pattern="dd MMM yyyy - HH:mm"/></td>
                                        </tr>
                                        <tr>
                                            <th class="text-right">Address:</th>
                                            <td>${entity.getAddress()}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                    
                <div class="col-md-4">
					
                    <!-- Colored panel, remember to add "panel-color" before applying the color -->
                    <div class="panel panel-color panel-purple"><!-- Add class "collapsed" to minimize the panel -->
                        <div class="panel-heading">
                            <h3 class="panel-title">Speaker and Slogan</h3>
                        </div>

                        <div class="panel-body">
                            <div class="panel panel-flat">
                                <table class="table table-condensed">
                                    <tbody>
                                        <tr>
                                            <th class="text-right">Speaker:</th>
                                            <td>${entity.getSpeaker()}</td>
                                        </tr>
                                        <tr>
                                            <th class="text-right">Slogan:</th>
                                            <td>${entity.getSlogan()}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><%-- /row --%>
        
        <div class="row">
            <div class="col-sm-6">
                <div class="panel panel-color panel-danger"><!-- Add class "collapsed" to minimize the panel -->
                    <div class="panel-heading">
                        <h3 class="panel-title">Logo</h3>
                    </div>

                    <div class="panel-body">
                        <script type="text/javascript">
			// Sample Javascript code for this page
			jQuery(document).ready(function($)
			{
				// Edit Modal
				$('.gallery-env a[data-action="edit"]').on('click', function(ev)
				{
					ev.preventDefault();
					$("#gallery-image-modal").modal('show');
				});
				
				// Delete Modal
				$('.gallery-env a[data-action="trash"]').on('click', function(ev)
				{
					ev.preventDefault();
					$("#gallery-image-delete-modal").modal('show');
				});
			});
			</script>
                        <%-- bap cai cai bap --%>
                        <section class="gallery-env">
                            <div class="row">
                                <!-- Gallery Album Optipns and Images -->
                                <div class="col-sm-9 gallery-left">
                                    <!-- Album Images -->
                                    <div class="album-images row">
                                        <!-- Album Image -->
                                        <div class="col-md-9 col-sm-4 col-xs-6">
                                            <div class="album-image">
                                                <a href="#" class="thumb" data-action="edit">
                                                    <c:if test="${empty entity.getLogo()}">
                                                        <img src="xenon/assets/images/album-img-1.png" class="img-responsive" />
                                                    </c:if>
                                                    <c:if test="${not empty entity.getLogo()}">
                                                        <img src="img/${entity.getLogo()}"/>
                                                    </c:if>
                                                </a>

                                                <a href="#" class="name">
                                                    <c:if test="${empty entity.getLogo()}">
                                                        <span>album-img-1.png</span>
                                                    </c:if>
                                                    <c:if test="${not empty entity.getLogo()}">
                                                        <span>${entity.getLogo()}</span>
                                                    </c:if>
                                                </a>

                                                <div class="image-options">
                                                    <a href="#" data-action="edit"><i class="fa-pencil"></i></a>
                                                    <a href="#" data-action="trash"><i class="fa-trash"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
			</section>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-color panel-info"><!-- Add class "collapsed" to minimize the panel -->
                    <div class="panel-heading">
                        <h3 class="panel-title">Description</h3>
                    </div>

                    <div class="panel-body">
                        <p>${entity.getDescription()}</p>
                    </div>
                </div>
            </div>
        </div>
<jsp:include page="../template/Footer.jsp"/>
<div class="modal fade" id="gallery-image-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-gallery-image">
                <c:if test="${empty entity.getLogo()}">
                    <img src="xenon/assets/images/album-image-full.jpg" class="img-responsive"/>
                </c:if>
                <c:if test="${not empty entity.getLogo()}">
                    <img src="img/${entity.getLogo()}" class="img-responive"/>
                </c:if>
            </div>

            <div class="modal-footer modal-gallery-top-controls">
                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

        <!-- Bottom Scripts -->
	<script src="xenon/assets/js/bootstrap.min.js"></script>
	<script src="xenon/assets/js/TweenMax.min.js"></script>
	<script src="xenon/assets/js/resizeable.js"></script>
	<script src="xenon/assets/js/joinable.js"></script>
	<script src="xenon/assets/js/xenon-api.js"></script>
	<script src="xenon/assets/js/xenon-toggles.js"></script>

        <!-- Imported scripts on this page -->
	<script src="assets/js/jquery-ui/jquery-ui.min.js"></script>

	<!-- JavaScripts initializations and stuff -->
	<script src="xenon/assets/js/xenon-custom.js"></script>

    </body>
</html>
<%-- Danh sung tay luon --%>