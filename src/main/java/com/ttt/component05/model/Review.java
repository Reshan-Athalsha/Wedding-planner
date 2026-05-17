package com.ttt.component05.model;
import com.ttt.shared.FileOperations;
/** COMPONENT 05 — Review (abstract) | OOP: ABSTRACTION · INHERITANCE */
public abstract class Review implements FileOperations {
    private String reviewId, vendorId, userName, comment, reviewDate, status;
    private int rating;
    public Review() {}
    public Review(String reviewId, String vendorId, String userName, int rating, String comment, String reviewDate) {
        this.reviewId=reviewId; this.vendorId=vendorId; this.userName=userName;
        this.rating=rating; this.comment=comment; this.reviewDate=reviewDate; this.status="PUBLISHED";
    }
    public abstract boolean canEdit();        // ABSTRACTION
    public abstract String getReviewType();   // POLYMORPHISM
    @Override public String toFileString() { return reviewId+"|"+vendorId+"|"+userName+"|"+rating+"|"+comment.replace("|",";")+"|"+reviewDate+"|"+getReviewType(); }
    public String getReviewId()   { return reviewId; }    public void setReviewId(String v)   { this.reviewId=v; }
    public String getVendorId()   { return vendorId; }    public void setVendorId(String v)   { this.vendorId=v; }
    public String getUserName()   { return userName; }    public void setUserName(String v)   { this.userName=v; }
    public int getRating()        { return rating; }      public void setRating(int v)        { this.rating=v; }
    public String getComment()    { return comment; }     public void setComment(String v)    { this.comment=v; }
    public String getReviewDate() { return reviewDate; }  public void setReviewDate(String v) { this.reviewDate=v; }
    public String getStatus()     { return status; }      public void setStatus(String v)     { this.status=v; }
}
