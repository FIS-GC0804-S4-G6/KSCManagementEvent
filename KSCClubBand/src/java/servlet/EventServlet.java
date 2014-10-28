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

public class EventServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EventServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Path at " + request.getServletPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        if (userPath.equals("/JSPEventCreating")) {
            Category_StorkTeam category_StorkTeam = new Category_StorkTeam();
            List<Category> listOfCategories = category_StorkTeam.selectAllFromCategory();
            request.setAttribute("listOfCategories", listOfCategories);
            request.getRequestDispatcher("eventcreating.jsp").forward(request, response);
            return;
        } else if (userPath.equals("/EventCreating")) {
            Event_StorkTeam db = new Event_StorkTeam();
            String title = request.getParameter("title");
            String logo = request.getParameter("logo");
            String description = request.getParameter("description");
            String speaker = request.getParameter("speaker");
            String address = request.getParameter("address");
            String slogan = request.getParameter("slogan");
            org.joda.time.DateTime startDate = new org.joda.time.DateTime(request.getParameter("startDate"));
            org.joda.time.DateTime endDate = new org.joda.time.DateTime(request.getParameter("endDate"));
            boolean homeTag = new Boolean(request.getParameter("homeTag"));
            boolean status = new Boolean(request.getParameter("status"));
            int cate_Id = new Integer(request.getParameter("cate_Id"));
            boolean result = db.addEvent(new Event(title, logo, description, speaker, address, slogan, startDate, endDate, cate_Id));
            if (result) {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet EventServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>SEx is good =))</h1>");
                out.println("</body>");
                out.println("</html>");
            }
            return;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
