/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mike.model;

/**
 *
 * @author Nguyen
 */
public class Payment_Option {
    private int payment_Id;
    private String paymentType;

    public Payment_Option(int payment_Id, String paymentType) {
        this.payment_Id = payment_Id;
        this.paymentType = paymentType;
    }

    public int getPayment_Id() {
        return payment_Id;
    }

    public void setPayment_Id(int payment_Id) {
        this.payment_Id = payment_Id;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }
    
}
