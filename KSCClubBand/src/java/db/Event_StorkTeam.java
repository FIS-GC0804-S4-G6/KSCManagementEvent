package db;

import java.sql.Connection;
import model.Event;
import java.sql.CallableStatement;
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
import java.sql.PreparedStatement;
import java.sql.Timestamp;

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
            cstmt.setTimestamp("StartDate", new Timestamp(event.getStartDate().getMillis()) );
            cstmt.setTimestamp("EndDate", new Timestamp(event.getEndDate().getMillis()) );
            cstmt.setInt("Cate_Id", event.getCategory().getCate_Id());
            cstmt.executeUpdate();
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
    
    public Map<Integer, Event> selectEvent(int pageNumber, int rowsPage) {
        Map<Integer, Event> mapOfEvents = new LinkedHashMap<Integer, Event>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_event_select(?,?)}");
            cstmt.setInt("PageNumber", pageNumber);
            cstmt.setInt("RowsPage", rowsPage);
            ResultSet rs = cstmt.executeQuery();
            while(rs.next()) {
                int event_Id = rs.getInt("Event_Id");
                String title = rs.getString("Title");
                String address = rs.getString("Address");
                DateTime startDate = new DateTime( rs.getTimestamp("StartDate").getTime() );
                DateTime endDate = new DateTime( rs.getTimestamp("EndDate").getTime() );
                int cate_Id = rs.getInt("Cate_Id");
                String categoryName = rs.getString("CategoryName");
                int amountPaticipants = rs.getInt("AmountPaticipants");
                float sumPrice = rs.getFloat("SumPrice");
                Event entity = new Event(event_Id, title, address, startDate, endDate, cate_Id, categoryName, amountPaticipants, sumPrice);
                mapOfEvents.put(event_Id, entity);
            }
            return mapOfEvents;
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

    public String uploadLogo(Part filePart, String fileName, String path) throws
            FileNotFoundException, IOException{
        fileName = getFileName(filePart);
        OutputStream out = null;
        InputStream filecontent = null;

        out = new FileOutputStream(new File(path + File.separator + fileName));
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
        return fileName;
    }
    
    public Map<Integer, Event> filterEvent(int pageNumber, int rowsPage, Event event) {
        Map<Integer, Event> mapOfEvents = new LinkedHashMap<Integer, Event>();
        Connection conn = null;
        
        String title = event.getTitle();
        DateTime startDate = event.getStartDate();
        DateTime endDate = event.getEndDate();
        String address = event.getAddress();
        StringBuilder selectSuaBo = new StringBuilder("declare @Current datetime = GETDATE()");
        selectSuaBo.append("select CE.AmountPaticipants, CE.SumPrice, \"TimeStatus\" = \n");
        selectSuaBo.append("case\n");
        selectSuaBo.append("\twhen EndDate < GETDATE() then 'Past'\n");
        selectSuaBo.append("\twhen StartDate <= @Current and @Current < EndDate then 'In Processing'\n");
        selectSuaBo.append("\twhen GETDATE() < StartDate then 'In the Future'\n");
        selectSuaBo.append("\tend,\n");
        selectSuaBo.append("\tC.CategoryName, E.*\n");
        selectSuaBo.append("from Event as E\n");
        selectSuaBo.append("left outer join\n");
        selectSuaBo.append("(");
        selectSuaBo.append("\tselect Event_Id, count(*) as AmountPaticipants, sum(Price) as SumPrice from Cust_Event\n");
        selectSuaBo.append("\twhere IsDelete = 0\n");
        selectSuaBo.append("\tgroup by Event_Id\n");
        
        selectSuaBo.append(") CE\n");
        selectSuaBo.append("on E.Event_Id = CE.Event_Id\n");
        selectSuaBo.append("join Category as C on\n");
        selectSuaBo.append("E.Cate_Id = C.Cate_Id\n");
        selectSuaBo.append("where E.IsDelete = 0 and\n");
        Map<String, Integer>  map = new LinkedHashMap<String, Integer>();
        boolean head = false;
        int numb = 0;
        if(title == null && startDate == null && endDate == null && address == null) {
            return null;
        }
        if(title != null) {
            selectSuaBo.append("Title like '%' + ? + '%'\n");
            head = true;
            map.put("title", ++numb);
        }
        if(startDate != null) {
            if(head) {
                selectSuaBo.append(" and ");
            }
            selectSuaBo.append("StartDate <= ?\n");
            map.put("startDate", ++numb);
        }
        if(endDate != null) {
            if(head) {
                selectSuaBo.append(" and ");
            }
            selectSuaBo.append("EndDate >= ?\n");
            map.put("endDate", ++numb);
        }
        if(address != null) {
            if(head) {
                selectSuaBo.append(" and ");
            }
            selectSuaBo.append("Address like '%' + ? + '%'\n");
            map.put("address", ++numb);
        }
        selectSuaBo.append("order by Event_Id\n");
        selectSuaBo.append("offset ((? - 1) * ?) rows\n");
        selectSuaBo.append("fetch next ? rows only");
        System.out.println(selectSuaBo.toString());
        try {
            conn = ConnectionUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement(selectSuaBo.toString());
            if(title != null) {
                pst.setString(map.get("title"), title);
            }
            if(startDate != null) {
                pst.setTimestamp( map.get("startDate"), new Timestamp(startDate.getMillis()) );
            }
            if(endDate != null) {
                pst.setTimestamp( map.get("endDate"), new Timestamp(endDate.getMillis()) );
            }
            if(address != null) {
                pst.setString( map.get("address"), address);
            }
            pst.setInt(map.size() + 1, pageNumber);
            pst.setInt(map.size() + 2, rowsPage);
            pst.setInt(map.size() + 3, rowsPage);
            ResultSet rs = pst.executeQuery();
            while(rs.next()) {
                int event_Id = rs.getInt("Event_Id");
                String ttitle = rs.getString("Title");
                DateTime tstartDate = new DateTime(rs.getTimestamp("StartDate"));
                DateTime tendDate = new DateTime(rs.getTimestamp("EndDate"));
                int cate_Id = rs.getInt("Cate_Id");
                String categoryName = rs.getString("CategoryName");
                String taddress = rs.getString("Address");
                int amountPaticipants = rs.getInt("AmountPaticipants");
                float sumPrice = rs.getFloat("SumPrice");
                Event entity = new Event(event_Id, ttitle, taddress, tstartDate, tendDate, cate_Id, categoryName, amountPaticipants, sumPrice);
                mapOfEvents.put(event_Id, entity);
                System.out.println("title: " + title);
            }
            return mapOfEvents;
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
    
//    public int selectEventFilterCounting(Event event) {
//        Connection conn = null;
//        String title = event.getTitle();
//        DateTime startDate = event.getStartDate();
//        DateTime endDate = event.getEndDate();
//        String address = event.getAddress();
//        StringBuilder selectSuaBo = new StringBuilder("declare @Current datetime = GETDATE()");
//        try {
//            conn = ConnectionUtil.getConnection();
//        } catch(SQLException se) {
//            se.printStackTrace();
//        }
//    }
    
    public Event selectEventByEvent_Id(int event_Id) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_event_select_by_eventId(?)}");
            cstmt.setInt("Event_Id", event_Id);
            ResultSet rs = cstmt.executeQuery();
            Event entity = new Event();
            if(rs.next()) {
                String title = rs.getString("Title");
                String logo = rs.getString("Logo");
                String description = rs.getString("Description");
                String speaker = rs.getString("Speaker");
                String address = rs.getString("Address");
                String slogan = rs.getString("Slogan");
                DateTime startDate = new DateTime(rs.getTimestamp("StartDate"));
                DateTime endDate = new DateTime(rs.getTimestamp("endDate"));
                String categoryName = rs.getString("CategoryName");
                int cate_Id = rs.getInt("cate_Id");
                entity = new Event(event_Id, title, logo, description, speaker, address, slogan, startDate, endDate, categoryName, cate_Id);
            }
            return entity;
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
    
    public boolean deleteLogoByEvent_Id(int key) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_event_delete_logo_by_eventId(?)}");
            cstmt.setInt("Event_Id", key);
            int result = cstmt.executeUpdate();
            return result > 0;
        } catch(SQLException se) {
            se.printStackTrace();
            return false;
        } finally {
            try {
                if(conn != null)
                    conn.close();
            } catch(SQLException se) {
                se.printStackTrace();
            }
        }
    }
    
    public int countAllEvent() {
        Connection conn = null;
        int amountEvent = -1;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_count_all_event(?)}");
            cstmt.registerOutParameter("AmountEvent", Types.INTEGER);
            cstmt.execute();
            amountEvent = cstmt.getInt("AmountEvent");
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
        return amountEvent;
    }
    
    public static void main(String[] arg) {
        Event_StorkTeam db = new Event_StorkTeam();
        System.out.println(db.countAllEvent());
    }
}
