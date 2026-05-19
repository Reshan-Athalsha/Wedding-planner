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
import com.ttt.shared.SecurityUtils;


@Controller
@RequestMapping("/reviews")
public class ReviewController {
    @Autowired private ReviewRepository reviewRepository;


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


    @GetMapping("/submit")
    public String showReviewForm() {
        return "component05/reviewForm";
    }


    @PostMapping("/submit")
    public String submitReview(@RequestParam String reviewerName,
                               @RequestParam String vendorName,
                               @RequestParam int rating,
                               @RequestParam String comment,
                               @RequestParam(defaultValue = "PUBLIC") String reviewType) {
        String id   = "REV-" + UUID.randomUUID().toString().substring(0, 5).toUpperCase();
        String date = LocalDate.now().toString();

        String cleanedReviewerName = SecurityUtils.clean(reviewerName);
        String cleanedVendorName = SecurityUtils.clean(vendorName);
        String cleanedComment = SecurityUtils.clean(comment);

        Review review = "VERIFIED".equals(reviewType)
                ? new VerifiedReview(id, cleanedVendorName, cleanedReviewerName, rating, cleanedComment, date)
                : new PublicReview(id, cleanedVendorName, cleanedReviewerName, rating, cleanedComment, date);
        reviewRepository.save(review);
        return "redirect:/reviews";
    }


    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
        reviewRepository.findById(id).ifPresent(r -> {
            if (r.canEdit()) {
                model.addAttribute("review", r);
            }
        });

        if (model.containsAttribute("review")) {
            return "component05/editReview";
        }
        return "redirect:/reviews?error=unauthorized";
    }


    @PostMapping("/edit")
    public String updateReview(@RequestParam String reviewId,
                               @RequestParam String reviewerName,
                               @RequestParam String vendorName,
                               @RequestParam int rating,
                               @RequestParam String comment,
                               @RequestParam String reviewType) {
        reviewRepository.findById(reviewId).ifPresent(r -> {

            if (r.canEdit()) {
                String cleanedReviewerName = SecurityUtils.clean(reviewerName);
                String cleanedVendorName = SecurityUtils.clean(vendorName);
                String cleanedComment = SecurityUtils.clean(comment);

                Review updated = "VERIFIED".equals(reviewType)
                        ? new VerifiedReview(reviewId, cleanedVendorName, cleanedReviewerName, rating, cleanedComment, r.getReviewDate())
                        : new PublicReview(reviewId, cleanedVendorName, cleanedReviewerName, rating, cleanedComment, r.getReviewDate());
                reviewRepository.save(updated);
            }
        });
        return "redirect:/reviews";
    }


    @GetMapping("/delete/{id}")
    public String deleteReview(@PathVariable String id) {
        reviewRepository.deleteById(id);
        return "redirect:/reviews";
    }
}
