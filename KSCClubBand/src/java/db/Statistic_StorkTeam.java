package db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

public class Statistic_StorkTeam {
    public Float selectSumPriceMonth(int year, int month) {
        Connection conn = null;
        float sum = 0;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_select_sumPrice_month(?, ?)}");
            cstmt.setInt("Year", year);
            cstmt.setInt("Month", month);
            ResultSet rs = cstmt.executeQuery();
            if(rs.next()) {
                sum = rs.getFloat("Sum");
            }
            return sum;
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
    
    public Map<Integer, Float> selectSumPriceEveryMonthOfYear(int year) {
        Map<Integer, Float> mapOfSumPrice = new LinkedHashMap<Integer, Float>();
        for(int month = 1; month <= 12; month++) {
            Float val = selectSumPriceMonth(year, month);
            mapOfSumPrice.put(month, val);
        }
        return mapOfSumPrice;
    }
    
    public Integer selectAmountEventMonth(int year, int month) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_select_amount_event_month(?, ?)}");
            cstmt.setInt("Year", year);
            cstmt.setInt("Month", month);
            ResultSet rs = cstmt.executeQuery();
            int amount = 0;
            while(rs.next()) {
                amount = rs.getInt("Amount");
            }
            return amount;
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
    
    public Map<Integer, Integer> selectAmountEventEveryMonthOfYear(int year) {
        Map<Integer, Integer> mapOfAmountEvents = new LinkedHashMap<Integer, Integer>();
        for(int month = 1; month <= 12; month++) {
            Integer amount = selectAmountEventMonth(year, month);
            mapOfAmountEvents.put(month, amount);
        }
        return mapOfAmountEvents;
    }
    
    public Integer selectAmountParticipantsMonth(int year, int month) {
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_select_amount_participants_month(?, ?)}");
            cstmt.setInt("Year", year);
            cstmt.setInt("Month", month);
            ResultSet rs = cstmt.executeQuery();
            int amountParticipants = 0;
            if(rs.next()) {
                amountParticipants = rs.getInt("AmountParticipants");
            }
            return amountParticipants;
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
    
    public Map<Integer, Integer> selectAmountParticipantsEveryMonthOfYear(int year) {
        Map<Integer, Integer> mapOfAmountParticipants = new LinkedHashMap<Integer, Integer>();
        for(int month = 1; month <= 12; month++) {
            int amount = selectAmountParticipantsMonth(year, month);
            mapOfAmountParticipants.put(month, amount);
        }
        return mapOfAmountParticipants;
    }
    
    public Map<String, Integer> selectAmountClassifyEventsMonth(int year, int month) {
        Map<String, Integer> mapClassifyEvents = new LinkedHashMap<String, Integer>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_select_amount_classify_events_month(?,?)}");
            cstmt.setInt("Year", year);
            cstmt.setInt("Month", month);
            ResultSet rs = cstmt.executeQuery();
            while(rs.next()) {
                String type = rs.getString("Type");
                int amount = rs.getInt("Amount");
                mapClassifyEvents.put(type, amount);
            }
            return mapClassifyEvents;
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
        Statistic_StorkTeam db = new Statistic_StorkTeam();
        Map<String, Integer> map = db.selectAmountClassifyEventsMonth(2016, 1);
        for(Map.Entry<String, Integer> entry : map.entrySet()) {
            System.out.println(entry.getKey() + " - " + entry.getValue());
        }
    }
}