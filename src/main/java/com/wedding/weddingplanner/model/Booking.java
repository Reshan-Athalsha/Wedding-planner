package com.wedding.weddingplanner.model;

import com.wedding.weddingplanner.interfaces.FileOperations;

/**
 * ============================================================
 * OOP PRINCIPLES DEMONSTRATED:
 * 1. ENCAPSULATION: All fields are private. Access controlled
 *    via public getters and setters only.
 * 2. INTERFACE IMPLEMENTATION: Implements FileOperations
 *    contract — toFileString() serializes object for file storage.
 * 3. ABSTRACTION: toFileString() hides internal formatting logic.
 * ============================================================
 */
public class Booking implements FileOperations {

    private String bookingId;
    private String clientName;
    private String vendorName;
    private String eventDate;
    private String status;
    private String createdDate;

    public Booking() {}

    public Booking(String bookingId, String clientName, String vendorName,
                   String eventDate, String status, String createdDate) {
        this.bookingId   = bookingId;
        this.clientName  = clientName;
        this.vendorName  = vendorName;
        this.eventDate   = eventDate;
        this.status      = status;
        this.createdDate = createdDate;
    }

    @Override
    public String toFileString() {
        return bookingId + "|" + clientName + "|" + vendorName + "|" +
                eventDate + "|" + status + "|" + createdDate;
    }

    public static Booking fromFileString(String line) {
        String[] parts = line.split("\\|");
        if (parts.length >= 6) {
            return new Booking(parts[0], parts[1], parts[2],
                    parts[3], parts[4], parts[5]);
        }
        return null;
    }

    public String getBookingId()   { return bookingId; }
    public void setBookingId(String bookingId) { this.bookingId = bookingId; }
    public String getClientName()  { return clientName; }
    public void setClientName(String clientName) { this.clientName = clientName; }
    public String getVendorName()  { return vendorName; }
    public void setVendorName(String vendorName) { this.vendorName = vendorName; }
    public String getEventDate()   { return eventDate; }
    public void setEventDate(String eventDate) { this.eventDate = eventDate; }
    public String getStatus()      { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getCreatedDate() { return createdDate; }
    public void setCreatedDate(String createdDate) { this.createdDate = createdDate; }
}