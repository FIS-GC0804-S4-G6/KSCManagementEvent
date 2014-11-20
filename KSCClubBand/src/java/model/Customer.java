package model;

import org.joda.time.DateTime;
import java.sql.Date;

public class Customer {

    private int cust_Id;
    private String email;
    private String fullName;
    private String password;
    private boolean gender;
    private DateTime dateOfBirth;
    private Date dateOfBirth2;
    private String address;
    private String mobile;
    private String home;
    private String iDCard;
    private String avatar;
    private int role_Id;
    private String univercode;
    private boolean active;

    public Customer(int cust_Id, String device, String sid_Device) {
        this.cust_Id = cust_Id;
        this.device = device;
        this.sid_Device = sid_Device;
    }

    public Customer(int cust_Id, String email, String fullName, boolean gender, Date dateOfBirth2, String address, String mobile, String home, String iDCard, String avatar, String univercode) {
        this.cust_Id = cust_Id;
        this.email = email;
        this.fullName = fullName;
        this.gender = gender;
        this.dateOfBirth2 = dateOfBirth2;
        this.address = address;
        this.mobile = mobile;
        this.home = home;
        this.iDCard = iDCard;
        this.avatar = avatar;
        this.univercode = univercode;
    }

    private int sid_Id;
    private String device;
    private String sid_Device;

    public int getCust_Id() {
        return cust_Id;
    }

    public void setCust_Id(int val) {
        cust_Id = val;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String val) {
        email = val;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String val) {
        fullName = val;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String val) {
        password = val;
    }

    public boolean getGender() {
        return gender;
    }

    public void setGender(boolean val) {
        gender = val;
    }

    public DateTime getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(DateTime val) {
        dateOfBirth = val;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String val) {
        address = val;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String val) {
        mobile = val;
    }

    public String getHome() {
        return home;
    }

    public void setHome(String val) {
        home = val;
    }

    public String getIDCard() {
        return iDCard;
    }

    public void setIDCard(String val) {
        iDCard = val;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String val) {
        avatar = val;
    }

    public int getRole_Id() {
        return role_Id;
    }

    public void setRole_Id(int val) {
        role_Id = val;
    }

    public String getUnivercode() {
        return univercode;
    }

    public void setUnivercode(String val) {
        univercode = val;
    }

    public boolean getActive() {
        return active;
    }

    public void setActive(boolean val) {
        active = val;
    }

    public Customer(String email) {
        this.email = email;
    }

    public Customer(String email, String fullName) {
        this.email = email;
        this.fullName = fullName;
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

    public Date getDateOfBirth2() {
        return dateOfBirth2;
    }

    public void setDateOfBirth2(Date dateOfBirth2) {
        this.dateOfBirth2 = dateOfBirth2;
    }

}
