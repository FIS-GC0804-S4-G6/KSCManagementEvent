<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>

        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
        <link rel="stylesheet" href="xenon/assets/css/fonts/linecons/css/linecons.css">
        <link rel="stylesheet" href="xenon/assets/css/fonts/fontawesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="xenon/assets/css/bootstrap.css">
        <link rel="stylesheet" href="xenon/assets/css/xenon-core.css">
        <link rel="stylesheet" href="xenon/assets/css/xenon-forms.css">
        <link rel="stylesheet" href="xenon/assets/css/xenon-components.css">
        <link rel="stylesheet" href="xenon/assets/css/xenon-skins.css">
        <link rel="stylesheet" href="xenon/assets/css/custom.css">

        <script src="xenon/assets/js/jquery-1.11.1.min.js"></script>
    </head>
    <body>
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
                        <td>
                            <a href="javascript:;" onclick="jQuery('#modal-1').modal('show', {backdrop: 'fade'});" class="btn btn-primary btn-single btn-sm" id="${i.getPrice_Id()}" name='editing'>Edit</a>
                        </td>
                        <td><button class="delete-btn" id="${i.getPrice_Id()}">Delete</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="creating">
            <form method="GET" action="Event_PriceInserting">
                Price<input type="text" name="price"/><br/>
                Description<textarea name="description"></textarea><br/>
                <button type="submit">Submit</button>
            </form>
        </div>

        <div class="modal fade" id="modal-1" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Editing Event Price</h4>
                    </div>
                    <div class="modal-body">
                        <form method="GET" action="Event_PriceUpdating" >
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Price</label>
                                        <input type="text" class="form-control" id="field-1" name="priceUnit" placeholder="Price"/>
                                    </div>	
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Description</label>
                                        <input type="text" class="form-control" id="field-2" name="descriptionUnit" placeholder="Description"/>
                                    </div>	
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-info">Save changes</button>
                                <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                            </div>
                        </form>
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


        <!-- JavaScripts initializations and stuff -->
        <script src="xenon/assets/js/xenon-custom.js"></script>
<script>
    $(document).ready(function () {
        $("button[type=submit]").click(function (e) {
            e.preventDefault();
            var price = $("input[name=price]").val();
            var description = $("textarea[name=description]").val();
            $.ajax({
                data: {price: price, description: description},
                url: "AJAXEvent_PriceInserting",
                type: "GET",
                dataType: "JSON",
                error: function (jqXHR, textStatus, erroThrown) {
                    console.log(textStatus);
                },
                success: function (aPostData, textStatus, jqXHR) {
                    var data = "<tr>" +
                            "<td>" + aPostData.price_Id + "</td>" +
                            "<td>" + price + "</td>" +
                            "<td>" + description + "</td>" +
                            "<td><a href='javascript:;' onclick=\"jQuery('#modal-1').modal('show', {backdrop: 'fade'});\" class='btn btn-primary btn-single btn-sm' id='" + aPostData.price_Id + "' name='editing' >Edit</a></td>" +
                            "<td><button class='delete-btn' id='" + aPostData.price_Id + "'>Delete</button></td>" +
                            "</tr>";
                    $('tbody').append(data);
                }
            });
        });

        $('table tbody').on("click", "button", function (e) {
            e.preventDefault();
            var self = $(this);
            $.ajax({
                data: {price_Id: self.attr('id')},
                url: "Event_PriceDeleting",
                type: "GET",
                dataType: "JSON",
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("error: ", textStatus);
                },
                success: function (data, textStatus, jqXHR) {
                    self.closest('tr').remove();
                }
            });
        });

        $(document).on('click', 'a[name=editing]', function(){
            var self = $(this);
            $('.modal-footer .btn-info').attr('id', self.attr('id'));
        });
        
        $('.modal-footer .btn-info').click(function (e) {
            e.preventDefault();
            var self = $(this);
            $.ajax({
                data: {price_Id: self.attr('id'), price: $('input[name=priceUnit]').val(), description: $('input[name=descriptionUnit]').val()},
                url: "Event_PriceUpdating",
                type: "GET",
                dataType: "JSON",
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("error: ", textStatus);
                },
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                }
            });
        });
    });
</script>
    </body>
</html>
