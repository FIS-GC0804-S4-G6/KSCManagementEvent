package model;

public class Event_Price {
    private int price_Id;
    private int event_Id;
    private float price;
    private String description;
    
    public Event_Price(int price_Id, float price, String description) {
        this.price_Id = price_Id;
        this.price = price;
        this.description = description;
    }
    
    public int getPrice_Id() {
        return price_Id;
    }
    public void setPrice_Id(int value) {
        price_Id = value;
    }
    
    public int getEvent_Id() {
        return event_Id;
    }
    public void setEvent_Id(int value) {
        event_Id = value;
    }
    
    public float getPrice() {
        return price;
    }
    public void setPrice(float value) {
        price = value;
    }
    
    public String getDescription() {
        return description;
    }
    public void setDescription(String value) {
        description = value;
    }
}
