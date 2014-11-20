package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Event_Price;
import model.Cust_Event;
import db.Category_StorkTeam;
import db.Event_StorkTeam;
import db.Cust_Event_StorkTeam;
import db.Event_Price_StorkTeam;
import model.Event;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.DateTime;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import java.io.FileNotFoundException;
import java.util.Map;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class EventServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        request.setAttribute("myTime", new DateTime());
        if (userPath.equals("/JSPEventCreating")) {
            getJSPEventCreating(request, response);
        } else if(userPath.equals("/JSPEventSelecting") || userPath.equals("/JSPEventNext") || userPath.equals("/JSPEventPrev")) {
            getJSPEventSelecting(request, response, userPath);        
        } else if (userPath.equals("/JSPEventDetail")) {
            getJSPEventDetail(request, response);
        } else if(userPath.equals("/JSPEventDetailTicket")) {
            getJSPEventDetailTicket(request, response);
        } else if(userPath.equals("/JSPEventDetailParticipants")) {
            int event_Id = 1;
            Cust_Event_StorkTeam db = new Cust_Event_StorkTeam();
            Map<String, Cust_Event> mapOfCust_Events = db.selectParticipantsFromEvent(event_Id);
            request.setAttribute("event_Id", event_Id);
            request.setAttribute("tab", "participants");
            request.setAttribute("mapOfCust_Events", mapOfCust_Events);
            request.getRequestDispatcher("WEB-INF/admin/eventdetail.jsp").forward(request, response);
        } else if(userPath.equals("/EventFilter.guitar")) {
            filterEvent(request, response);
        } else if(userPath.equals("/JSPEventInfo")) {
            moveJSPEventInfo(request, response);
        }
    }
    
    private void moveJSPEventInfo(HttpServletRequest request, HttpServletResponse response) throws 
           ServletException, IOException {
        int event_Id = Integer.parseInt(request.getParameter("event_Id"));
            Event_StorkTeam db = new Event_StorkTeam();
            Event entity = db.selectEventByEvent_Id(event_Id);
            if(entity != null) {
                if(entity.getEvent_Id() != -1) {
                    request.setAttribute("entity", entity);
                    request.getRequestDispatcher("WEB-INF/admin/eventinfo.jsp").forward(request, response);
                } else {
                    response.getWriter().write("The event_Id is not existed");
                }
            } else {
                response.getWriter().write("We can not get the detail.");
            }
    }
    
    private void getJSPEventDetailTicket(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int event_Id = 1;
        Event_StorkTeam eventDb = new Event_StorkTeam();
        Event entity = eventDb.selectEventByEvent_Id(event_Id);
        if(entity == null) {
            response.getWriter().write("We can not get the detail.");
            return;
        } else if(entity.getEvent_Id() == 1) {
            Event_Price_StorkTeam ticketDb = new Event_Price_StorkTeam();
            List<Event_Price> listOfEvent_Prices = ticketDb.selectEvent_PriceByEvent_Id(entity.getEvent_Id());
            if(listOfEvent_Prices != null) {
                response.getWriter().write("Can not get event price for the event");
                entity.setLogo("characters-captain-haddock-mug.jpg");
                request.setAttribute("entity", entity);
                request.setAttribute("listOfEvent_Prices", listOfEvent_Prices);
                request.setAttribute("tab", "event_price");
                request.getRequestDispatcher("WEB-INF/admin/eventdetail.jsp").forward(request, response);
                return;
            }
        }
        response.getWriter().write("there is not existed the event or have error while getting event price");
    }
    
    private void getJSPEventDetail(HttpServletRequest request, HttpServletResponse response) throws 
            ServletException, IOException {
//        int event_Id = Integer.parseInt(request.getParameter("event_Id"));
        int event_Id = 1;
        Event_StorkTeam db = new Event_StorkTeam();
        Event entity = db.selectEventByEvent_Id(event_Id);
        if(entity != null) {
            if(entity.getEvent_Id() != -1) {
                entity.setLogo("characters-captain-haddock-mug.jpg");
                request.setAttribute("entity", entity);
                request.setAttribute("tab", "detail");
                request.getRequestDispatcher("WEB-INF/admin/eventdetail.jsp").forward(request, response);
            } else {
                response.getWriter().write("The event_Id is not existed");
            }
        } else {
            response.getWriter().write("We can not get the detail.");
        }
    }

    private void filterEvent(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException{
        String title = request.getParameter("title");
        DateTimeFormatter datetimeFormatter = DateTimeFormat.forPattern("dd/mm/yyyy HH:mm aa");
        String strStartDate = request.getParameter("startDate") + " " + request.getParameter("startTime");
        String strEndDate = request.getParameter("endDate") + " " + request.getParameter("endTime");
        DateTime startDate = null;
        DateTime endDate = null;
        try {
            startDate = datetimeFormatter.parseDateTime(strStartDate);
            endDate = datetimeFormatter.parseDateTime(strEndDate);
        } catch(IllegalArgumentException iae) {
            // parse error and get null values
            iae.printStackTrace();
        }
        String address = request.getParameter("address");

        Event entity = new Event(title, startDate, endDate, address);
        Event_StorkTeam db = new Event_StorkTeam();
        Map<Integer, Event> mapOfEvents = db.filterEvent(1, 10, entity);
        request.setAttribute("mapOfEvents", mapOfEvents);
        request.getRequestDispatcher("WEB-INF/admin/event.jsp").forward(request, response);
    }

    private void getJSPEventSelecting(HttpServletRequest request, HttpServletResponse response, String userPath) throws
            ServletException, IOException{
        HttpSession session = request.getSession(true);
        Object pageNumberObj = session.getAttribute("pageNumber");
        int currentPage = 1;
        if(pageNumberObj != null) {
            currentPage = (Integer) pageNumberObj;
            if(userPath.equals("/JSPEventNext")) {
                Event_StorkTeam db = new Event_StorkTeam();
                int amountEvent = db.countAllEvent();
                if(amountEvent == -1) {
                    response.getWriter().write("Counting Event has an error");
                    return;
                }
                
                int maxPage = amountEvent / 10;
                if(amountEvent % 10 != 0) {
                    maxPage += 1;
                }    
                if(currentPage < maxPage) {
                    currentPage++;
                }
            } else if (userPath.equals("/JSPEventPrev")) {
                if(currentPage > 1) {
                    currentPage--;
                }
            }
        }
        session.setAttribute("pageNumber", currentPage);
        Event_StorkTeam db = new Event_StorkTeam();
        Map<Integer, Event> mapOfEvents = db.selectEvent(currentPage, 10);
        request.setAttribute("mapOfEvents", mapOfEvents);
        request.getRequestDispatcher("WEB-INF/admin/event.jsp").forward(request, response);
    }
    
    private void getJSPEventCreating(HttpServletRequest request, HttpServletResponse response) throws 
            ServletException, IOException {
        Category_StorkTeam category_StorkTeam = new Category_StorkTeam();
        List<Category> listCategories = category_StorkTeam.selectAllFromCategory();
        request.setAttribute("listCategories", listCategories);
        request.getRequestDispatcher("WEB-INF/admin/eventcreating.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        if(userPath.equals("/EventCreating")) {
            response.setContentType("text/html;charset=UTF-8");
            final PrintWriter writer = response.getWriter();
            String fileName = null;

            final Part filePart = request.getPart("logo");
            Event_StorkTeam db = new Event_StorkTeam();
            if (filePart.getSize() > 0) {
                try {
                    String path = getServletContext().getRealPath("/");
                    fileName = db.uploadLogo(filePart, fileName, "D:/06.Drive/SVN/trunk/KSCClubBand/web/img");
//                    fileName = db.uploadLogo(filePart, fileName, "E:/FGR/Sem4/eProject/KSCManagementEvent/KSCClubBand/web/img");
                } catch (FileNotFoundException fne) {
                    writer.println("You either did not specify a file to upload or are trying to upload a file to a protected or nonexistent location.");
                    writer.println("<br/> ERROR: " + fne.getMessage());
                    return;
                }
            }
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String speaker = request.getParameter("speaker");
            String address = request.getParameter("address");
            String slogan = request.getParameter("slogan");
            DateTimeFormatter datetimeFormatter = DateTimeFormat.forPattern("YYYY-MM-dd HH:mm");
            DateTime starttime = datetimeFormatter.parseDateTime(request.getParameter("startDate") + " " + request.getParameter("startTime"));
            DateTime endtime = datetimeFormatter.parseDateTime(request.getParameter("endDate") + " " + request.getParameter("endTime"));
            int cate_Id = Integer.parseInt(request.getParameter("cate_Id"));
            Event entity = new Event(title, fileName, description, speaker, address, slogan, starttime, endtime, cate_Id);
            db.addEvent(entity);
            if(entity.getEvent_Id() > -1) {
                String[] checkBoxPrice = request.getParameterValues("checkBoxPrice");
                if (checkBoxPrice != null) {
                    if(checkBoxPrice[0] != null && checkBoxPrice[0].equals("yes") == true) {
                        HttpSession session = request.getSession(true);
                        session.setAttribute("event_Id", entity.getEvent_Id());
                        session.setAttribute("titleOfEvent", entity.getTitle());
                        response.sendRedirect("RedirectJSPEvent_Price");
                    }
                } else{
                    getJSPEventCreating(request, response);
                }
            } else {
                response.getWriter().write("chang may insert event nay nay that bai. Hen lan sau");
            }
        } else if(userPath.equals("/EventStatusToggling")) {
            int event_Id = Integer.parseInt(request.getParameter("event_Id"));
            Event_StorkTeam db = new Event_StorkTeam();
            boolean result = db.toggleStatusFromEvent(event_Id);
            if(result) {
                moveJSPEventInfo(request, response);
            } else {
                response.getWriter().write("Error Toggle Status");
            }
        }
    }
}