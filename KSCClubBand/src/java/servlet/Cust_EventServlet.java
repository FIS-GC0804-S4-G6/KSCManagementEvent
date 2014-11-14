package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cust_EventServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().write("no more lonely night");
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
