package com.ttt.component05.repository;

import com.ttt.component05.model.*;
import org.springframework.stereotype.Repository;
import java.io.*;
import java.util.*;
import java.util.stream.Collectors;

@Repository
public class ReviewRepository {
    private static final String FILE_PATH = "data/reviews.txt";

    private File getFile() { File f = new File(FILE_PATH); f.getParentFile().mkdirs(); return f; }

    public List<Review> findAll() {
        List<Review> list = new ArrayList<>();
        File f = getFile();
        if (!f.exists()) return list;
        try (BufferedReader br = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    Review r = fromLine(line);
                    if (r != null) list.add(r);
                }
            }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    public List<Review> findByOrderByRatingDesc() {
        return findAll().stream()
                .sorted(Comparator.comparingInt(Review::getRating).reversed())
                .collect(Collectors.toList());
    }

    public Optional<Review> findById(String id) {
        return findAll().stream().filter(r -> r.getReviewId().equals(id)).findFirst();
    }

    public void save(Review review) {
        List<Review> all = findAll();
        boolean found = false;
        for (int i = 0; i < all.size(); i++) {
            if (all.get(i).getReviewId().equals(review.getReviewId())) {
                all.set(i, review);
                found = true;
                break;
            }
        }
        if (!found) all.add(review);
        writeAll(all);
    }

    public void deleteById(String id) {
        List<Review> all = findAll();
        all.removeIf(r -> r.getReviewId().equals(id));
        writeAll(all);
    }

    private void writeAll(List<Review> list) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(getFile(), false))) {
            for (Review r : list) { bw.write(r.toFileString()); bw.newLine(); }
        } catch (IOException e) { e.printStackTrace(); }
    }

    private Review fromLine(String line) {
        try {
            String[] p = line.split("\\|", -1);
            String type = p.length > 6 ? p[6] : "PUBLIC";
            String comment = p[4].replace(";", "|");
            return "VERIFIED".equalsIgnoreCase(type)
                    ? new VerifiedReview(p[0], p[1], p[2], Integer.parseInt(p[3]), comment, p[5])
                    : new PublicReview(p[0], p[1], p[2], Integer.parseInt(p[3]), comment, p[5]);
        } catch (Exception e) { return null; }
    }
}
