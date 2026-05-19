package com.ttt.component02.model;

import com.ttt.shared.FileOperations;


public abstract class Vendor implements FileOperations {
    private String vendorId;
    private String businessName;
    private String location;
    private String description;
    private String priceRange;
    private double rating;

    public Vendor() {}
    public Vendor(String vendorId, String businessName, String location, String description, String priceRange) {
        this.vendorId = vendorId; this.businessName = businessName; this.location = location;
        this.description = description; this.priceRange = priceRange; this.rating = 0.0;
    }

    public abstract double calculatePricing(int units);
    public abstract String getCategory();

    @Override
    public String toFileString() {
        return vendorId+"|"+businessName+"|"+location+"|"+getCategory()+"|"+priceRange+"|"+rating
                +"|"+(description!=null?description.replace("|",";"): "");
    }

    public String getVendorId()      { return vendorId; }    public void setVendorId(String v)      { this.vendorId = v; }
    public String getBusinessName()  { return businessName; } public void setBusinessName(String v)  { this.businessName = v; }
    public String getLocation()      { return location; }    public void setLocation(String v)      { this.location = v; }
    public String getDescription()   { return description; } public void setDescription(String v)   { this.description = v; }
    public String getPriceRange()    { return priceRange; }  public void setPriceRange(String v)    { this.priceRange = v; }
    public double getRating()        { return rating; }      public void setRating(double v)        { this.rating = v; }
}
