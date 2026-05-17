package com.ttt.component03.model;

import com.ttt.shared.FileOperations;

/** COMPONENT 03 — Booking | OOP: ENCAPSULATION · INTERFACE */
public class Booking implements FileOperations {
    private String bookingId, clientName, vendorName, eventDate, status, createdDate;

    public Booking() {}
    public Booking(String bookingId, String clientName, String vendorName, String eventDate, String status, String createdDate) {
        this.bookingId=bookingId; this.clientName=clientName; this.vendorName=vendorName;
        this.eventDate=eventDate; this.status=status; this.createdDate=createdDate;
    }

    @Override public String toFileString() { return bookingId+"|"+clientName+"|"+vendorName+"|"+eventDate+"|"+status+"|"+createdDate; }

    public String getBookingId()   { return bookingId; }   public void setBookingId(String v)   { this.bookingId=v; }
    public String getClientName()  { return clientName; }  public void setClientName(String v)  { this.clientName=v; }
    public String getVendorName()  { return vendorName; }  public void setVendorName(String v)  { this.vendorName=v; }
    public String getEventDate()   { return eventDate; }   public void setEventDate(String v)   { this.eventDate=v; }
    public String getStatus()      { return status; }      public void setStatus(String v)      { this.status=v; }
    public String getCreatedDate() { return createdDate; } public void setCreatedDate(String v) { this.createdDate=v; }
}
