package com.ttt.component01.controller;

import com.ttt.component01.model.CoupleUser;
import com.ttt.component01.model.User;
import com.ttt.component01.repository.CoupleUserRepository;
import com.ttt.shared.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import java.util.UUID;

/** COMPONENT 01 — Couple/User Management Controller | Full CRUD */
@Controller
public class UserController {
    @Autowired private CoupleUserRepository userRepository;

    @GetMapping("/register")
    public String showRegisterForm() { return "component01/register"; }

    @PostMapping("/register")
    public String processRegistration(@RequestParam String name, @RequestParam String email,
                                      @RequestParam String password, Model model) {
        String cleanedName = SecurityUtils.clean(name);
        String cleanedEmail = SecurityUtils.clean(email);
        String cleanedPassword = SecurityUtils.clean(password);

        if (cleanedName == null || cleanedName.isEmpty() || 
            cleanedEmail == null || cleanedEmail.isEmpty() || 
            cleanedPassword == null || cleanedPassword.isEmpty()) {
            model.addAttribute("error", "All fields are required."); return "component01/register";
        }
        if (userRepository.findByEmail(cleanedEmail) != null) {
            model.addAttribute("error", "An account with this email already exists."); return "component01/register";
        }
        String uid = "USR-" + UUID.randomUUID().toString().substring(0,5).toUpperCase();
        User newUser = new CoupleUser(uid, cleanedName, cleanedEmail, cleanedPassword); // POLYMORPHISM
        userRepository.save((CoupleUser) newUser);
        return "redirect:/login?registered=true";
    }

    @GetMapping("/login")
    public String showLoginForm() { return "component01/login"; }

    @PostMapping("/login")
    public String processLogin(@RequestParam String email, @RequestParam String password,
                               HttpSession session, Model model) {
        CoupleUser user = userRepository.findByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("userId",    user.getUserId());
            session.setAttribute("userName",  user.getName());
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userRole",  user.getRole());
            return "redirect:/profile";
        }
        model.addAttribute("error", "Invalid email or password.");
        return "component01/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) { session.invalidate(); return "redirect:/login?logout=true"; }

    @GetMapping("/profile")
    public String showProfile(HttpSession session, Model model) {
        if (session.getAttribute("userId") == null) return "redirect:/login";
        String uid = (String) session.getAttribute("userId");
        userRepository.findById(uid).ifPresent(u -> model.addAttribute("coupleUser", u));
        return "component01/profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@RequestParam String name, @RequestParam String password,
                                @RequestParam(required=false) String weddingDate,
                                @RequestParam(defaultValue="0") double budget,
                                @RequestParam(defaultValue="0") int guestCount,
                                @RequestParam(required=false) String theme,
                                @RequestParam String userId,
                                @RequestParam String role,
                                HttpSession session, Model model) {
        String oldUid = (String) session.getAttribute("userId");
        if (oldUid == null) return "redirect:/login";
        CoupleUser user = userRepository.findById(oldUid).orElse(null);
        if (user == null) return "redirect:/login";
        
        String cleanedName = SecurityUtils.clean(name);
        String cleanedUserId = SecurityUtils.clean(userId);
        String cleanedRole = SecurityUtils.clean(role);
        
        // Prevent duplicate user IDs in repository
        if (!cleanedUserId.equals(oldUid) && userRepository.findById(cleanedUserId).isPresent()) {
            model.addAttribute("error", "User ID already taken. Please choose a different ID.");
            model.addAttribute("coupleUser", user);
            return "component01/profile";
        }

        user.setName(cleanedName);
        if (!password.isEmpty()) user.setPassword(SecurityUtils.clean(password));
        if (weddingDate != null && !weddingDate.isEmpty()) user.setWeddingDate(SecurityUtils.clean(weddingDate));
        if (budget > 0) user.setBudget(budget);
        if (guestCount > 0) user.setGuestCount(guestCount);
        if (theme != null && !theme.isEmpty()) user.setTheme(SecurityUtils.clean(theme));
        
        user.setRole(cleanedRole);
        
        if (!cleanedUserId.equals(oldUid)) {
            userRepository.deleteById(oldUid);
            user.setUserId(cleanedUserId);
            session.setAttribute("userId", cleanedUserId);
        }
        
        userRepository.save(user);
        session.setAttribute("userName", cleanedName);
        session.setAttribute("userRole", cleanedRole);
        model.addAttribute("success", "Profile updated successfully.");
        model.addAttribute("coupleUser", user);
        return "component01/profile";
    }

    @PostMapping("/profile/delete")
    public String deleteProfile(HttpSession session) {
        String uid = (String) session.getAttribute("userId");
        if (uid != null) userRepository.deleteById(uid);
        session.invalidate();
        return "redirect:/register?deleted=true";
    }
}
