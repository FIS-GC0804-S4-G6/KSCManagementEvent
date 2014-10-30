package db;

import java.sql.Connection;
import model.Event;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.SQLException;

public class Event_StorkTeam {
    public boolean addEvent(Event event) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{ call sp_event_creating(?,?,?,?,?,  ?,?,?,?) }");
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
            return result > 0;
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
        return false;
    }
}
