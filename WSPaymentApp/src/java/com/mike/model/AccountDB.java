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

/**
 *
 * @author Graham
 */
public class AccountDB {

    public Account checkExist(String codeBank) {
        Connection conn = null;
        CallableStatement cstm = null;
        ResultSet rs = null;
        try {
            ConnectionUtil connector = new ConnectionUtil();
            conn = connector.getConnection("PaymentService");
            cstm = (CallableStatement) conn.prepareCall("{call spCheckAccountExist(?)}");
            cstm.setString(1, codeBank);
            rs = cstm.executeQuery();
            if (rs.next()) {
                Account account = new Account(rs.getInt("id"), rs.getString("bankCode"), rs.getString("fullName"), rs.getString("address"), rs.getFloat("money"));
                return account;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int transferMoney(String bankCodeClient, String bankCodeCompany, float money) {
        Connection conn = null;
        CallableStatement cstm = null;
        try {
            ConnectionUtil connector = new ConnectionUtil();
            conn = connector.getConnection("PaymentService");
            cstm = (CallableStatement) conn.prepareCall("{call spTransfer(?, ?, ?)}");
            cstm.setString(1, bankCodeClient);
            cstm.setString(2, bankCodeCompany);
            cstm.setFloat(3, money);
            int i = cstm.executeUpdate();
            if (i > 0) {
                return i;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
