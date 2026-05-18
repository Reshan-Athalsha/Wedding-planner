package com.ttt.component06.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

/** COMPONENT 06 — Admin Dashboard & Analytics | STANDALONE VERSION */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping
    public String adminDashboard(Model model) {
        model.addAttribute("userCount",    countLines("data/users.txt"));
        model.addAttribute("vendorCount",  countLines("data/vendors.txt"));
        model.addAttribute("bookingCount", countLines("data/bookings.txt"));
        model.addAttribute("paymentCount", countLines("data/payments.txt"));
        model.addAttribute("reviewCount",  countLines("data/reviews.txt"));
        model.addAttribute("taskCount",    countLines("data/tasks.txt"));
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
