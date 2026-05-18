package com.ttt.component06.controller;

import com.ttt.component06.model.*;
import com.ttt.component06.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.nio.file.*;
import java.time.LocalDate;
import java.util.UUID;
import java.util.stream.Stream;

/** COMPONENT 06 — Admin Dashboard & Analytics Controller | DECOUPLED ARCHITECTURE */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired private AdminRepository adminRepository;
    @Autowired private AnnouncementRepository announcementRepository;

    @GetMapping
    public String adminDashboard(Model model) {
        // Read file line counts directly to decouple Component 6 from Components 1-5
        model.addAttribute("userCount",    countLines("data/users.txt"));
        model.addAttribute("vendorCount",  countLines("data/vendors.txt"));
        model.addAttribute("bookingCount", countLines("data/bookings.txt"));
        model.addAttribute("paymentCount", countLines("data/payments.txt"));
        model.addAttribute("reviewCount",  countLines("data/reviews.txt"));
        model.addAttribute("taskCount",    countLines("data/tasks.txt"));
        
        // Pass announcements
        model.addAttribute("announcements", announcementRepository.findAll());
        return "component06/adminDashboard";
    }

    // --- ADMIN CRUD ---
    @GetMapping("/admins")
    public String listAdmins(Model model) {
        model.addAttribute("admins", adminRepository.findAll());
        return "component06/admins";
    }

    @PostMapping("/admins/new")
    public String createAdmin(@RequestParam String username, @RequestParam String email, 
                              @RequestParam String password, @RequestParam String role) {
        String id = "ADM-" + UUID.randomUUID().toString().substring(0,5).toUpperCase();
        Admin admin = "SUPER_ADMIN".equals(role) ? new SuperAdmin(id, username, password, email) 
                                                 : new ModeratorAdmin(id, username, password, email);
        adminRepository.save(admin);
        return "redirect:/admin/admins";
    }

    @GetMapping("/admins/delete/{id}")
    public String deleteAdmin(@PathVariable String id) {
        adminRepository.delete(id); return "redirect:/admin/admins";
    }

    // --- ANNOUNCEMENT CRUD ---
    @PostMapping("/announcements/new")
    public String createAnnouncement(@RequestParam String title, @RequestParam String content) {
        String id = "ANN-" + UUID.randomUUID().toString().substring(0,5).toUpperCase();
        announcementRepository.save(new Announcement(id, title, content, LocalDate.now().toString()));
        return "redirect:/admin";
    }
    
    @GetMapping("/announcements/delete/{id}")
    public String deleteAnnouncement(@PathVariable String id) {
        announcementRepository.delete(id); return "redirect:/admin";
    }

    @GetMapping("/oop")
    public String oopOverview() { return "component06/oop"; }

    private long countLines(String filePath) {
        Path path = Paths.get(filePath);
        if (!Files.exists(path)) return 0;
        try (Stream<String> lines = Files.lines(path)) { return lines.filter(l -> !l.trim().isEmpty()).count(); } catch (Exception e) { return 0; }
    }
}
