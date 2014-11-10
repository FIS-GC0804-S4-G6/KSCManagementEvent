package com.mike.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Mike
 */


public class ConnectionUtil {
    private String driver = null;
    private String servername = null;
    private String port = null;
    private String database = null;
    private String username = null;
    private String password = null;
    
    public ConnectionUtil(String driver, String servername, String port, String databsae, String username, String password) {
        this.driver = driver;
        this.servername = servername;
        this.port = port;
        this.database = databsae;
        this.username = username;
        this.password = password;
    }
    
    public Connection getConnection() 
            throws ClassNotFoundException, 
                   InstantiationException, 
                   IllegalAccessException, 
                   SQLException {
        Class.forName(driver).newInstance();
        String url = "jdbc:sqlserver://" + servername + ":" + port + ";databaseName=" + database;
        return (Connection) DriverManager.getConnection(url, username, password);
    }  

}
