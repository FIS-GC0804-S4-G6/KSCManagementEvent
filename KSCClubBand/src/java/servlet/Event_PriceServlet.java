package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.Event_Price_StorkTeam;
import java.util.List;
import model.Event_Price;
import model.Event;
import db.Event_StorkTeam;
import javax.servlet.http.HttpSession;

public class Event_PriceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        if(userPath.equals("/JSPEvent_Price")) {
            int event_Id = Integer.parseInt(request.getParameter("event_Id"));
            Event_StorkTeam db = new Event_StorkTeam();
            Event entity = db.selectEventByEvent_Id(event_Id);
            if(entity != null) {
                String title = entity.getTitle();
                request.setAttribute("titleOfEvent", title);
                moveJSPEvent_Creating(event_Id, request, response);
            }
            response.getWriter().write("Cannot get Title");
        } else if(userPath.equals("/RedirectJSPEvent_Price")) {
            HttpSession session = request.getSession(true);
            int event_Id = (Integer)session.getAttribute("event_Id");
            moveJSPEvent_Creating(event_Id, request, response);
        }
    }

    private void insertIntoEvent_Price(HttpServletRequest request, int event_Id, HttpServletResponse response) throws IOException, NumberFormatException {
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

    private void moveJSPEvent_Creating(int event_Id, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Event_Price_StorkTeam db = new Event_Price_StorkTeam();
        List<Event_Price> listOfEvent_Prices = db.selectEvent_PriceByEvent_Id(event_Id);
        
        request.setAttribute("listOfEvent_Prices", listOfEvent_Prices);
//        request.setAttribute("titleOfEvent", title);
        request.getRequestDispatcher("WEB-INF/admin/event_price.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        HttpSession session = request.getSession(true);
        int event_Id = (Integer)session.getAttribute("event_Id");
        if(userPath.equals("/Event_PriceInserting")) {
            insertIntoEvent_Price(request, event_Id, response);
        } else if (userPath.equals("/Event_PriceUpdating")) {
            int priceId = Integer.parseInt(request.getParameter("price_Id"));
            float price = Float.parseFloat(request.getParameter("price"));
            String description = request.getParameter("description");
            Event_Price_StorkTeam db = new Event_Price_StorkTeam();
            boolean result = db.editEventPrice(new Event_Price(priceId, price, description));
            
            java.util.Map<String, Boolean> options = new java.util.LinkedHashMap<String, Boolean>();
            options.put("result", result);
            String json = new com.google.gson.Gson().toJson(options);
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else if(userPath.equals("/Event_PriceDeleting")) {
            int price_Id = Integer.parseInt(request.getParameter("price_Id"));
            Event_Price_StorkTeam db = new Event_Price_StorkTeam();
            db.deleteEventPriceByPriceId(price_Id);
            
            java.util.Map<String, String> options = new java.util.LinkedHashMap<String, String>();
            options.put("result", "The Price Type has been deleted");
            String json = new com.google.gson.Gson().toJson(options);
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
    }
}
