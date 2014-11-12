/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mike.model;

import org.joda.time.DateTime;

/**
 *
 * @author Nguyen
 */
public class Event {

    private int event_Id;
    private String title;
    private String logo;
    private String description;
    private String speaker;
    private String address;
    private String slogan;
    private DateTime startDate;
    private DateTime endDate;
    private boolean homeTag;
    private boolean status;
    private int cate_Id;
    private String categoryName;

    private float price;

    private String fullName;
    private String avatar;
    private String email;
    private String paymentType;

    public Event(String fullName, String avatar, String email, String paymentType) {
        this.fullName = fullName;
        this.avatar = avatar;
        this.email = email;
        this.paymentType = paymentType;
    }

    public Event(float price) {
        this.price = price;
    }

    public Event(String title, String logo, String description, String speaker, String address, String slogan, DateTime startDate, DateTime endDate, String categoryName) {
        this.title = title;
        this.logo = logo;
        this.description = description;
        this.speaker = speaker;
        this.address = address;
        this.slogan = slogan;
        this.startDate = startDate;
        this.endDate = endDate;
        this.categoryName = categoryName;
    }

    public Event(int event_Id, String title, String logo, String description, String speaker, String address, String slogan, DateTime startDate, DateTime endDate, boolean homeTag, boolean status, int cate_Id) {
        this.event_Id = event_Id;
        this.title = title;
        this.logo = logo;
        this.description = description;
        this.speaker = speaker;
        this.address = address;
        this.slogan = slogan;
        this.startDate = startDate;
        this.endDate = endDate;
        this.homeTag = homeTag;
        this.status = status;
        this.cate_Id = cate_Id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getEvent_Id() {
        return event_Id;
    }

    public void setEvent_Id(int event_Id) {
        this.event_Id = event_Id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSpeaker() {
        return speaker;
    }

    public void setSpeaker(String speaker) {
        this.speaker = speaker;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSlogan() {
        return slogan;
    }

    public void setSlogan(String slogan) {
        this.slogan = slogan;
    }

    public DateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(DateTime startDate) {
        this.startDate = startDate;
    }

    public DateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(DateTime endDate) {
        this.endDate = endDate;
    }

    public boolean isHomeTag() {
        return homeTag;
    }

    public void setHomeTag(boolean homeTag) {
        this.homeTag = homeTag;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getCate_Id() {
        return cate_Id;
    }

    public void setCate_Id(int cate_Id) {
        this.cate_Id = cate_Id;
    }

}
