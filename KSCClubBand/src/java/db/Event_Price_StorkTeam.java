package db;

import java.util.List;
import java.util.ArrayList;
import model.Event_Price;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Event_Price_StorkTeam {
    public List<Event_Price> selectEvent_PriceByEvent_Id(int event_Id) {
        List<Event_Price> listOfEvent_Prices = new ArrayList<Event_Price>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_event_price_select_by_eventId(?)}");
            cstmt.setInt("Event_Id", event_Id);
            ResultSet rs = cstmt.executeQuery();
            while(rs.next()) {
                int price_Id = rs.getInt("Price_Id");
                float price = rs.getFloat("Price");
                String description = rs.getString("Description");
                Event_Price event_Price = new Event_Price(price_Id, price, description);
                listOfEvent_Prices.add(event_Price);
            }
            return listOfEvent_Prices;
        } catch(SQLException se) {
            se.printStackTrace();
        } finally {
            try {
                if(conn != null) {
                    conn.close();
                }
            } catch(SQLException se) {
                se.printStackTrace();
            }
        }
        return null;
    }
}
