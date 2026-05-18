package com.ttt.component06.repository;

import com.ttt.component06.model.AdminActivity;
import org.springframework.stereotype.Repository;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/** COMPONENT 06 — AdminRepository | OOP: INFORMATION HIDING */
@Repository
public class AdminRepository {
    private static final String FILE_PATH = "data/admin_logs.txt";

    private File getFile() {
        File file = new File(FILE_PATH);
        file.getParentFile().mkdirs();
        return file;
    }

    public void saveLog(AdminActivity activity) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(getFile(), true))) {
            bw.write(activity.toFileString());
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<AdminActivity> findAllLogs() {
        List<AdminActivity> logs = new ArrayList<>();
        File file = getFile();
        if (!file.exists()) return logs;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    String[] parts = line.split("\\|", -1);
                    if (parts.length >= 3) {
                        logs.add(new AdminActivity(parts[0], parts[1], parts[2]));
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return logs;
    }
}
