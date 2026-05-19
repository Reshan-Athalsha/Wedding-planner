package com.ttt.component04.repository;

import com.ttt.component04.model.BudgetItem;
import org.springframework.stereotype.Repository;
import java.io.*;
import java.util.*;

@Repository
public class BudgetItemRepository {
    private static final String FILE_PATH = "data/budget.txt";

    private File getFile() { File f = new File(FILE_PATH); f.getParentFile().mkdirs(); return f; }

    public List<BudgetItem> findAll() {
        List<BudgetItem> list = new ArrayList<>();
        File f = getFile();
        if (!f.exists()) return list;
        try (BufferedReader br = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    BudgetItem item = fromLine(line);
                    if (item != null) list.add(item);
                }
            }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    public Optional<BudgetItem> findById(String id) {
        return findAll().stream().filter(b -> b.getItemId().equals(id)).findFirst();
    }

    public void save(BudgetItem item) {
        List<BudgetItem> all = findAll();
        boolean found = false;
        for (int i = 0; i < all.size(); i++) {
            if (all.get(i).getItemId().equals(item.getItemId())) {
                all.set(i, item);
                found = true;
                break;
            }
        }
        if (!found) all.add(item);
        writeAll(all);
    }

    public void deleteById(String id) {
        List<BudgetItem> all = findAll();
        all.removeIf(b -> b.getItemId().equals(id));
        writeAll(all);
    }

    private void writeAll(List<BudgetItem> list) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(getFile(), false))) {
            for (BudgetItem b : list) { bw.write(b.toFileString()); bw.newLine(); }
        } catch (IOException e) { e.printStackTrace(); }
    }

    private BudgetItem fromLine(String line) {
        try {
            String[] p = line.split("\\|", -1);
            return new BudgetItem(p[0], p[1], p[2], Double.parseDouble(p[3]), Double.parseDouble(p[4]));
        } catch (Exception e) { return null; }
    }
}
