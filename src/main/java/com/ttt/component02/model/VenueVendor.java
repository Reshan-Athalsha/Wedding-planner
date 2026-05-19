package com.ttt.component02.model;

public class VenueVendor extends Vendor {
    public VenueVendor() { super(); }
    public VenueVendor(String id, String name, String location, String desc, String price) { super(id, name, location, desc, price); }
    @Override public String getCategory() { return "VENUE"; }
    @Override public double calculatePricing(int hours) {
        try { return Double.parseDouble(getPriceRange().replaceAll("[^0-9.]","")) * hours * 0.8; } catch (Exception e) { return 0; }
    }
}
