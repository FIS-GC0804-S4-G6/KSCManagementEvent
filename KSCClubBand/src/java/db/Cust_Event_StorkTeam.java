package db;

import model.Cust_Event;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.LinkedHashMap;

public class Cust_Event_StorkTeam {
    public Map<String, Cust_Event> selectParticipantsFromEvent(int event_Id) {
        Map<String, Cust_Event> mapOfCust_Events = new LinkedHashMap<String, Cust_Event>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_select_participants_from_event(?)}");
            cstmt.setInt("Event_Id", event_Id);
            ResultSet rs = cstmt.executeQuery();
            while(rs.next()) {
                String ticketCode = rs.getString("TicketCode");
                float realPrice = rs.getFloat("RealPrice");
                int price_Id = rs.getInt("Price_Id");
                String payment_Type = rs.getString("Payment_Type");
                int payment_Id = rs.getInt("Payment_Id");
                String email = rs.getString("Email");
                String fullName = rs.getString("FullName");
                Cust_Event entity = new Cust_Event(ticketCode, realPrice, payment_Type, payment_Id, email, fullName);
                mapOfCust_Events.put(ticketCode ,entity);
            }
            return mapOfCust_Events;
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
    
    public static void main(String[] arg) {
        Cust_Event_StorkTeam db= new Cust_Event_StorkTeam();
        Map<String, Cust_Event> map = db.selectParticipantsFromEvent(1);
        java.util.Iterator it = map.entrySet().iterator();
        while(it.hasNext()) {
            Map.Entry pairs = (Map.Entry) it.next();
            System.out.println(pairs.getValue());
        }
    }
}
