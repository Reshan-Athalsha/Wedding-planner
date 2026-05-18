package com.ttt.component05.controller;

import com.ttt.component05.model.*;
import com.ttt.component05.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

/** COMPONENT 05 — Reviews & Ratings Controller (Full CRUD) */
@Controller
@RequestMapping("/reviews")
public class ReviewController {
    @Autowired private ReviewRepository reviewRepository;

    // READ — List all reviews, optionally sorted by rating desc
    @GetMapping
    public String listReviews(@RequestParam(required = false) String sort, Model model) {
        List<Review> reviews = "rating".equals(sort)
                ? reviewRepository.findByOrderByRatingDesc()
                : reviewRepository.findAll();
        double avgRating = reviews.stream().mapToInt(Review::getRating).average().orElse(0);
        model.addAttribute("reviews", reviews);
        model.addAttribute("avgRating", Math.round(avgRating * 10.0) / 10.0);
        model.addAttribute("sort", sort);
        return "component05/reviews";
    }

    // CREATE — Show form
    @GetMapping("/submit")
    public String showReviewForm() {
        return "component05/reviewForm";
    }

    // CREATE — Process form submission
    @PostMapping("/submit")
    public String submitReview(@RequestParam String reviewerName,
                               @RequestParam String vendorName,
                               @RequestParam int rating,
                               @RequestParam String comment,
                               @RequestParam(defaultValue = "PUBLIC") String reviewType) {
        String id   = "REV-" + UUID.randomUUID().toString().substring(0, 5).toUpperCase();
        String date = LocalDate.now().toString();
        Review review = "VERIFIED".equals(reviewType)
                ? new VerifiedReview(id, vendorName, reviewerName, rating, comment, date)
                : new PublicReview(id, vendorName, reviewerName, rating, comment, date);
        reviewRepository.save(review);
        return "redirect:/reviews";
    }

    // UPDATE — Show edit form pre-filled with existing review data
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
        reviewRepository.findById(id).ifPresent(r -> {
            if (r.canEdit()) {
                model.addAttribute("review", r);
            }
        });
        // If not found or not editable, redirect back with error status
        if (model.containsAttribute("review")) {
            return "component05/editReview";
        }
        return "redirect:/reviews?error=unauthorized";
    }

    // UPDATE — Process edit form
    @PostMapping("/edit")
    public String updateReview(@RequestParam String reviewId,
                               @RequestParam String reviewerName,
                               @RequestParam String vendorName,
                               @RequestParam int rating,
                               @RequestParam String comment,
                               @RequestParam String reviewType) {
        reviewRepository.findById(reviewId).ifPresent(r -> {
            // Enforce the canEdit() business rule (Abstraction)
            if (r.canEdit()) {
                Review updated = "VERIFIED".equals(reviewType)
                        ? new VerifiedReview(reviewId, vendorName, reviewerName, rating, comment, r.getReviewDate())
                        : new PublicReview(reviewId, vendorName, reviewerName, rating, comment, r.getReviewDate());
                reviewRepository.save(updated);
            }
        });
        return "redirect:/reviews";
    }

    // DELETE
    @GetMapping("/delete/{id}")
    public String deleteReview(@PathVariable String id) {
        reviewRepository.deleteById(id);
        return "redirect:/reviews";
    }
}
