/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mike.model;

import com.mike.utils.ConnectionUtil;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen
 */
public class Cust_EventDb {

    private String driver = null;
    private String servername = null;
    private String port = null;
    private String database = null;
    private String username = null;
    private String password = null;

    public Cust_EventDb(String driver, String servername, String port, String databsae, String username, String password) {
        this.driver = driver;
        this.servername = servername;
        this.port = port;
        this.database = databsae;
        this.username = username;
        this.password = password;
    }

    public boolean choosePriceAndPayment(int cust_Id, int price_Id, int payment_Id, int event_Id, String ticketCode, float price) {
        try {
            Connection conn = null;
            CallableStatement cstm = null;
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call choosePriceAndPayment(?, ?, ?, ?, ?, ?)}");
            cstm.setInt(1, cust_Id);
            cstm.setInt(2, price_Id);
            cstm.setInt(3, payment_Id);
            cstm.setInt(4, event_Id);
            cstm.setString(5, ticketCode);
            cstm.setFloat(6, price);
            cstm.executeUpdate();
            return true;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Cust_EventDb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Cust_EventDb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Cust_EventDb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Cust_EventDb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
