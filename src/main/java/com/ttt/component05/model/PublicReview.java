package com.ttt.component05.model;
/** COMPONENT 05 — PublicReview | OOP: INHERITANCE · POLYMORPHISM */
public class PublicReview extends Review {
    public PublicReview() { super(); }
    public PublicReview(String id, String vendorId, String userName, int rating, String comment, String date) { super(id, vendorId, userName, rating, comment, date); }
    @Override public boolean canEdit() { return false; }
    @Override public String getReviewType() { return "PUBLIC"; }
}
