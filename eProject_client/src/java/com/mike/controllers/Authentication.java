package com.mike.controllers;

import com.mike.model.Account;
import com.mike.model.AccountDB;
import com.mike.utils.Global;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mike
 */
public class Authentication extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
        String driver = getServletContext().getInitParameter("DriverName");
        String server = getServletContext().getInitParameter("ServerName");
        String database = getServletContext().getInitParameter("DatabaseName");
        String port = getServletContext().getInitParameter("Port");
        String username = getServletContext().getInitParameter("Username");
        String password = getServletContext().getInitParameter("Password");

        AccountDB db = new AccountDB(driver, server, port, database, username, password);

        checkAction(request, response, db);
    }

    private void checkAction(HttpServletRequest request, HttpServletResponse response, AccountDB db) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("act");
        if ("logout".equals(action)) {
            db.logOut((String) session.getAttribute("email"), (String) session.getAttribute("itemSID"), (String) session.getAttribute("browserType"));
            session.invalidate();
            response.sendRedirect("index.jsp");
        } else if ("signup".equals(action)) {
            signup(request, db, response);
        } else {
            login(request, db, response);
        }
    }

    private void login(HttpServletRequest request, AccountDB db, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String pwd = request.getParameter("password");
        String rm = request.getParameter("persistent");
        String browserType = request.getHeader("User-Agent");
        Account account = null;
        account = db.login(email, pwd);
        if (account != null) {
            db.session(account.getCustID(), browserType);
            Cookie[] cookie = request.getCookies();
            for (Cookie itemSID : cookie) {
                if (itemSID.equals(account.getSid_Device())) {
                    session.setAttribute("username", account.getFullname());
                    session.setAttribute("email", email);
                    session.setAttribute("itemSID", itemSID);
                    session.setAttribute("browserType", browserType);
                    response.sendRedirect("homeEvent");
                } else {
                    if (rm.equals("Remember me")) {
                        if (db.rememberMe(account.getCustID(), itemSID.getValue(), browserType)) {
                            session.setAttribute("username", account.getFullname());
                            session.setAttribute("email", email);
                            session.setAttribute("itemSID", itemSID);
                            session.setAttribute("browserType", browserType);
                            response.sendRedirect("homeEvent");
                        } else {
                            session.setAttribute("username", account.getFullname());
                            session.setAttribute("email", email);
                            session.setAttribute("itemSID", itemSID);
                            session.setAttribute("browserType", browserType);
                            response.sendRedirect("homeEvent");
                            response.sendRedirect("homeEvent");
                        }
                    } else {
                        session.setAttribute("username", account.getFullname());
                        session.setAttribute("email", email);
                        session.setAttribute("itemSID", itemSID);
                        session.setAttribute("browserType", browserType);
                        response.sendRedirect("homeEvent");
                    }
                }
            }
        } else {
            request.setAttribute("msgR", "Wrong email or password! Please try again!");
            RequestDispatcher redirect = request.getRequestDispatcher("login.jsp");
            redirect.forward(request, response);
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

    private void signup(HttpServletRequest request, AccountDB db, HttpServletResponse response) throws ServletException, IOException {
        boolean auth = Boolean.parseBoolean(getServletContext().getInitParameter("mail.smtp.auth"));
        boolean tls = Boolean.parseBoolean(getServletContext().getInitParameter("mail.smtp.starttls.enable"));
        String host = getServletContext().getInitParameter("mail.smtp.host");
        String port = getServletContext().getInitParameter("mail.smtp.port");

        String gmailUser = getServletContext().getInitParameter("GmailUser");
        String gmailPassword = getServletContext().getInitParameter("GmailPassword");

        String name = request.getParameter("fullname");
        String email = request.getParameter("email");
        String custPassword = request.getParameter("password");
        String rePassword = request.getParameter("repassword");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        Global.setCustEmail(email);

        if (custPassword.equals(rePassword)) {
            db.signup(email, name, custPassword, gender);
            db.senderAPI(gmailUser, gmailPassword, auth, tls, host, port, name, email, rePassword);
            request.setAttribute("msgB", "Create successful! Please check your email to active your account!");
            RequestDispatcher redirect = request.getRequestDispatcher("signup.jsp");
            redirect.forward(request, response);
        }
    }
}
