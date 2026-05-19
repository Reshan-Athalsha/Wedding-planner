package com.ttt.component06.repository;

import com.ttt.component06.model.Announcement;
import org.springframework.stereotype.Repository;
import java.io.*;
import java.util.*;

@Repository
public class AnnouncementRepository {
    private static final String FILE_PATH = "data/announcements.txt";

    private File getFile() { File f = new File(FILE_PATH); f.getParentFile().mkdirs(); return f; }

    public List<Announcement> findAll() {
        List<Announcement> list = new ArrayList<>();
        File f = getFile();
        if (!f.exists()) return list;
        try (BufferedReader br = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    Announcement a = fromLine(line);
                    if (a != null) list.add(a);
                }
            }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    public void save(Announcement announcement) {
        List<Announcement> all = findAll();
        boolean found = false;
        for (int i = 0; i < all.size(); i++) {
            if (all.get(i).getId().equals(announcement.getId())) {
                all.set(i, announcement);
                found = true;
                break;
            }
        }
        if (!found) all.add(announcement);
        writeAll(all);
    }

    public void delete(String id) {
        List<Announcement> all = findAll();
        all.removeIf(a -> a.getId().equals(id));
        writeAll(all);
    }

    private void writeAll(List<Announcement> list) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(getFile(), false))) {
            for (Announcement a : list) { bw.write(a.toFileString()); bw.newLine(); }
        } catch (IOException e) { e.printStackTrace(); }
    }

    private Announcement fromLine(String line) {
        try {
            String[] p = line.split("\\|", -1);
            return new Announcement(p[0], p[1], p[2], p[3]);
        } catch (Exception e) { return null; }
    }
}
