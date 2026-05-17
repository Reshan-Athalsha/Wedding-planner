package com.ttt.component03.repository;

import com.ttt.component03.model.Payment;
import org.springframework.stereotype.Repository;
import java.io.*;
import java.util.*;

/** COMPONENT 03 — File-based Payment Repository | OOP: ENCAPSULATION · FILE I/O */
@Repository
public class PaymentRepository {
    private static final String FILE_PATH = "data/payments.txt";

    private File getFile() { File f = new File(FILE_PATH); f.getParentFile().mkdirs(); return f; }

    public List<Payment> findAll() {
        List<Payment> list = new ArrayList<>();
        File f = getFile(); if (!f.exists()) return list;
        try (BufferedReader br = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = br.readLine()) != null) { if (!line.trim().isEmpty()) { Payment p = fromLine(line); if (p != null) list.add(p); } }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    public Optional<Payment> findById(String id) { return findAll().stream().filter(p -> p.getPaymentId().equals(id)).findFirst(); }

    public void save(Payment payment) {
        List<Payment> all = findAll(); boolean found = false;
        for (int i = 0; i < all.size(); i++) { if (all.get(i).getPaymentId().equals(payment.getPaymentId())) { all.set(i, payment); found = true; break; } }
        if (!found) all.add(payment);
        writeAll(all);
    }

    public void deleteById(String id) { List<Payment> all = findAll(); all.removeIf(p -> p.getPaymentId().equals(id)); writeAll(all); }

    public long count() { return findAll().size(); }

    private void writeAll(List<Payment> list) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(getFile(), false))) {
            for (Payment p : list) { bw.write(p.toFileString()); bw.newLine(); }
        } catch (IOException e) { e.printStackTrace(); }
    }

    private Payment fromLine(String line) {
        try { String[] p = line.split("\\|", -1); return new Payment(p[0],p[1],Double.parseDouble(p[2]),p[3],p[4],p[5]); } catch (Exception e) { return null; }
    }
}
