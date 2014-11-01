package db;

import java.sql.Connection;
import model.Event;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;
import java.sql.ResultSet;
import org.joda.time.DateTime;
import java.util.Map;
import java.util.LinkedHashMap;
import javax.servlet.http.Part;
import java.io.OutputStream;
import java.io.InputStream;
import java.io.FileOutputStream;
import java.io.FileNotFoundException;
import java.io.File;
import java.io.IOException;

public class Event_StorkTeam {
    public void addEvent(Event event) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{ call sp_event_creating(?,?,?,?,?,  ?,?,?,?,?) }");
            cstmt.registerOutParameter("Event_Id", Types.INTEGER);
            cstmt.setNString("Title", event.getTitle());
            cstmt.setString("Logo", event.getLogo());
            cstmt.setNString("Description", event.getDescription());
            cstmt.setNString("Speaker", event.getSpeaker());
            cstmt.setNString("Address", event.getAddress());
            cstmt.setNString("Slogan", event.getSlogan());
            cstmt.setDate("StartDate", new Date(event.getStartDate().getMillis()) );
            cstmt.setDate("EndDate", new Date(event.getEndDate().getMillis()) );
            cstmt.setInt("Cate_Id", event.getCate_Id());
            int result = cstmt.executeUpdate();
            int event_Id = cstmt.getInt("Event_Id");
            event.setEvent_Id(event_Id);
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            try {
                if(conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
    
    public Map<Integer, Event> selectAllFromEvent() {
        Map<Integer, Event> mapOfEvents = new LinkedHashMap<Integer, Event>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_event_select}");
            ResultSet rs = cstmt.executeQuery();
            while(rs.next()) {
                int event_Id = rs.getInt("Event_Id");
                String title = rs.getString("Title");
                DateTime startDate = new DateTime( rs.getDate("StartDate").getTime() );
                DateTime endDate = new DateTime( rs.getDate("EndDate").getTime() );
                String logo = rs.getString("Logo");
                int cate_Id = rs.getInt("Cate_Id");
                Event entity = new Event(event_Id, title, startDate, endDate, logo, cate_Id);
                mapOfEvents.put(event_Id, entity);
                return mapOfEvents;
            }
        } catch(SQLException se) {
            se.printStackTrace();
        } finally {
            try {
                if(conn != null) 
                    conn.close();
            } catch(SQLException se) {
                se.printStackTrace();
            }
        }
        return null;
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

    public void uploadLogo(Part filePart, String fileName) throws
            FileNotFoundException, IOException{
        fileName = getFileName(filePart);
        OutputStream out = null;
        InputStream filecontent = null;

        out = new FileOutputStream(new File("D:/06.Drive/SVN/trunk/KSCClubBand/img" + File.separator + fileName));
        filecontent = filePart.getInputStream();

        int read = 0;
        final byte[] bytes = new byte[1024];

        while((read = filecontent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
        }
        if(out != null)
            out.close();
        if(filecontent != null)
            filecontent.close();
    }
}
