/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mike.model;

/**
 *
 * @author Graham
 */
public class ExchangeHistory {
    private int id;
    private String bankCodeClient;
    private String bankCodeCompany;
    private float moneyTransfer;

    public ExchangeHistory() {}

    public ExchangeHistory(int id, String bankCodeClient, String bankCodeCompany, float moneyTransfer) {
        this.id = id;
        this.bankCodeClient = bankCodeClient;
        this.bankCodeCompany = bankCodeCompany;
        this.moneyTransfer = moneyTransfer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBankCodeClient() {
        return bankCodeClient;
    }

    public void setBankCodeClient(String bankCodeClient) {
        this.bankCodeClient = bankCodeClient;
    }

    public String getBankCodeCompany() {
        return bankCodeCompany;
    }

    public void setBankCodeCompany(String bankCodeCompany) {
        this.bankCodeCompany = bankCodeCompany;
    }

    public float getMoneyTransfer() {
        return moneyTransfer;
    }

    public void setMoneyTransfer(float moneyTransfer) {
        this.moneyTransfer = moneyTransfer;
    }
    
    
}
