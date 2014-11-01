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
        PrintWriter writer = response.getWriter();
        javax.servlet.http.HttpSession session = request.getSession(true);
        int event_Id = (Integer)session.getAttribute("event_Id");
        if(userPath.equals("/JSPEvent_Price")) {
            moveJSPEvent_Creating(event_Id, request, response);
        } else if(userPath.equals("/Event_PriceInserting")) {
            insertIntoEvent_Price(request, event_Id, writer);
        } else if(userPath.equals("/AJAXEvent_PriceInserting")) {
            insertIntoEvent_PriceUsingAJAX(request, event_Id, response);
        }
    }

    private void insertIntoEvent_PriceUsingAJAX(HttpServletRequest request, int event_Id, HttpServletResponse response) throws IOException, NumberFormatException {
        float price = Float.parseFloat(request.getParameter("price"));
        String description = request.getParameter("description");
        Event_Price_StorkTeam db = new Event_Price_StorkTeam();
        Event_Price event_Price = new Event_Price(price, description, event_Id);
        db.insertEvent_Price(event_Price);
        java.util.Map<String, Integer> options = new java.util.LinkedHashMap<String, Integer>();
        options.put("price_Id", event_Price.getPrice_Id());
        String json = new com.google.gson.Gson().toJson(options);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    private void insertIntoEvent_Price(HttpServletRequest request, int event_Id, PrintWriter writer) throws NumberFormatException {
        float price = Float.parseFloat(request.getParameter("price"));
        String description = request.getParameter("description");
        Event_Price_StorkTeam db = new Event_Price_StorkTeam();
        Event_Price event_Price = new Event_Price(price, description, event_Id);
        db.insertEvent_Price(event_Price);
        if(event_Price.getPrice_Id() <= 0) {
            writer.println("<html><body><h1>Error Creating Event_Price</h1></body></html>");
        } else {
            writer.println("<html><body><h1>Success Creating Event_Price</h1></body></html>");
        }
    }

    private void moveJSPEvent_Creating(int event_Id, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Event_Price_StorkTeam db = new Event_Price_StorkTeam();
        List<Event_Price> listOfEvent_Prices = db.selectEvent_PriceByEvent_Id(event_Id);
        request.setAttribute("listOfEvent_Prices", listOfEvent_Prices);
        request.getRequestDispatcher("WEB-INF/admin/event_price.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
