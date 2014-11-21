<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../template/Header.jsp">
    <jsp:param name="title" value="Event Price Creating"/>
    <jsp:param name="heading" value="${titleOfEvent}"/>
    <jsp:param name="headingNote" value="Event Creating is first step to have fun"/>
    <jsp:param name="step1" value="Event"/>
    <jsp:param name="step2" value="Event Price Creating"/>
</jsp:include>

            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a href="JSPEventInfo?event_Id=${event_Id}" style="color: blue; text-decoration: underline;">Back</a><br/>
                            <h3 class="panel-title">Table Event Price</h3>
                        </div>

                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Price</th>
                                    <th>Description</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="1" scope="page"/>
                                <c:forEach items="${listOfEvent_Prices}" var="i">
                                    <tr>
                                        <td data-eventPrice-id="${i.getPrice_Id()}">${count}</td>
                                        <td>${i.getPrice()}</td>
                                        <td class="setWidth concat">${i.getDescription()}</td>
                                        <td class="middle-align">
                                            <a href="#" class="btn btn-secondary btn-sm btn-icon icon-left" name="editing">Edit</a>
                                            <a href="#" class="btn btn-danger btn-sm btn-icon icon-left" name="deleting">Delete</a> 
                                        </td>
                                    </tr>
                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-6 panel-edit-event-price">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Creating A Event Price</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form" class="form-horizontal" method="POST" action="Event_PriceInserting">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="field-1">Price</label>
                                    <div class="col-sm-10">
                                        <input name="price" type="text" class="form-control" id="field-1" placeholder="$">
                                    </div>
                                </div>

                                <div class="form-group-separator"></div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="field-5">Description</label>
                                    <div class="col-sm-10">
                                        <textarea name="description" class="form-control autogrow" cols="5" id="field-5" placeholder="Description for this event price because someone can wonder about price"></textarea>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="field-5"></label>
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-secondary btn-single">Create</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        
        <jsp:include page="../template/Footer.jsp"/>
        
        <!-- Modal 1 (Basic)-->
	<div class="modal fade" id="modal-delete">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Delete Event Price</h4>
                    </div>

                    <div class="modal-body">
                        Delete
                    </div>

                    <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-info btn-delete" data-dismiss="modal">Delete</button>
                    </div>
                </div>
            </div>
	</div>
        
        <!-- Bottom Scripts -->
        <script type="text/javascript" src="xenon/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="xenon/assets/js/TweenMax.min.js"></script>
        <script type="text/javascript" src="xenon/assets/js/resizeable.js"></script>
        <script type="text/javascript" src="xenon/assets/js/joinable.js"></script>
        <script type="text/javascript" src="xenon/assets/js/xenon-api.js"></script>
        <script type="text/javascript" src="xenon/assets/js/xenon-toggles.js"></script>


        <!-- JavaScripts initializations and stuff -->
        <script type="text/javascript" src="xenon/assets/js/xenon-custom.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                
                $(document).on('click', 'a[name=editing]', function(e){
                    e.preventDefault();
                    var $tr = $(this).closest('tr');
                    var price_Id = $tr.children().eq(0).attr('data-eventprice-id'),
                        price = $tr.children().eq(1).html(),
                        description = $tr.children().eq(2).html();

                    var $panel = $('.panel-edit-event-price'),
                        $heading = $panel.find('.panel-heading'),
                        $price = $panel.find('input[name=price]'),
                        $description = $panel.find('textarea[name=description]'),
                        $submitBtn = $panel.find('button[type=submit]'),
                        $oldCancelBtn = $panel.find('.btn-cancel'),
                        $cancelBtn = $('<button>', {class: 'btn btn-info btn-single btn-cancel', html: 'Cancel'}),
                        $form = $panel.find('form');
                        
                        $tr.siblings().removeClass('selected');
                        $tr.addClass('selected');

                        $form.attr('action', 'Event_PriceUpdating');
                        $heading.html('Edit Event Price');
                        $oldCancelBtn.remove();
                        $submitBtn
                                .attr({'name': 'price_Id', 'value': price_Id})
                                .after($cancelBtn);
                        $price.val(price);
                        $description.val(description);
                        $submitBtn.html('Update');
                });
                  
                  
                $('.panel-edit-event-price').on('click', '.btn-cancel', function(e) {
                    e.preventDefault();

                    var $panel = $(this).closest('.panel-edit-event-price'),
                        $heading = $panel.find('.panel-heading'),
                        $price = $panel.find('input[name=price]'),
                        $description = $panel.find('textarea[name=description]'),
                        $submitBtn = $panel.find('button[type=submit]'),
                        $form = $panel.find('form');

                    $('table tr.selected').removeClass('selected');
                    
                    $form.attr('action', 'Event_PriceInserting');
                    $heading.html('Creating A Event Price');
                    $price.val('');
                    $description.val('');
                    $submitBtn.html('Create').removeAttr('name').removeAttr('value');
                    $(this).remove();
                });
                
                
                $('.panel-edit-event-price button[type=submit]').click(function (e) {
                    e.preventDefault();
                    var self = this;
                    var $form = $(self).closest('form');
                    var action = $form.attr('action');
                    if (action === 'Event_PriceInserting') {
                      var price = $('input[name=price]').val();
                      var description = $('textarea[name=description]').val();
                      $.ajax({
                        data: {
                          price: price,
                          description: description
                        },
                        url: action,
                        type: 'POST',
                        dataType: 'JSON',
                        error: function (jqXHR, textStatus, erroThrown) {
                          console.log('textStatus: ' + textStatus);
                        },
                        success: function (data, textStatus, jqXHR) {
                            var lastIndex = $('tbody').find('tr:last-child td:first-child').html();
                            if(lastIndex === undefined) {
                              lastIndex = 0;
                            }
                            var $rightPanel = $(self).closest('.panel-edit-event-price'),
                                $price = $rightPanel.find('input[name=price]'),
                                $description = $rightPanel.find('textarea[name=description]');
                          
                            data = 
                            '<tr>\n' +
                              '\t<td data-eventPrice-id="' + data.price_Id + '">' + (parseInt(lastIndex)+1) + '</td>\n' +
                              '\t<td>' + price + '</td>\n' +
                              '\t<td class="setWidth concat">' + description + '</td>\n' +
                              '\t<td class="middle-align">\n' +
                                '\t\t<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left" name="editing">Edit</a>\n' +
                                '\t\t<a href="#" class="btn btn-danger btn-sm btn-icon icon-left" name="deleting">Delete</a>\n' +
                              '\t</td>\n' + 
                            '</tr>';
                            $('tbody').append(data);

                            $price.val('');
                            $description.val('');
                        }
                      });
                      
                      
                    } else if(action === 'Event_PriceUpdating') {
                        var $rightPanel = $(self).closest('.panel-edit-event-price'),
                            $heading = $rightPanel.find('.panel-heading'),
                            $price = $rightPanel.find('input[name=price]'),
                            $description = $rightPanel.find('textarea[name=description]');

                        var price_Id = self.value,
                            price = $price.val(),
                            description = $description.val();

                        $.ajax({
                            data: {
                                price_Id: price_Id,
                                price: price,
                                description: description
                            },
                            url: action,
                            type: "POST",
                            dataType: "JSON",
                            error: function(jqXHR, textStatus, errorThrown) {
                              console.log('Error\'s textStatus: ' + textStatus);
                            },
                            success: function(data, textStatus, jqXHR) {
                                if(data.result) {
                                    var $tr = $('table tr.selected');

                                    $price.val('');
                                    $description.val('');
                                    $heading.html('Creating A Event Price');
                                    $(self).html('Create')
                                           .removeAttr('name')
                                           .removeAttr('value');
                                    $form.attr('action', 'Event_PriceInserting');

                                    $tr.children()
                                      .eq(1).html(price).end()
                                      .eq(2).html(description);
                                    $tr.removeClass('selected');
                                }
                            }
                        });
                    }
                });
                
                $(document).on('click', 'a[name=deleting]', function(e) {
                    e.preventDefault();
                    var $tr = $(this).closest('tr');
                    var price_Id = $tr.find('td:first-child').attr('data-eventprice-id');

                    $('#modal-delete .btn-delete').attr({'name': 'price_Id', 'value': price_Id});

                    $('#modal-delete').modal('show', {backdrop: 'fade'});
                });

                $('#modal-delete .btn-delete').click(function (e) {
                    e.preventDefault();

                    var self = this;
                    var price_Id = self.value;
                    $.ajax({
                      data: {
                        price_Id: price_Id
                      },
                      url: 'Event_PriceDeleting',
                      type: 'POST',
                      dataType: 'JSON',
                      error: function (jqXHR, textStatus, errorThrown) {
                        console.log('error: ', textStatus);
                      },
                      success: function (data, textStatus, jqXHR) {
                        $('table td:first-child[data-eventprice-id=' + price_Id + ']').closest('tr').remove();
                        
                        $('table td:first-child').each(function(index, td1st) {
                            $(td1st).html(++index);
                        });
                      }
                    });
                });
            });
        </script>
    </body>
</html>
