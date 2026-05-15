package com.wedding.weddingplanner.model;

import com.wedding.weddingplanner.interfaces.FileOperations;

/**
 * ============================================================
 * OOP PRINCIPLES DEMONSTRATED:
 * 1. ENCAPSULATION: Private fields with public getters/setters.
 * 2. COMPOSITION: Payment "has-a" Booking via bookingId field.
 *    This proves a strict ownership relationship.
 * 3. INTERFACE IMPLEMENTATION: Implements FileOperations contract.
 * ============================================================
 */
public class Payment implements FileOperations {

    private String paymentId;
    private String bookingId;
    private double amount;
    private String paymentMethod;
    private String status;
    private String paymentDate;

    public Payment() {}

    public Payment(String paymentId, String bookingId, double amount,
                   String paymentMethod, String status, String paymentDate) {
        this.paymentId     = paymentId;
        this.bookingId     = bookingId;
        this.amount        = amount;
        this.paymentMethod = paymentMethod;
        this.status        = status;
        this.paymentDate   = paymentDate;
    }

    @Override
    public String toFileString() {
        return paymentId + "|" + bookingId + "|" + amount + "|" +
                paymentMethod + "|" + status + "|" + paymentDate;
    }

    public static Payment fromFileString(String line) {
        String[] parts = line.split("\\|");
        if (parts.length >= 6) {
            return new Payment(parts[0], parts[1],
                    Double.parseDouble(parts[2]),
                    parts[3], parts[4], parts[5]);
        }
        return null;
    }

    public String getPaymentId()     { return paymentId; }
    public void setPaymentId(String paymentId) { this.paymentId = paymentId; }
    public String getBookingId()     { return bookingId; }
    public void setBookingId(String bookingId) { this.bookingId = bookingId; }
    public double getAmount()        { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
    public String getStatus()        { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getPaymentDate()   { return paymentDate; }
    public void setPaymentDate(String paymentDate) { this.paymentDate = paymentDate; }
}