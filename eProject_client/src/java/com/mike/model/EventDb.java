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
public class EventDb {
    private String driver = null;
    private String servername = null;
    private String port = null;
    private String database = null;
    private String username = null;
    private String password = null;

      public static void main(String[] arg){
        EventDb db = new EventDb("com.microsoft.sqlserver.jdbc.SQLServerDriver", "localhost", "1433", "KSCManagementEvent", "sa", "sa");
        db.showEventDetail();
        
    }

    private Event showEventDetail(int event_Id) {
        try {
            Connection conn = null;
            CallableStatement cstm = null;
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call showEventDetail(?)}");
            cstm.setInt(1, event_Id);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventDb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(EventDb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(EventDb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EventDb.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
