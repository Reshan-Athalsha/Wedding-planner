package com.ttt.component04.repository;

import com.ttt.component04.model.Guest;
import org.springframework.stereotype.Repository;
import java.io.*;
import java.util.*;

@Repository
public class GuestRepository {
    private static final String FILE_PATH = "data/guests.txt";

    private File getFile() { File f = new File(FILE_PATH); f.getParentFile().mkdirs(); return f; }

    public List<Guest> findAll() {
        List<Guest> list = new ArrayList<>();
        File f = getFile();
        if (!f.exists()) return list;
        try (BufferedReader br = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    Guest g = fromLine(line);
                    if (g != null) list.add(g);
                }
            }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    public Optional<Guest> findById(String id) {
        return findAll().stream().filter(g -> g.getGuestId().equals(id)).findFirst();
    }

    public void save(Guest guest) {
        List<Guest> all = findAll();
        boolean found = false;
        for (int i = 0; i < all.size(); i++) {
            if (all.get(i).getGuestId().equals(guest.getGuestId())) {
                all.set(i, guest);
                found = true;
                break;
            }
        }
        if (!found) all.add(guest);
        writeAll(all);
    }

    public void deleteById(String id) {
        List<Guest> all = findAll();
        all.removeIf(g -> g.getGuestId().equals(id));
        writeAll(all);
    }

    private void writeAll(List<Guest> list) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(getFile(), false))) {
            for (Guest g : list) { bw.write(g.toFileString()); bw.newLine(); }
        } catch (IOException e) { e.printStackTrace(); }
    }

    private Guest fromLine(String line) {
        try {
            String[] p = line.split("\\|", -1);
            return new Guest(p[0], p[1], p[2], p[3], Integer.parseInt(p[4]), Boolean.parseBoolean(p[5]));
        } catch (Exception e) { return null; }
    }
}
