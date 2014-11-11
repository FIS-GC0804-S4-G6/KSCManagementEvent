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
public class Category {
    private int cate_Id;
    private String categoryName;

    public int getCate_Id() {
        return cate_Id;
    }

    public void setCate_Id(int cate_Id) {
        this.cate_Id = cate_Id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Category(int cate_Id, String categoryName) {
        this.cate_Id = cate_Id;
        this.categoryName = categoryName;
    }
    
}
