<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <form id="eventStatusToggling" action="EventStatusToggling" method="POST"></form>
                <button class="btn btn-primary">Edit</button>
                <button class="btn btn-secondary">Delete Event</button>
                <c:if test="${entity.getStatus() == true}">
                    <button form="eventStatusToggling" type="submit" name="event_Id" value="${entity.getEvent_Id()}" class="btn btn-purple">Deactive</button>
                </c:if>
                <c:if test="${entity.getStatus() == false}">
                    <button form="eventStatusToggling" type="submit" name="event_Id" value="${entity.getEvent_Id()}" class="btn btn-purple">Active</button>
                </c:if>
                <button form="eventStatusToggling" class="btn btn-pink">Ticket</button>
                <a href="JSPParticipant?event_Id=${entity.getEvent_Id()}"><button class="btn btn-orange">Participants</button></a>
            </div>
        </div>
    </div>
</div>