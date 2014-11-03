package db;

import java.util.List;
import java.util.ArrayList;
import model.Event_Price;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Event_Price_StorkTeam {

    public List<Event_Price> selectEvent_PriceByEvent_Id(int event_Id) {
        List<Event_Price> listOfEvent_Prices = new ArrayList<Event_Price>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_event_price_select_by_eventId(?)}");
            cstmt.setInt("Event_Id", event_Id);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                int price_Id = rs.getInt("Price_Id");
                float price = rs.getFloat("Price");
                String description = rs.getString("Description");
                Event_Price event_Price = new Event_Price(price_Id, price, description);
                listOfEvent_Prices.add(event_Price);
            }
            return listOfEvent_Prices;
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        return null;
    }

    public void insertEvent_Price(Event_Price entity) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_event_price_inserting(?, ?, ?, ?)}");
            cstmt.registerOutParameter("Price_Id", Types.INTEGER);
            cstmt.setInt("Event_Id", entity.getEvent_Id());
            cstmt.setFloat("Price", entity.getPrice());
            cstmt.setString("Description", entity.getDescription());
            cstmt.executeUpdate();
            int price_Id = cstmt.getInt("Price_Id");
            entity.setPrice_Id(price_Id);
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }

    public boolean editEventPrice(Event_Price event_price) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_event_price_editing(?,?,?)}");
            cstmt.setInt("Price_Id", event_price.getPrice_Id());
            cstmt.setFloat("Price", event_price.getPrice());
            cstmt.setNString("Description", event_price.getDescription());
            int result = cstmt.executeUpdate();
            return result > 0;
        } catch (SQLException ex) {
            Logger.getLogger(Event_Price_StorkTeam.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        return false;
    }

    public boolean deleteEventPriceByPriceId(int price_Id) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_event_price_deleting_by_priceId(?)}");
            cstmt.setInt("Price_Id", price_Id);
            int result = cstmt.executeUpdate();
            return result > 0;
        } catch (SQLException ex) {
            Logger.getLogger(Event_Price_StorkTeam.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        return false;
    }
}
