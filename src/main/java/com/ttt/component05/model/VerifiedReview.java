package com.ttt.component05.model;
/** COMPONENT 05 — VerifiedReview | OOP: INHERITANCE · POLYMORPHISM */
public class VerifiedReview extends Review {
    public VerifiedReview() { super(); }
    public VerifiedReview(String id, String vendorId, String userName, int rating, String comment, String date) { super(id, vendorId, userName, rating, comment, date); }
    @Override public boolean canEdit() { return true; }
    @Override public String getReviewType() { return "VERIFIED"; }
}
