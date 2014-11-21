package com.mike.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Mike
 */


public class ConnectionUtil {    
    public Connection getConnection(String database) 
            throws ClassNotFoundException, 
                   InstantiationException, 
                   IllegalAccessException, 
                   SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
        String url = "jdbc:sqlserver://" + "localhost" + ":" + "1433" + ";databaseName=" + database;
        return (Connection) DriverManager.getConnection(url, "sa", "sa");
    }  

}
