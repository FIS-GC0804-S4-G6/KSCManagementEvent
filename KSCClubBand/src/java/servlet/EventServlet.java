package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import db.Category_StorkTeam;
import db.Event_StorkTeam;
import model.Event;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.DateTime;
import javax.servlet.http.Part;
import java.io.OutputStream;
import java.io.InputStream;
import java.io.FileOutputStream;
import java.io.File;
import javax.servlet.annotation.MultipartConfig;
import java.io.FileNotFoundException;

@MultipartConfig
public class EventServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        if (userPath.equals("/JSPEventCreating")) {
            Category_StorkTeam category_StorkTeam = new Category_StorkTeam();
            List<Category> listOfCategories = category_StorkTeam.selectAllFromCategory();
            request.setAttribute("listOfCategories", listOfCategories);
            request.getRequestDispatcher("eventcreating.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        final PrintWriter writer = response.getWriter();
        String fileName = null;
        
        final Part filePart = request.getPart("logo");
        if(filePart.getSize() > 0) {
            fileName = getFileName(filePart);
            OutputStream out = null;
            InputStream filecontent = null;

            try {
            out = new FileOutputStream(new File("D:/06.Drive/SVN/trunk/KSCClubBand/img" + File.separator + fileName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            } catch(FileNotFoundException fe) {
                writer.println("You either did not specify a file to upload or are trying to upload a file to a protected or nonexistent location.");
                writer.println("<br/> ERROR: " + fe.getMessage());
            } finally {
                if(out != null)
                    out.close();
                if(filecontent != null)
                    filecontent.close();
            }
        }
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String speaker = request.getParameter("speaker");
        String address = request.getParameter("address");
        String slogan = request.getParameter("slogan");
        DateTimeFormatter datetimeFormatter = DateTimeFormat.forPattern("YYYY-mm-dd HH:mm");
        DateTime starttime = datetimeFormatter.parseDateTime(request.getParameter("startDate") + " " + request.getParameter("startTime"));
        DateTime endtime = datetimeFormatter.parseDateTime(request.getParameter("endDate") + " " + request.getParameter("endTime"));
        int cate_Id = Integer.parseInt(request.getParameter("cate_Id"));
        
        Event_StorkTeam db = new Event_StorkTeam();
        Event entity = new Event(title, fileName, description, speaker, address, slogan, starttime, endtime, cate_Id);
        db.addEvent(entity);
        //check creating event successfully?
        javax.servlet.http.HttpSession session = request.getSession(true);
        session.setAttribute("event_Id", entity.getEvent_Id());
        response.sendRedirect("JSPEvent_Price");
    }
    
    private String getFileName(Part part) {
        String[] partsHeader = part.getHeader("content-disposition").split(";");
        for(String content: partsHeader) {
            if(content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=")+1) .trim() .replace("\"", "");
            }
        }
        return null;
    }
}
