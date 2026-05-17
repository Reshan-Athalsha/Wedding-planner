package com.ttt.component01.repository;

import com.ttt.component01.model.CoupleUser;
import org.springframework.stereotype.Repository;
import java.io.*;
import java.util.*;

/** COMPONENT 01 — File-based CoupleUser Repository | OOP: ENCAPSULATION · INFORMATION HIDING · FILE I/O */
@Repository
public class CoupleUserRepository {
    private static final String FILE_PATH = "data/users.txt";

    private File getFile() { File f = new File(FILE_PATH); f.getParentFile().mkdirs(); return f; }

    public List<CoupleUser> findAll() {
        List<CoupleUser> list = new ArrayList<>();
        File f = getFile(); if (!f.exists()) return list;
        try (BufferedReader br = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = br.readLine()) != null) { if (!line.trim().isEmpty()) { CoupleUser u = fromLine(line); if (u != null) list.add(u); } }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    public Optional<CoupleUser> findById(String userId) {
        return findAll().stream().filter(u -> u.getUserId().equals(userId)).findFirst();
    }

    public CoupleUser findByEmail(String email) {
        return findAll().stream().filter(u -> u.getEmail().equals(email)).findFirst().orElse(null);
    }

    public void save(CoupleUser user) {
        List<CoupleUser> all = findAll(); boolean found = false;
        for (int i = 0; i < all.size(); i++) { if (all.get(i).getUserId().equals(user.getUserId())) { all.set(i, user); found = true; break; } }
        if (!found) all.add(user);
        writeAll(all);
    }

    public void deleteById(String userId) { List<CoupleUser> all = findAll(); all.removeIf(u -> u.getUserId().equals(userId)); writeAll(all); }

    public long count() { return findAll().size(); }

    private void writeAll(List<CoupleUser> list) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(getFile(), false))) {
            for (CoupleUser u : list) { bw.write(u.toFileString()); bw.newLine(); }
        } catch (IOException e) { e.printStackTrace(); }
    }

    private CoupleUser fromLine(String line) {
        try {
            String[] p = line.split("\\|", -1);
            CoupleUser u = new CoupleUser(p[0], p[1], p[2], p[3]);
            if (p.length > 5 && !p[5].isEmpty()) u.setWeddingDate(p[5]);
            if (p.length > 6 && !p[6].isEmpty()) u.setBudget(Double.parseDouble(p[6]));
            if (p.length > 7 && !p[7].isEmpty()) u.setGuestCount(Integer.parseInt(p[7]));
            if (p.length > 8 && !p[8].isEmpty()) u.setTheme(p[8]);
            return u;
        } catch (Exception e) { return null; }
    }
}
