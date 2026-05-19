package com.ttt.component06.repository;

import com.ttt.component06.model.*;
import org.springframework.stereotype.Repository;
import java.io.*;
import java.util.*;

@Repository
public class AdminRepository {
    private static final String FILE_PATH = "data/admins.txt";

    private File getFile() { File f = new File(FILE_PATH); f.getParentFile().mkdirs(); return f; }

    public List<Admin> findAll() {
        List<Admin> list = new ArrayList<>();
        File f = getFile();
        if (!f.exists()) return list;
        try (BufferedReader br = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    Admin a = fromLine(line);
                    if (a != null) list.add(a);
                }
            }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    public void save(Admin admin) {
        List<Admin> all = findAll();
        boolean found = false;
        for (int i = 0; i < all.size(); i++) {
            if (all.get(i).getAdminId().equals(admin.getAdminId())) {
                all.set(i, admin);
                found = true;
                break;
            }
        }
        if (!found) all.add(admin);
        writeAll(all);
    }

    public void delete(String id) {
        List<Admin> all = findAll();
        all.removeIf(a -> a.getAdminId().equals(id));
        writeAll(all);
    }

    private void writeAll(List<Admin> list) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(getFile(), false))) {
            for (Admin a : list) { bw.write(a.toFileString()); bw.newLine(); }
        } catch (IOException e) { e.printStackTrace(); }
    }

    private Admin fromLine(String line) {
        try {
            String[] p = line.split("\\|", -1);
            String role = p.length > 4 ? p[4] : "MODERATOR";
            return "SUPER_ADMIN".equalsIgnoreCase(role)
                    ? new SuperAdmin(p[0], p[1], p[2], p[3])
                    : new ModeratorAdmin(p[0], p[1], p[2], p[3]);
        } catch (Exception e) { return null; }
    }
}
