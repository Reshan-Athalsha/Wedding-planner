package com.ttt.component06.controller;

import com.ttt.component06.model.AdminActivity;
import com.ttt.component06.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;
import java.util.stream.Stream;

/** COMPONENT 06 — Admin Dashboard & Analytics Controller */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminRepository adminRepository;

    @GetMapping
    public String adminDashboard(Model model) {
        // 1. Log this admin action using Component 6 Repository
        String logId = "LOG-" + UUID.randomUUID().toString().substring(0, 5).toUpperCase();
        String now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        adminRepository.saveLog(new AdminActivity(logId, "Viewed Admin Dashboard", now));

        // 2. Read system stats
        model.addAttribute("userCount",    countLines("data/users.txt"));
        model.addAttribute("vendorCount",  countLines("data/vendors.txt"));
        model.addAttribute("bookingCount", countLines("data/bookings.txt"));
        model.addAttribute("paymentCount", countLines("data/payments.txt"));
        model.addAttribute("reviewCount",  countLines("data/reviews.txt"));
        model.addAttribute("taskCount",    countLines("data/tasks.txt"));
        
        // 3. Pass logs to view if needed
        model.addAttribute("adminLogs", adminRepository.findAllLogs());

        return "component06/adminDashboard";
    }

    @GetMapping("/oop")
    public String oopOverview() {
        return "component06/oop";
    }

    private long countLines(String filePath) {
        Path path = Paths.get(filePath);
        if (!Files.exists(path)) return 0;
        try (Stream<String> lines = Files.lines(path)) {
            return lines.filter(l -> !l.trim().isEmpty()).count();
        } catch (Exception e) {
            return 0;
        }
    }
}
