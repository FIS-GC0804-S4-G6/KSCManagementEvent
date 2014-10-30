<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Creating</title>
        <link rel="stylesheet" href="rome-datetime/dist/rome.css"/>
        <link rel="stylesheet" href="rome-datetime/example/example.css"/>

        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
        <link href="xenon/assets/css/fonts/linecons/css/linecons.css" rel="stylesheet" type="text/css"/>
        <link href="xenon/assets/css/fonts/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

        <link href="xenon/assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="xenon/assets/css/xenon-core.css" rel="stylesheet" type="text/css"/>
        <link href="xenon/assets/css/xenon-forms.css" rel="stylesheet" type="text/css"/>
        <link href="xenon/assets/css/xenon-components.css" rel="stylesheet" type="text/css"/>
        <link href="xenon/assets/css/xenon-skins.css" rel="stylesheet" type="text/css"/>
        <link href="xenon/assets/css/custom.css" rel="stylesheet" type="text/css"/>

        <script src="xenon/assets/js/jquery-1.11.1.min.js"></script>
    </head>
    <body>
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
                        <c:forEach items="${listOfCategories}" var="c">
                            <option value="${c.getCate_Id()}">${c.getCategoryName()}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox">
                        Price
                    </label>
                </div>
            </div>
            <c:if test="${!empty(msgR)}">
                <h2 style="color:red;">${msgR}</h2>
                <div class="form-group-separator"></div>
            </c:if>
            <div class="form-group-separator"></div>
            <button class="btn btn-dark" type="submit">Submit</button>
        </form>

        <script type="text/javascript" src="rome-datetime/dist/rome.js"></script>
        <script type="text/javascript" src="rome-datetime/example/example.js"></script>

        <!-- Bottom Scripts -->
        <script src="xenon/assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="xenon/assets/js/TweenMax.min.js"></script>
        <script src="xenon/assets/js/resizeable.js"></script>
        <script src="xenon/assets/js/joinable.js"></script>
        <script src="xenon/assets/js/xenon-api.js"></script>
        <script src="xenon/assets/js/xenon-toggles.js"></script>
        <script src="xenon/assets/js/moment.min.js"></script>

        <!-- Imported styles on this page -->
        <link rel="stylesheet" href="xenon/assets/js/daterangepicker/daterangepicker-bs3.css">
        <link rel="stylesheet" href="xenon/assets/js/select2/select2.css">
        <link rel="stylesheet" href="xenon/assets/js/select2/select2-bootstrap.css">
        <link rel="stylesheet" href="xenon/assets/js/multiselect/css/multi-select.css">

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

        <script src="xenon/assets/js/xenon-custom.js"></script>
    </body>
</html>
