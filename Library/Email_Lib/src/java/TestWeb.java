import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mike
 */


public class TestWeb extends HttpServlet {

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
        
        boolean auth = Boolean.parseBoolean(getServletContext().getInitParameter("mail.smtp.auth"));
        boolean tls = Boolean.parseBoolean(getServletContext().getInitParameter("mail.smtp.starttls.enable"));
        String host = getServletContext().getInitParameter("mail.smtp.host");
        String port = getServletContext().getInitParameter("mail.smtp.port");
        
        String username = "appvlhacker@gmail.com";
        String password = "Duc76268481993@";
        String from = "appvlhacker@gmail.com";
        String to = "giapnhgc00561@fpt.edu.vn";
        String subject = "ChiChi";
        String content = "Giáp iu quý :* \n\n"
                         + "Tớ rất nà iu cậu hé hé <3<3<3, Bánh rán cậu mua ngon lắm <3 ! \n\n"
                         + "Tớ tặng cậu bài này này :P \n\n"
                         + "http://www.youtube.com/watch?v=QJO3ROT-A4E&list=RDfGFNmEOntFA&index=24";
        
        EmailDeploy deploy = new EmailDeploy();
        String [] string = new String[0];
        string[0] = "Yosemite/Users/Mike/Downloads/xenon.rar";
        
        deploy.emailSender(username, password, auth, tls, host, port, from, to, subject, content);
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
