/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mike.controllers;

import com.mike.model.Event;
import com.mike.model.EventDb;
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
public class ShowEvent extends HttpServlet {

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
//        HttpSession session = request.getSession();
        
        String driver = getServletContext().getInitParameter("DriverName");
        String server = getServletContext().getInitParameter("ServerName");
        String database = getServletContext().getInitParameter("DatabaseName");
        String port = getServletContext().getInitParameter("Port");
        String username = getServletContext().getInitParameter("Username");
        String password = getServletContext().getInitParameter("Password");
        
        EventDb db = new EventDb(driver, server, port, database, username, password);
        
        Event evt = db.showEventDetail(1);
        List<Event> listEvt = db.showEventPrice(1);
        List<Event> listCusEvt = db.showCustEvent(1);
        
        request.setAttribute("title", evt.getTitle());
        request.setAttribute("logo", evt.getLogo());
        request.setAttribute("description", evt.getDescription());
        request.setAttribute("speaker", evt.getSpeaker());
        request.setAttribute("address", evt.getAddress());
        request.setAttribute("slogan", evt.getSlogan());
        request.setAttribute("startDate", evt.getStartDate());
        request.setAttribute("endDate", evt.getEndDate());
        request.setAttribute("evtCate", evt.getCategoryName());
        
        request.setAttribute("price", listEvt);
        request.setAttribute("listCusEvt", listCusEvt);
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

}
