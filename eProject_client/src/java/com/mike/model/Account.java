package com.mike.model;

import java.sql.Date;

/**
 *
 * @author Mike
 */


public class Account {
    private int custID;
    private String email;
    private String fullname;
    private String password;
    private boolean gender;
    private Date dateOfBirth;
    private String address;
    private String mobile;
    private String home;
    private String idCard;
    private String avatar;
    private int roleID;
    private String universityName;
    private boolean active;
    
    private int sid_Id;
    private String device;
    private String sid_Device;
            
    public Account(int custID, String email, String fullname, boolean gender, Date dateOfBirth, String address, String mobile, String home, String idCard, String avatar, String universityName) {
        this.custID = custID;
        this.email = email;
        this.fullname = fullname;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.mobile = mobile;
        this.home = home;
        this.idCard = idCard;
        this.avatar = avatar;
        this.universityName = universityName;
    }

    public Account(String email, String fullname, String password, boolean gender) {
        this.email = email;
        this.fullname = fullname;
        this.password = password;
        this.gender = gender;
    }

    public Account(int custID, boolean active) {
        this.custID = custID;
        this.active = active;
    }

    public Account(int sid_Id, String device, String sid_Device) {
        this.sid_Id = sid_Id;
        this.device = device;
        this.sid_Device = sid_Device;
    }
    
    public int getCustID() {
        return custID;
    }

    public void setCustID(int custID) {
        this.custID = custID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean getGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getHome() {
        return home;
    }

    public void setHome(String home) {
        this.home = home;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getUniversityName() {
        return universityName;
    }

    public void setUniversityName(String universityName) {
        this.universityName = universityName;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public int getSid_Id() {
        return sid_Id;
    }

    public void setSid_Id(int sid_Id) {
        this.sid_Id = sid_Id;
    }

    public String getDevice() {
        return device;
    }

    public void setDevice(String device) {
        this.device = device;
    }

    public String getSid_Device() {
        return sid_Device;
    }

    public void setSid_Device(String sid_Device) {
        this.sid_Device = sid_Device;
    }
    
}
