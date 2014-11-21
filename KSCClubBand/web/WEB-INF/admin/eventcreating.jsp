<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../template/Header.jsp">
    <jsp:param name="title" value="Event Creating"/>
    <jsp:param name="heading" value="Event Creating"/>
    <jsp:param name="headingNote" value="Event Creating is first step to have fun"/>
    <jsp:param name="step1" value="Event"/>
    <jsp:param name="step2" value="Filter Event"/>
</jsp:include>
        <div class="row">
            <div class="col-sm-10">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Typeahead Suggestions</h3>
                        <div class="panel-options">
                            <a href="#" data-toggle="panel">
                                <span class="collapse-icon">&ndash;</span>
                                <span class="expand-icon">+</span>
                            </a>
                            <a href="#" data-toggle="remove">&times;</a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <form method="POST" action="EventCreating" class="form-horizontal" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="field-1">Title</label>
                                <div class="col-sm-10">
                                    <input type="text" name="title" class="form-control" id="field-1" placeholder="Title"/>
                                </div>
                            </div>
                            <div class="form-group-separator"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="field-4">Logo</label>

                                <div class="col-sm-10">
                                    <input type="file" name="logo" accept="image/*" class="form-control" id="field-4" placeholder="logo">
                                </div>
                            </div>
                            <div class="form-group-separator"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="field-5">Description</label>

                                <div class="col-sm-10">
                                    <textarea class="form-control" name="description" cols="5" id="field-5" placeholder="Description"></textarea>
                                </div>
                            </div>
                            <div class="form-group-separator"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="field-1">Speaker</label>
                                <div class="col-sm-10">
                                    <input type="text" name="speaker" class="form-control" id="field-1" placeholder="Speaker"/>
                                </div>
                            </div>
                            <div class="form-group-separator"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="field-5">Address</label>

                                <div class="col-sm-10">
                                    <textarea class="form-control" name="address" cols="5" id="field-5" placeholder="Address"></textarea>
                                </div>
                            </div>
                            <div class="form-group-separator"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="field-1">Slogan</label>
                                <div class="col-sm-10">
                                    <input type="text" name="slogan" class="form-control" id="field-1" placeholder="Slogan"/>
                                </div>
                            </div>
                            <div class="form-group-separator"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Starting Time</label>
                                <div class="col-sm-10">
                                    <div class="date-and-time">
                                        <input type="text" name="startDate" class="form-control datepicker" data-format="yyyy-mm-dd">
                                        <input type="text" name="startTime" class="form-control timepicker" data-template="dropdown" data-show-seconds="false" data-default-format="11:25 AM" data-show-meridian="false" data-minute-step="5" data-second-step="5">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group-separator"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Ending Time</label>
                                <div class="col-sm-10">
                                    <div class="date-and-time">
                                        <input type="text" name="endDate" class="form-control datepicker" data-format="yyyy-mm-dd">
                                        <input type="text" name="endTime" class="form-control timepicker" data-template="dropdown" data-show-seconds="false" data-default-time="11:25 AM" data-show-meridian="false" data-minute-step="5" data-second-step="5">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group-separator"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Category</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="cate_Id">
                                        <c:forEach items="${listCategories}" var="i">
                                            <option value="${i.getCate_Id()}">${i.getCategoryName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group-separator"></div>
                            <c:if test="${!empty(msgR)}">
                                <div class="form-group-separator"></div>
                                <h2 style="color:red;">${msgR}</h2>
                            </c:if>
                            <div class="form-group">
                                <div class="col-sm-offset-5">
                                    <div class="form-block">
                                        <button class="btn btn-success" type="submit">Submit</button>
                                        <label>
                                            <input type="checkbox" name="checkBoxPrice" value="yes">
                                            This Event has Price
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../template/Footer.jsp"/>
        
        <!-- Imported styles on this page -->
	<link rel="stylesheet" href="xenon/assets/js/wysihtml5/src/bootstrap-wysihtml5.css">
	<link rel="stylesheet" href="xenon/assets/js/uikit/vendor/codemirror/codemirror.css">
	<link rel="stylesheet" href="xenon/assets/js/uikit/uikit.css">
	<link rel="stylesheet" href="xenon/assets/js/uikit/css/addons/uikit.almost-flat.addons.min.css">
        
        <link rel="stylesheet" href="xenon/assets/js/daterangepicker/daterangepicker-bs3.css">
        <link rel="stylesheet" href="xenon/assets/js/select2/select2.css">
        <link rel="stylesheet" href="xenon/assets/js/select2/select2-bootstrap.css">
        <link rel="stylesheet" href="xenon/assets/js/multiselect/css/multi-select.css">
        
        <!-- Bottom Scripts -->
        <script src="xenon/assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="xenon/assets/js/TweenMax.min.js"></script>
        <script src="xenon/assets/js/resizeable.js"></script>
        <script src="xenon/assets/js/joinable.js"></script>
        <script src="xenon/assets/js/xenon-api.js"></script>
        <script src="xenon/assets/js/xenon-toggles.js"></script>
        <script src="xenon/assets/js/moment.min.js"></script>
        <script src="xenon/assets/js/wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>

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
        
	<script src="xenon/assets/js/wysihtml5/src/bootstrap-wysihtml5.js"></script>
	<script src="xenon/assets/js/uikit/vendor/codemirror/codemirror.js"></script>
	<script src="xenon/assets/js/uikit/vendor/marked.js"></script>
	<script src="xenon/assets/js/uikit/js/uikit.min.js"></script>
	<script src="xenon/assets/js/uikit/js/addons/htmleditor.min.js"></script>
	<script src="xenon/assets/js/ckeditor/ckeditor.js"></script>
	<script src="xenon/assets/js/ckeditor/adapters/jquery.js"></script>

        <script src="xenon/assets/js/xenon-custom.js"></script>
    </body>
</html>
