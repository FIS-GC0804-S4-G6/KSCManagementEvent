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
import org.joda.time.DateTime;

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

    public EventDb(String driver, String servername, String port, String database, String username, String password) {
        this.driver = driver;
        this.servername = servername;
        this.port = port;
        this.database = database;
        this.username = username;
        this.password = password;
    }

    public Event showEventDetail(int event_Id) {
        Connection conn = null;
        CallableStatement cstm = null;
        ResultSet rs = null;
        try {
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call showEventDetail(?)}");
            cstm.setInt(1, event_Id);
            rs = cstm.executeQuery();
            if (rs.next()) {
                Event event = new Event(
                        rs.getString("Title"),
                        rs.getString("Logo"),
                        rs.getString("Description"),
                        rs.getString("Speaker"),
                        rs.getString("Address"),
                        rs.getString("Slogan"),
                        new DateTime(rs.getTimestamp("StartDate")),
                        new DateTime(rs.getTimestamp("EndDate")),
                        rs.getString("CategoryName")
                );
                return event;
            }
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

    public List<Event> showEventPicture(int event_Id) {
        Connection conn = null;
        CallableStatement cstm = null;
        ResultSet rs = null;
        List<Event> listEvtPic = new LinkedList<Event>();
        try {
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call showEventPicture(?)}");
            cstm.setInt(1, event_Id);
            rs = cstm.executeQuery();
            while (rs.next()) {
                Event event = new Event(rs.getString("PicturePath"));
                listEvtPic.add(event);
            }
            return listEvtPic;
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

    public List<Event> showEventPrice(int event_Id) {
        Connection conn = null;
        CallableStatement cstm = null;
        ResultSet rs = null;
        List<Event> listEvt = new LinkedList<Event>();
        try {
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call showEventPrice(?)}");
            cstm.setInt(1, event_Id);
            rs = cstm.executeQuery();
            while (rs.next()) {
                Event event = new Event(rs.getInt("Price_Id"), rs.getFloat("Price"));
                listEvt.add(event);
            }
            return listEvt;
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

    public List<Event> showCustEvent(int event_Id) {
        Connection conn = null;
        CallableStatement cstm = null;
        ResultSet rs = null;
        List<Event> listCusEvt = new LinkedList<Event>();
        try {
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call showCustEvent(?)}");
            cstm.setInt(1, event_Id);
            rs = cstm.executeQuery();
            while (rs.next()) {
                Event event = new Event(
                        rs.getString("FullName"),
                        rs.getString("Avatar"),
                        rs.getString("Email"),
                        rs.getString("Payment_Type"));
                listCusEvt.add(event);
            }
            return listCusEvt;
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

    public List<Event> showEvent() {
        Connection conn = null;
        CallableStatement cstm = null;
        ResultSet rs = null;
        List<Event> events = new LinkedList<Event>();
        try {
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call showEvent()}");
            rs = cstm.executeQuery();
            while (rs.next()) {
                Event event = new Event(
                        rs.getInt("Event_Id"),
                        rs.getString("Title"),
                        rs.getString("Logo"),
                        rs.getString("Description"));
                events.add(event);
            }
            return events;
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
