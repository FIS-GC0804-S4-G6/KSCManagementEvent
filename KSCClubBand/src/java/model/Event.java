package model;

import org.joda.time.DateTime;

public class Event {

    private int event_Id = -1;
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
    private Category category;
    private int amountPaticipants;
    private float sumPrice;
    private String type;
    private String timeStatus;
    
    public Event(){}
    
    public Event(int event_Id, String title, String logo, String description,
            String speaker, String address, String slogan, DateTime startDate,
            DateTime endDate, String categoryName, int cate_Id, boolean status) {
        this.event_Id = event_Id;
        this.title = title;
        this.logo = logo;
        this.description = description;
        this.speaker = speaker;
        this.address = address;
        this.slogan = slogan;
        this.startDate = startDate;
        this.endDate = endDate;
        this.category = new Category(cate_Id, categoryName);
        this.status = status;
    }
    
    public Event(String title, String logo, String description, String speaker, String address, String slogan, DateTime startDate, DateTime endDate, int cate_Id) {
        this.title = title;
        this.logo = logo;
        this.description = description;
        this.speaker = speaker;
        this.address = address;
        this.slogan = slogan;
        this.startDate = startDate;
        this.endDate = endDate;
        this.category = new Category(cate_Id);
    }
    
    public Event(int event_Id, String title, String address, DateTime startDate, DateTime endDate, int cate_Id) {
        this.event_Id = event_Id;
        this.title = title;
        this.address = address;
        this.startDate = startDate;
        this.endDate = endDate;
        this.category = new Category(cate_Id);
    }
    
    public Event(int event_Id, String title, String address, DateTime startDate,
            DateTime endDate, int cate_Id, String categoryName, int amountPaticipants,
            float sumPrice, boolean status, String timeStatus) {
        this.event_Id = event_Id;
        this.title = title;
        this.address = address;
        this.startDate = startDate;
        this.endDate = endDate;
        this.category = new Category(cate_Id, categoryName);
        this.amountPaticipants = amountPaticipants;
        this.sumPrice = sumPrice;
        this.status = status;
        this.timeStatus = timeStatus;
    }
    
    public Event(int event_Id, String title, String address, DateTime startDate, DateTime endDate, int cate_Id, String categoryName, String type) {
        this.event_Id = event_Id;
        this.title = title;
        this.address = address;
        this.startDate = startDate;
        this.endDate = endDate;
        this.category = new Category(cate_Id, categoryName);
        this.type = type;
    }
    
    public Event(String title, DateTime startDate, DateTime endDate, String address) {
        this.title = title;
        this.startDate = startDate;
        this.endDate = endDate;
        this.address = address;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category val) {
        category = val;
    }

    public int getEvent_Id() {
        return event_Id;
    }

    public void setEvent_Id(int value) {
        this.event_Id = value;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String value) {
        this.title = value;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String value) {
        this.logo = value;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String value) {
        this.description = value;
    }

    public String getSpeaker() {
        return speaker;
    }

    public void setSpeaker(String value) {
        this.speaker = value;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String value) {
        this.address = value;
    }

    public String getSlogan() {
        return slogan;
    }

    public void setSlogan(String value) {
        this.slogan = value;
    }

    public org.joda.time.DateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(org.joda.time.DateTime value) {
        this.startDate = value;
    }

    public org.joda.time.DateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(org.joda.time.DateTime value) {
        this.endDate = value;
    }

    public boolean getHomeTag() {
        return homeTag;
    }

    public void setHomeTag(boolean value) {
        this.homeTag = value;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean value) {
        this.status = value;
    }
    
    public int getAmountPaticipants() {
        return amountPaticipants;
    }
    public void setAmountPaticipants(int value) {
        this.amountPaticipants = value;
    }
    
    public float getSumPrice() {
        return sumPrice;
    }
    public void setSumPrice(float value) {
        this.sumPrice = value;
    }
    
    public String getType() {
        return type;
    }
    public void setType(String val) {
        type = val;
    }
    
    public String getTimeStatus() {
        return timeStatus;
    }
    public void setTimeStatus(String val) {
        timeStatus = val;
    }
    
    @Override
    public String toString() {
        return "event: " + title + "{logo: " + logo + "\ndescription: " + description + "\nspeaker: " + speaker + "\naddress: " + address
                + "\nslogan: " + slogan + "\nstartDate: " + startDate.getYear() + "-" + startDate.getMonthOfYear() + "-" + startDate.getDayOfMonth() + " " + startDate.getHourOfDay() + "::" + startDate.getMinuteOfHour()
                + "\nendDate: " + endDate.getYear() + "-" + endDate.getMonthOfYear() + "-" + endDate.getDayOfMonth() + " " + endDate.getHourOfDay() + "::" + endDate.getMinuteOfHour()
                + "\ncate_Id" + category.getCate_Id() + "\ncategoryName: " + category.getCategoryName() + "\nType: " + type + "}";
    }
}
