/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mike.model;

import com.mike.utils.ConnectionUtil;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen
 */
public class Payment_OptionDb {

    private String driver = null;
    private String servername = null;
    private String port = null;
    private String database = null;
    private String username = null;
    private String password = null;

    public Payment_OptionDb(String driver, String servername, String port, String database, String username, String password) {
        this.driver = driver;
        this.servername = servername;
        this.port = port;
        this.database = database;
        this.username = username;
        this.password = password;
    }

    public List<Payment_Option> showPaymentType() {
        Connection conn = null;
        CallableStatement cstm = null;
        ResultSet rs = null;
        List<Payment_Option> listPaymentType = new LinkedList<Payment_Option>();
        try {
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call showPaymentType()}");
            rs = cstm.executeQuery();
            while (rs.next()) {
                Payment_Option paymentOption = new Payment_Option(
                        rs.getInt("Payment_Id"),
                        rs.getString("Payment_Type"));
                listPaymentType.add(paymentOption);
            }
            return listPaymentType;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventDb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(EventDb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(EventDb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EventDb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
