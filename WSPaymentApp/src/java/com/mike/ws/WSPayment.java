/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mike.ws;

import com.mike.model.Account;
import com.mike.model.AccountDB;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Graham
 */
@WebService(serviceName = "WSPayment")
public class WSPayment {
    /**
     * Web service operation
     */
    @WebMethod(operationName = "PaymentOnline")
    public Boolean PaymentOnline(@WebParam(name = "bankCodeClient") String bankCodeClient, @WebParam(name = "bankCodeCompany") String bankCodeCompany, @WebParam(name = "money") float money) {
        AccountDB db = new AccountDB();
        Account account;
        
        account = db.checkExist(bankCodeClient);
        if (bankCodeClient != null && bankCodeClient != "" && bankCodeClient != " " && account != null) {
            if (money > 0 && money < account.getMoney()) {
                int transferComplete = db.transferMoney(bankCodeClient, bankCodeCompany, money);
                if (transferComplete > 0) {
                    return true;
                }
            }
        }
        return false;
    }
}
