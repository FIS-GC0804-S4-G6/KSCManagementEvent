package model;

public class Cust_Event {
    private Customer customer;
    private Event_Price event_Price;
    private Payment_Option payment_Option;
    private Event event;
    private String ticketCode;
    private float realPrice;
    
    public Customer getCustomer() {
        return customer;
    }
    public void setCustomer(Customer val) {
        customer = val;
    }
    
    public Event_Price getEvent_Price() {
        return event_Price;
    }
    public void setEvent_Price(Event_Price val) {
        event_Price = val;
    }
    
    public Payment_Option getPayment_Option() {
        return payment_Option;
    }
    public void setPayment_Option(Payment_Option val) {
        payment_Option = val;
    }
    
    public Event getEvent() {
        return event;
    }
    public void setEvent(Event val) {
        event = val;
    }
    
    public String getTicketCode() {
        return ticketCode;
    }
    public void setTicketCode(String val) {
        ticketCode = val;
    }
    
    public float getRealPrice() {
        return realPrice;
    }
    public void setRealPrice(float val) {
        realPrice = val;
    }
    
    public Cust_Event(String ticketCode, float realPrice, int price_Id, String payment_Type, int payment_Id, String email, String fullName, float lastestPrice) {
        this.ticketCode = ticketCode;
        this.realPrice = realPrice;
        this.event_Price = new Event_Price(price_Id, lastestPrice);
        this.payment_Option = new Payment_Option(payment_Id, payment_Type);
        this.customer = new Customer(email, fullName);
    }
    
    @Override
    public String toString() {
        return "Cust_Event {ticketCode: " + ticketCode + "\nrealPrice: " + realPrice +"}";
    }
}
