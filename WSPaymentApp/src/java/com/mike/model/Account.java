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
public class Account {
    private int id;
    private String codeBank;
    private String fullName;
    private String address;
    private float money;

    public Account() {}
    
    public Account(int id, String codeBank, String fullName, String address, float money) {
        this.id = id;
        this.codeBank = codeBank;
        this.fullName = fullName;
        this.address = address;
        this.money = money;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodeBank() {
        return codeBank;
    }

    public void setCodeBank(String codeBank) {
        this.codeBank = codeBank;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getMoney() {
        return money;
    }

    public void setMoney(float money) {
        this.money = money;
    }
    
    
}
