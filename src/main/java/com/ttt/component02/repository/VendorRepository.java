package com.ttt.component02.repository;

import com.ttt.component02.model.*;
import org.springframework.stereotype.Repository;
import java.io.*;
import java.util.*;

/** COMPONENT 02 — File-based Vendor Repository | OOP: ENCAPSULATION · POLYMORPHISM · FILE I/O */
@Repository
public class VendorRepository {
    private static final String FILE_PATH = "data/vendors.txt";

    private File getFile() { File f = new File(FILE_PATH); f.getParentFile().mkdirs(); return f; }

    public List<Vendor> findAll() {
        List<Vendor> list = new ArrayList<>();
        File f = getFile(); if (!f.exists()) return list;
        try (BufferedReader br = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = br.readLine()) != null) { if (!line.trim().isEmpty()) { Vendor v = fromLine(line); if (v != null) list.add(v); } }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    public Optional<Vendor> findById(String id) { return findAll().stream().filter(v -> v.getVendorId().equals(id)).findFirst(); }

    public List<Vendor> findByCategory(String category) {
        List<Vendor> result = new ArrayList<>();
        for (Vendor v : findAll()) { if (v.getCategory().equalsIgnoreCase(category)) result.add(v); }
        return result;
    }

    public void save(Vendor vendor) {
        List<Vendor> all = findAll(); boolean found = false;
        for (int i = 0; i < all.size(); i++) { if (all.get(i).getVendorId().equals(vendor.getVendorId())) { all.set(i, vendor); found = true; break; } }
        if (!found) all.add(vendor);
        writeAll(all);
    }

    public void deleteById(String id) { List<Vendor> all = findAll(); all.removeIf(v -> v.getVendorId().equals(id)); writeAll(all); }

    public long count() { return findAll().size(); }

    private void writeAll(List<Vendor> list) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(getFile(), false))) {
            for (Vendor v : list) { bw.write(v.toFileString()); bw.newLine(); }
        } catch (IOException e) { e.printStackTrace(); }
    }

    // Format: vendorId|businessName|location|category|priceRange|rating|description
    private Vendor fromLine(String line) {
        try {
            String[] p = line.split("\\|", -1);
            String id=p[0], name=p[1], location=p[2], category=p[3], priceRange=p[4];
            double rating = p.length > 5 && !p[5].isEmpty() ? Double.parseDouble(p[5]) : 0.0;
            String desc = p.length > 6 ? p[6].replace(";","|") : "";
            Vendor v = switch (category.toUpperCase()) {
                case "VENUE"       -> new VenueVendor(id, name, location, desc, priceRange);
                case "PHOTOGRAPHY" -> new PhotographyVendor(id, name, location, desc, priceRange);
                default            -> new CateringVendor(id, name, location, desc, priceRange);
            };
            v.setRating(rating);
            return v;
        } catch (Exception e) { return null; }
    }
}
