package com.ttt.component03.repository;

import com.ttt.component03.model.Booking;
import org.springframework.stereotype.Repository;
import java.io.*;
import java.util.*;


@Repository
public class BookingRepository {
    private static final String FILE_PATH = "data/bookings.txt";

    private File getFile() { File f = new File(FILE_PATH); f.getParentFile().mkdirs(); return f; }

    public List<Booking> findAll() {
        List<Booking> list = new ArrayList<>();
        File f = getFile(); if (!f.exists()) return list;
        try (BufferedReader br = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = br.readLine()) != null) { if (!line.trim().isEmpty()) { Booking b = fromLine(line); if (b != null) list.add(b); } }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    public Optional<Booking> findById(String id) { return findAll().stream().filter(b -> b.getBookingId().equals(id)).findFirst(); }

    public void save(Booking booking) {
        List<Booking> all = findAll(); boolean found = false;
        for (int i = 0; i < all.size(); i++) { if (all.get(i).getBookingId().equals(booking.getBookingId())) { all.set(i, booking); found = true; break; } }
        if (!found) all.add(booking);
        writeAll(all);
    }

    public void deleteById(String id) { List<Booking> all = findAll(); all.removeIf(b -> b.getBookingId().equals(id)); writeAll(all); }

    public long count() { return findAll().size(); }

    private void writeAll(List<Booking> list) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(getFile(), false))) {
            for (Booking b : list) { bw.write(b.toFileString()); bw.newLine(); }
        } catch (IOException e) { e.printStackTrace(); }
    }

    private Booking fromLine(String line) {
        try { String[] p = line.split("\\|", -1); return new Booking(p[0],p[1],p[2],p[3],p[4],p[5]); } catch (Exception e) { return null; }
    }
}
