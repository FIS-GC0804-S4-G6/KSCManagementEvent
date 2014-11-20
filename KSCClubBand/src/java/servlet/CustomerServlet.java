/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import db.Authentication_StorkTeam;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;

/**
 *
 * @author Nguyen
 */
public class CustomerServlet extends HttpServlet {

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
        String userPath = request.getServletPath();
        if (userPath.equals("/Customer")) {
            response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession();
            String email = request.getParameter("email");
            String pwd = request.getParameter("password");
            String rm = request.getParameter("persistent");
            String browserType = request.getHeader("User-Agent");
            Customer customer = null;
            Authentication_StorkTeam db = new Authentication_StorkTeam();
            customer = db.login(email, pwd);
            if (customer != null) {
                db.session(customer.getCust_Id(), browserType);
                Cookie[] cookie = request.getCookies();
                for (Cookie itemSID : cookie) {
                    if (itemSID.equals(customer.getSid_Device())) {
                        session.setAttribute("username", customer.getFullName());
                        session.setAttribute("email", email);
                        session.setAttribute("itemSID", itemSID);
                        session.setAttribute("browserType", browserType);
                        response.sendRedirect("JSPEventSelecting");
                    } else {
                        if (rm.equals("Remember me")) {
                            if (db.rememberMe(customer.getCust_Id(), itemSID.getValue(), browserType)) {
                                System.out.println("Successed");
                            } else {
                                System.out.println("False");
                            }
                            session.setAttribute("username", customer.getFullName());
                            session.setAttribute("email", email);
                            session.setAttribute("itemSID", itemSID);
                            session.setAttribute("browserType", browserType);
                            response.sendRedirect("JSPEventSelecting");
                        } else {
                            session.setAttribute("username", customer.getFullName());
                            session.setAttribute("email", email);
                            session.setAttribute("itemSID", itemSID);
                            session.setAttribute("browserType", browserType);
                            response.sendRedirect("JSPEventSelecting");
                        }
                    }
                }
            } else {
                request.setAttribute("Error", "Wrong email or password !");
                request.getRequestDispatcher("/WEB-INF/admin/login.jsp").forward(request, response);
            }
        }
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
//        request.getRequestDispatcher("/WEB-INF/admin/login.jsp").forward(request, response);
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
