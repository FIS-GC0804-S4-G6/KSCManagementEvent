package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {
    public static Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=KSCManagementEvent", "sa", "sa123");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException se) {
            se.printStackTrace();
        }
        return null;
    }
    
    public static void main(String[] args) {
        System.out.println( getConnection() );
    }
}