<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>
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
                        <td><button class="edit-btn">Edit</button></td>
                        <td><a class="${i.getPrice_Id()}" href="Event_PriceDeleting?Price_Id=${i.getPrice_Id()}"><button class="delete-btn">Delete</button></a></td>
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
        
        <script type="text/javascript" src="js/jquery/jquery.js"></script>
        <script>
            $(document).ready(function() {
                $("button[type=submit]").click(function(e) {
                    e.preventDefault();
                    var price = $("input[name=price]").val();
                    var description = $("textarea[name=description]").val();
                    $.ajax({
                        data: {price: price, description: description},
                        url: "AJAXEvent_PriceInserting",
                        type: "GET",
                        dataType: "JSON",
                        error: function(jqXHR, textStatus, erroThrown) {
                            console.log(textStatus);
                            
                        },
                        success: function(aPostData, textStatus, jqXHR) {
                            var data = "";
                            $.each(aPostData, function(key, value) {
                                data += "<td>" + value + "</td>";
                            });
                            data += "<td>" + price + "</td>" + "<td>" + description + "</td>";
                            $('tbody').append('<tr>' +
                                        data +
                                        '<td><button class="edit-btn">Edit</button></td>' +
                                        '<td><button class="delete-btn">Delete</button></td>' +
                                    '</tr>');
                        }
                    });
                });
                
                $('table tbody').on("click", "a", function(e) {
                    e.preventDefault();
                    $.ajax({
                        data: {price_Id: $(this).class},
                        url: "Event_PriceDeletingg",
                        t
                        d
                        e
                        s
                    });
                });
            });
        </script>
    </body>
</html>
