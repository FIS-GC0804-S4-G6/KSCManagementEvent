package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import db.Category_StorkTeam;
import db.Event_StorkTeam;
import model.Event;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.DateTime;

public class EventServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        if (userPath.equals("/JSPEventCreating")) {
            Category_StorkTeam category_StorkTeam = new Category_StorkTeam();
            List<Category> listOfCategories = category_StorkTeam.selectAllFromCategory();
            request.setAttribute("listOfCategories", listOfCategories);
            request.getRequestDispatcher("eventcreating.jsp").forward(request, response);
        } else if (userPath.equals("/EventCreating")) {
            Event_StorkTeam db = new Event_StorkTeam();
            String title = request.getParameter("title");
            String logo = request.getParameter("logo");
            String description = request.getParameter("description");
            String speaker = request.getParameter("speaker");
            String address = request.getParameter("address");
            String slogan = request.getParameter("slogan");
            DateTimeFormatter dtf = DateTimeFormat.forPattern("YYYY-mm-dd HH:mm");
            DateTime starttime = dtf.parseDateTime(request.getParameter("startDate") + " " + request.getParameter("startTime"));
            DateTime endtime = dtf.parseDateTime(request.getParameter("endDate") + " " + request.getParameter("endTime"));
            int cate_Id = new Integer(request.getParameter("cate_Id"));

            if (starttime.isAfter(endtime) || starttime.isEqual(endtime)) {
                request.setAttribute("msgR", "Start day is after or equal to End day");
                request.getRequestDispatcher("/JSPEventCreating").forward(request, response);
            } else {
                request.setAttribute("msgR", "Start day is before End day");
                boolean result = db.addEvent(new Event(title, logo, description, speaker, address, slogan, starttime, endtime, cate_Id));
                if (result) {
                    response.setContentType("text/html;charset=UTF-8");
                    PrintWriter out = response.getWriter();
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet EventServlet</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>Create successful</h1>");
                    out.println("</body>");
                    out.println("</html>");
                }
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
