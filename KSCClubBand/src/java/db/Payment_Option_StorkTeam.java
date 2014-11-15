package db;

import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Payment_Option;
import java.util.Map;
import java.util.LinkedHashMap;

public class Payment_Option_StorkTeam {
    public Map<Integer, Payment_Option> selectAllFromPayment_Option() {
        Map<Integer, Payment_Option> mapOfPayment_Options = new LinkedHashMap<Integer, Payment_Option>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call sp_payment_option_select}");
            ResultSet rs = cstmt.executeQuery();
            while(rs.next()) {
                int payment_Id = rs.getInt("Payment_Id");
                String payment_Type = rs.getString("Payment_Type");
                Payment_Option entity = new Payment_Option(payment_Id, payment_Type);
                mapOfPayment_Options.put(payment_Id, entity);
            }
            return mapOfPayment_Options;
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
}
