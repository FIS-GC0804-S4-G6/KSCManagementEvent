package model;

public class Payment_Option {
    private int payment_Id;
    private String payment_Type;
    
    public int getPayment_Id() {
        return payment_Id;
    }
    public void setPayment_Id(int val) {
        payment_Id = val;
    }
    
    public String getPayment_Type() {
        return payment_Type;
    }
    public void setPayment_Type(String val) {
        payment_Type = val;
    }
    
    public Payment_Option(String payment_Type) {
        this.payment_Type = payment_Type;
    }
}
