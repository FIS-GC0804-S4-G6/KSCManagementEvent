package model;

public class Category {
    private int cate_Id;
    private String categoryName;
    
    public Category(int cate_Id, String categoryName) {
        this.cate_Id = cate_Id;
        this.categoryName = categoryName;
    }
    
    public int getCate_Id() {
        return cate_Id;
    }
    public void setCate_Id(int value) {
        this.cate_Id = value;
    }
    
    public String getCategoryName() {
        return categoryName;
    }
    public void setCategoryName(String value) {
        this.categoryName = value;
    }
}
