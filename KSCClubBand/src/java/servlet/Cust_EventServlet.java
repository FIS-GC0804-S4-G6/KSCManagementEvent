package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import db.Cust_Event_StorkTeam;
import model.Cust_Event;
import java.util.Map;

public class Cust_EventServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        if(userPath.equals("/JSPParticipant")) {
            int event_Id = Integer.parseInt(request.getParameter("event_Id"));
            Cust_Event_StorkTeam db = new Cust_Event_StorkTeam();
            Map<String, Cust_Event> mapCust_Events = db.selectParticipantsFromEvent(event_Id);
            request.setAttribute("mapCust_Events", mapCust_Events);
            int registrationAmount = 0;
            int paidAmount = 0;
            float totalPrice = 0;
            for(Map.Entry<String, Cust_Event> entry : mapCust_Events.entrySet()) {
                registrationAmount++;
                if(entry.getValue().getPayment_Option().getPayment_Id() != 4) {
                    paidAmount++;
                    totalPrice += entry.getValue().getRealPrice();
                }
            }
            request.setAttribute("registrationAmount", registrationAmount);
            request.setAttribute("paidAmount", paidAmount);
            request.setAttribute("totalPrice", totalPrice);
            request.getRequestDispatcher("/WEB-INF/admin/participants.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        if(userPath.equals("/JSPParticipantsEditing")) {
            String event_Id = request.getParameter("event_Id");
            String ticketCode = request.getParameter("ticketCode");
            request.setAttribute("event_Id", event_Id);
            request.setAttribute("ticketCode", ticketCode);
            request.setAttribute("tab", "participant_edit");
            request.getRequestDispatcher("/WEB-INF/admin/eventdetail.jsp").forward(request, response);
        } else if(userPath.equals("/ParticipantEditing")) {
            String ticketCode = request.getParameter("ticketCode");
            String payment_Type = request.getParameter("payment_Type");
            String price = request.getParameter("price");
            response.getWriter().write("ticketCode: " + ticketCode + "\npayment Type: " + payment_Type + "\nprice: " + price);
        }
    }
}
