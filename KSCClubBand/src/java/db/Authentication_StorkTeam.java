/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;
//import org.joda.time.DateTime;
import java.sql.Date;

/**
 *
 * @author Nguyen
 */
public class Authentication_StorkTeam {

    public Customer login(String email, String pwd) {
        Connection conn = null;
        CallableStatement cstm = null;
        ResultSet rs = null;
        try {
            conn = ConnectionUtil.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call spLoginAdmin(?, ?)}");
            cstm.setString(1, email);
            cstm.setString(2, pwd);
            rs = cstm.executeQuery();
            if (rs.next()) {
                if (rs.getInt("Cust_Id") > 0) {
                    Customer customer = new Customer(
                            rs.getInt("Cust_Id"),
                            rs.getString("Email"),
                            rs.getString("FullName"),
                            rs.getBoolean("Gender"),
                            rs.getDate("DateOfBirth"),
                            rs.getString("Address"),
                            rs.getString("Mobile"),
                            rs.getString("Home"),
                            rs.getString("IDCard"),
                            rs.getString("Avatar"),
                            rs.getString("UniversityName")
                    );
                    return customer;
                }
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(Authentication_StorkTeam.class.getName()).log(Level.SEVERE, null, ex);
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

    public Customer session(int cust_Id, String browserType) {
        Connection conn = null;
        CallableStatement cstm = null;
        ResultSet rs = null;
        try {
            conn = ConnectionUtil.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call spSession(?, ?)}");
            cstm.setInt(1, cust_Id);
            cstm.setString(2, browserType);
            rs = cstm.executeQuery();
            if (rs.next()) {
                if (rs.getInt("Cust_Id") > 0) {
                    Customer customer = new Customer(rs.getInt("Cust_Id"), rs.getString("Device"), rs.getString("SID_Device"));
                    customer.setDevice(rs.getString("Device"));
                    customer.setSid_Device(rs.getString("SID_Device"));
                    return customer;
                }
            }
            return null;

        } catch (SQLException ex) {
            Logger.getLogger(Authentication_StorkTeam.class.getName()).log(Level.SEVERE, null, ex);
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

    public boolean rememberMe(int cust_Id, String sid_device, String device) {
        Connection conn = null;
        CallableStatement cstm = null;
        try {
            conn = ConnectionUtil.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call spRemember(?, ?, ?)}");
            cstm.setInt(1, cust_Id);
            cstm.setString(2, sid_device);
            cstm.setString(3, device);
            cstm.addBatch();
            cstm.executeBatch();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Authentication_StorkTeam.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                cstm.close();
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(Authentication_StorkTeam.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
}
