package com.ttt.component03.model;

import com.ttt.shared.FileOperations;

/** COMPONENT 03 — Payment | OOP: ENCAPSULATION · COMPOSITION · INTERFACE */
public class Payment implements FileOperations {
    private String paymentId, bookingId, paymentMethod, status, paymentDate;
    private double amount;

    public Payment() {}
    public Payment(String paymentId, String bookingId, double amount, String paymentMethod, String status, String paymentDate) {
        this.paymentId=paymentId; this.bookingId=bookingId; this.amount=amount;
        this.paymentMethod=paymentMethod; this.status=status; this.paymentDate=paymentDate;
    }

    @Override public String toFileString() { return paymentId+"|"+bookingId+"|"+amount+"|"+paymentMethod+"|"+status+"|"+paymentDate; }

    public String getPaymentId()     { return paymentId; }     public void setPaymentId(String v)     { this.paymentId=v; }
    public String getBookingId()     { return bookingId; }     public void setBookingId(String v)     { this.bookingId=v; }
    public double getAmount()        { return amount; }        public void setAmount(double v)        { this.amount=v; }
    public String getPaymentMethod() { return paymentMethod; } public void setPaymentMethod(String v) { this.paymentMethod=v; }
    public String getStatus()        { return status; }        public void setStatus(String v)        { this.status=v; }
    public String getPaymentDate()   { return paymentDate; }   public void setPaymentDate(String v)   { this.paymentDate=v; }
}
