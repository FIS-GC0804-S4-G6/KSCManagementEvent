package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.Event_Price_StorkTeam;
import java.util.List;
import model.Event_Price;

public class Event_PriceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        if(userPath.equals("/JSPEvent_Price")) {
            int event_Id = Integer.parseInt(request.getParameter("event_Id"));
            Event_Price_StorkTeam db = new Event_Price_StorkTeam();
            List<Event_Price> listOfEvent_Prices = db.selectEvent_PriceByEvent_Id(event_Id);
            request.setAttribute("listOfEvent_Prices", listOfEvent_Prices);
            request.getRequestDispatcher("event_price.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
