/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mike.controllers;

import com.mike.model.AccountDB;
import com.mike.model.Cust_EventDb;
import com.mike.model.Event;
import com.mike.model.EventDb;
import com.mike.model.Payment_Option;
import com.mike.model.Payment_OptionDb;
import com.mike.ws.WSPayment;
import com.mike.ws.WSPayment_Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.DispatcherType;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.rmi.server.Dispatcher;

/**
 *
 * @author Nguyen
 */
public class ShowEventDetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String driver = getServletContext().getInitParameter("DriverName");
        String server = getServletContext().getInitParameter("ServerName");
        String database = getServletContext().getInitParameter("DatabaseName");
        String port = getServletContext().getInitParameter("Port");
        String username = getServletContext().getInitParameter("Username");
        String password = getServletContext().getInitParameter("Password");

        String action = request.getParameter("act");

        EventDb db = new EventDb(driver, server, port, database, username, password);
        Payment_OptionDb db2 = new Payment_OptionDb(driver, server, port, database, username, password);
        Cust_EventDb db3 = new Cust_EventDb(driver, server, port, database, username, password);

        int event_Id = Integer.parseInt(request.getParameter("event_Id"));
        Event evt = db.showEventDetail(event_Id);
        List<Event> listEvt = db.showEventPrice(event_Id);
        List<Event> listEvtPic = db.showEventPicture(event_Id);
        List<Event> listCusEvt = db.showCustEvent(event_Id);

        List<Payment_Option> listPaymentType = db2.showPaymentType();

        request.setAttribute("event_Id", event_Id);
        session.setAttribute("title", evt.getTitle());
        session.setAttribute("logo", evt.getLogo());
        session.setAttribute("description", evt.getDescription());
        session.setAttribute("speaker", evt.getSpeaker());
        session.setAttribute("address", evt.getAddress());
        session.setAttribute("slogan", evt.getSlogan());
        session.setAttribute("startDate", evt.getStartDate());
        session.setAttribute("endDate", evt.getEndDate());
        session.setAttribute("evtCate", evt.getCategoryName());

        session.setAttribute("price", listEvt);
        session.setAttribute("listEvtPic", listEvtPic);
        session.setAttribute("listCusEvt", listCusEvt);
        session.setAttribute("listPaymentType", listPaymentType);

        if ("eventDetail".equals(action)) {
            choosePriceAndPayment(request, db3, response);
        }
        request.getRequestDispatcher("eventDetail.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void choosePriceAndPayment(HttpServletRequest request, Cust_EventDb db3, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String driver = getServletContext().getInitParameter("DriverName");
        String server = getServletContext().getInitParameter("ServerName");
        String database = getServletContext().getInitParameter("DatabaseName");
        String port = getServletContext().getInitParameter("Port");
        String username = getServletContext().getInitParameter("Username");
        String password = getServletContext().getInitParameter("Password");
        
        String fullName = (String) session.getAttribute("username");
        String email =  (String) session.getAttribute("email");
        
        boolean auth = Boolean.parseBoolean(getServletContext().getInitParameter("mail.smtp.auth"));
        boolean tls = Boolean.parseBoolean(getServletContext().getInitParameter("mail.smtp.starttls.enable"));
        String host = getServletContext().getInitParameter("mail.smtp.host");
        String portMail = getServletContext().getInitParameter("mail.smtp.port");

        String gmailUser = getServletContext().getInitParameter("GmailUser");
        String gmailPassword = getServletContext().getInitParameter("GmailPassword");
        
        //Cust_Id, Price_Id, Payment_Id, Event_Id, TicketCode, Price
        int cust_Id = (Integer)session.getAttribute("cust_Id");;
        int price_Id = Integer.parseInt(request.getParameter("priceId"));
        int payment_Id = Integer.parseInt(request.getParameter("paymentId"));
        String codeBank = request.getParameter("codeBank");
        int event_Id = Integer.parseInt(request.getParameter("event_Id"));
        String ticketCode = request.getParameter("ticketcode");
        float price = Float.parseFloat(request.getParameter("price"));
        if (payment_Id == 1) {
            WSPayment_Service ws = new WSPayment_Service();
            WSPayment wsPort = ws.getWSPaymentPort();
            if (wsPort.paymentOnline(codeBank, "555-555-555", price)) {
                AccountDB db = new AccountDB(driver, server, port, database, username, password);
                db3.choosePriceAndPayment(cust_Id, price_Id, payment_Id, event_Id, ticketCode, price);
                db.senderAPITicket(gmailUser, gmailPassword, auth, tls, host, portMail, fullName, email, ticketCode, price);
            }

        } else {
            db3.choosePriceAndPayment(cust_Id, price_Id, payment_Id, event_Id, ticketCode, price);
        }

    }
}
