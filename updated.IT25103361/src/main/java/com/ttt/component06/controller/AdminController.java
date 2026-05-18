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

//tells spring to this is controller class
@Controller
@RequestMapping("/admin")
public class AdminController {

     //get access from repository
     private AdminRepository adminRepository;
     private AnnouncementRepository announcementRepository;

     //browser page open request 
    @GetMapping
     //Model --> send data from controller to html
    public String adminDashboard(Model model) {
        
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

    // ADMIN CRUD 
    @GetMapping("/admins")
    public String listAdmins(Model model) {
        model.addAttribute("admins", adminRepository.findAll());
        return "component06/admins";
    }

    @PostMapping("/admins/new")
    public String createAdmin(@RequestParam String username, @RequestParam String email, 
                              @RequestParam String password, @RequestParam String role) {
          //create unique ID
        String id = "ADM-" + UUID.randomUUID().toString().substring(0,5).toUpperCase();
         
        Admin admin = "SUPER_ADMIN".equals(role) ? new SuperAdmin(id, username, password, email) 
                                                 : new ModeratorAdmin(id, username, password, email);
         
         //save into file
        adminRepository.save(admin);
        return "redirect:/admin/admins";
    }

     //delete admin
    @GetMapping("/admins/delete/{id}")
    public String deleteAdmin(@PathVariable String id) {
        adminRepository.delete(id); 
         return "redirect:/admin/admins";
    }

    // ANNOUNCEMENT CRUD 
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

     //count rows in file
    private long countLines(String filePath) {
         //find file path
        Path path = Paths.get(filePath);
         
        if (!Files.exists(path)) 
             return 0;
        try (Stream<String> lines = Files.lines(path)) { 
             //ignore blank rows
             return lines.filter(l -> !l.trim().isEmpty()).count();
        } catch (Exception e) {
             return 0; }
    }
}
