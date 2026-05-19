package com.ttt.component04.repository;

import com.ttt.component04.model.Task;
import org.springframework.stereotype.Repository;
import java.io.*;
import java.util.*;

@Repository
public class TaskRepository {
    private static final String FILE_PATH = "data/tasks.txt";

    private File getFile() { File f = new File(FILE_PATH); f.getParentFile().mkdirs(); return f; }

    public List<Task> findAll() {
        List<Task> list = new ArrayList<>();
        File f = getFile();
        if (!f.exists()) return list;
        try (BufferedReader br = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    Task t = fromLine(line);
                    if (t != null) list.add(t);
                }
            }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    public Optional<Task> findById(String id) {
        return findAll().stream().filter(t -> t.getTaskId().equals(id)).findFirst();
    }

    public void save(Task task) {
        List<Task> all = findAll();
        boolean found = false;
        for (int i = 0; i < all.size(); i++) {
            if (all.get(i).getTaskId().equals(task.getTaskId())) {
                all.set(i, task);
                found = true;
                break;
            }
        }
        if (!found) all.add(task);
        writeAll(all);
    }

    public void deleteById(String id) {
        List<Task> all = findAll();
        all.removeIf(t -> t.getTaskId().equals(id));
        writeAll(all);
    }

    private void writeAll(List<Task> list) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(getFile(), false))) {
            for (Task t : list) { bw.write(t.toFileString()); bw.newLine(); }
        } catch (IOException e) { e.printStackTrace(); }
    }

    private Task fromLine(String line) {
        try {
            String[] p = line.split("\\|", -1);
            Task t = new Task(p[0], p[1], p[2], p[3], p.length > 5 ? p[5] : "");
            t.setCompleted(Boolean.parseBoolean(p[4]));
            return t;
        } catch (Exception e) { return null; }
    }
}
