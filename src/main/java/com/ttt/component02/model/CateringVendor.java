package com.ttt.component02.model;
/** COMPONENT 02 — CateringVendor | OOP: INHERITANCE · POLYMORPHISM */
public class CateringVendor extends Vendor {
    public CateringVendor() { super(); }
    public CateringVendor(String id, String name, String location, String desc, String price) { super(id, name, location, desc, price); }
    @Override public String getCategory() { return "CATERING"; }
    @Override public double calculatePricing(int guests) {
        try { return Double.parseDouble(getPriceRange().replaceAll("[^0-9.]","")) * guests; } catch (Exception e) { return 0; }
    }
}
