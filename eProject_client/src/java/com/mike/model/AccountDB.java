package com.mike.model;

import com.mike.utils.ConnectionUtil;
import com.mike.utils.EmailDeploy;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mike
 */
public class AccountDB {

    private String driver = null;
    private String servername = null;
    private String port = null;
    private String database = null;
    private String username = null;
    private String password = null;

    public AccountDB(String driver, String servername, String port, String databsae, String username, String password) {
        this.driver = driver;
        this.servername = servername;
        this.port = port;
        this.database = databsae;
        this.username = username;
        this.password = password;
    }

    public Account login(String email, String pwd) {
        Connection conn = null;
        CallableStatement cstm = null;
        ResultSet rs = null;
        try {
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call spLogin(?, ?)}");
            cstm.setString(1, email);
            cstm.setString(2, pwd);
            rs = cstm.executeQuery();
            if (rs.next()) {
                if (rs.getInt("Cust_Id") > 0) {
                    Account account = new Account(rs.getInt("Cust_Id"),
                            rs.getString("Email"),
                            rs.getString("FullName"),
                            rs.getString("Password"),
                            rs.getBoolean("Gender"),
                            rs.getDate("DateOfBirth"),
                            rs.getString("Address"),
                            rs.getString("Mobile"),
                            rs.getString("Home"),
                            rs.getString("IDCard"),
                            rs.getString("Avatar"),
                            rs.getInt("Role_Id"),
                            rs.getInt("Univercode"),
                            rs.getBoolean("Active"));
                    if (account.isActive() == true) {
                        account.setEmail(rs.getString("Cust_Id"));
                        account.setEmail(rs.getString("Email"));
                        account.setFullname(rs.getString("FullName"));
                        account.setGender(rs.getBoolean("Gender"));
                        account.setDateOfBirth(rs.getDate("DateOfBirth"));
                        account.setAddress(rs.getString("Address"));
                        account.setMobile(rs.getString("Mobile"));
                        account.setHome(rs.getString("Home"));
                        account.setIdCard(rs.getString("IDCard"));
                        account.setAvatar(rs.getString("Avatar"));
                        account.setRoleID(rs.getInt("Role_Id"));
                        account.setUnivercode(rs.getInt("Univercode"));
                        account.setActive(rs.getBoolean("Active"));
                        return account;
                    }
                }
            }
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                cstm.close();
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public Account session(int cust_Id, String browserType) {
        Connection conn = null;
        CallableStatement cstm = null;
        ResultSet rs = null;
        try {
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call spSession(?, ?)}");
            cstm.setInt(1, cust_Id);
            cstm.setString(2, browserType);
            rs = cstm.executeQuery();
            if (rs.next()) {
                if (rs.getInt("Cust_Id") > 0) {
                    Account account = new Account(rs.getInt("Cust_Id"), rs.getString("Device"), rs.getString("SID_Device"));
                    account.setDevice(rs.getString("Device"));
                    account.setSid_Device(rs.getString("SID_Device"));
                    return account;
                }
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean logOut(String email, String sid, String device) {
        Connection conn = null;
        CallableStatement cstm = null;
        try {
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("CALL spSignout(?, ?, ?)");
            cstm.setString(1, email);
            cstm.setString(2, sid);
            cstm.setString(3, device);
            return true;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                cstm.close();
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    public boolean rememberMe(int cust_Id, String sid_device, String device) {
        Connection conn = null;
        CallableStatement cstm = null;
        try {
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call spRemember(?, ?, ?)}");
            cstm.setInt(1, cust_Id);
            cstm.setString(2, sid_device);
            cstm.setString(3, device);
            cstm.addBatch();
            cstm.executeBatch();
            return true;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                cstm.close();
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    public boolean signup(String email, String name, String custPassword, boolean gender) {
        try {
            Connection conn = null;
            CallableStatement cstm = null;
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call spRegister (?, ?, ?, ?)}");
            cstm.setString(1, email);
            cstm.setString(2, name);
            cstm.setString(3, custPassword);
            cstm.setBoolean(4, gender);
            cstm.addBatch();
            cstm.executeBatch();
            return true;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void senderAPI(final String emailUsername, final String emailPassword, boolean auth, boolean tls, String host, String port, String fullName, String toEmail, String custPassword) {
        EmailDeploy mail = new EmailDeploy();
        String linkActive = "http://localhost:8080/eProject_client/autoActive?act=" + toEmail;
        String content = "Chào mừng " + fullName + " đã đăng kí tham gia làm thành viên của KSCEvent \n\n"
                + "KSCEvent là nơi bạn có thể tìm kiếm và tham gia vào các hoạt động của trường KSC \n\n"
                + "Nơi giao lưu học hỏi và giải trí giúp các sinh viên có được kiến thức và nâng cao "
                + "kĩ năng giao tiếp. \n\n"
                + "Thông tin tài khoản của bạn: \n\n"
                + "username " + toEmail + "\n\n"
                + "password " + custPassword + "\n\n"
                + "Hãy click vào link sau để active tài khoản của bạn: \n\n"
                + linkActive;
        mail.emailSender(emailUsername, emailPassword, auth, tls, host, port, emailUsername, toEmail, "Admin KSCSchool - Register Complete", content);
    }

//    public static void main(String[] arg){
////        String driver, String servername, String port, String databsae, String username, String password
//        AccountDB db = new AccountDB("com.microsoft.sqlserver.jdbc.SQLServerDriver", "localhost", "1433", "KSCManagementEvent", "sa", "sa");
//        db.custActiveLink("ducndgc00467@fpt.edu.vn", true);
//        
//    }
    
    public boolean custActiveLink(String email, boolean active) {
        Connection conn = null;
        CallableStatement cstm = null;
        try {
            ConnectionUtil connector = new ConnectionUtil(driver, servername, port, database, username, password);
            conn = connector.getConnection();
            cstm = (CallableStatement) conn.prepareCall("{call spActiveLink(?, ?)}");
            cstm.setString(1, email);
            cstm.setBoolean(2, active);
            cstm.addBatch();
            cstm.executeUpdate();
            return true;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
