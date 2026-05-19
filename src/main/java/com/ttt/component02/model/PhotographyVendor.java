package com.ttt.component02.model;

public class PhotographyVendor extends Vendor {
    public PhotographyVendor() { super(); }
    public PhotographyVendor(String id, String name, String location, String desc, String price) { super(id, name, location, desc, price); }
    @Override public String getCategory() { return "PHOTOGRAPHY"; }
    @Override public double calculatePricing(int hours) {
        try { return Double.parseDouble(getPriceRange().replaceAll("[^0-9.]","")) * hours * 1.2; } catch (Exception e) { return 0; }
    }
}
