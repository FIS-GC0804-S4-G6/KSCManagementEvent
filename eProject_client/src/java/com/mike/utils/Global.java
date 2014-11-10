/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mike.utils;

/**
 *
 * @author Nguyen
 */
public class Global {
    private static String custEmail = null;

    public static String getCustEmail() {
        return custEmail;
    }

    public static void setCustEmail(String custEmail) {
        Global.custEmail = custEmail;
    }
    
}
