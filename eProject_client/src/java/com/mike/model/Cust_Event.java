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
public class Cust_Event {

    private int cust_Id;
    private int price_Id;
    private int payment_Id;
    private int event_Id;
    private String ticketCode;
    private float price;
    private int isDelete;

    public Cust_Event(int cust_Id, int price_Id, int payment_Id, int event_Id, String ticketCode, float price) {
        this.cust_Id = cust_Id;
        this.price_Id = price_Id;
        this.payment_Id = payment_Id;
        this.event_Id = event_Id;
        this.ticketCode = ticketCode;
        this.price = price;
    }

    public int getCust_Id() {
        return cust_Id;
    }

    public void setCust_Id(int cust_Id) {
        this.cust_Id = cust_Id;
    }

    public int getPrice_Id() {
        return price_Id;
    }

    public void setPrice_Id(int price_Id) {
        this.price_Id = price_Id;
    }

    public int getPayment_Id() {
        return payment_Id;
    }

    public void setPayment_Id(int payment_Id) {
        this.payment_Id = payment_Id;
    }

    public int getEvent_Id() {
        return event_Id;
    }

    public void setEvent_Id(int event_Id) {
        this.event_Id = event_Id;
    }

    public String getTicketCode() {
        return ticketCode;
    }

    public void setTicketCode(String ticketCode) {
        this.ticketCode = ticketCode;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
    }

}
