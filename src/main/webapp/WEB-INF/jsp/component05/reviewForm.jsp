<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<div class="container py-5 mt-4">
    <div class="mx-auto" style="max-width: 600px;">
        <a href="javascript:history.back()" class="btn btn-link text-light text-decoration-none mb-3"><i class="bi bi-arrow-left"></i> Back</a>
        
        <div class="premium-card p-4">
            <div class="text-center mb-4">
                <span class="badge bg-primary bg-opacity-20 text-warning mb-2 py-2 px-3 border border-warning border-opacity-25 rounded-pill"><i class="bi bi-star-fill me-1"></i> Submitting Feedback</span>
                <h2 class="h4 fw-bold text-white mb-2">Write a New Review</h2>
                <p class="text-white-50 small">Your reviews help the community find trusted wedding services</p>
            </div>
            
            <form method="post" action="/reviews/submit" class="needs-validation" novalidate>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Your Name</label>
                        <input type="text" name="reviewerName" id="reviewerName" class="form-control bg-dark-transparent text-white border-secondary" placeholder="e.g. Jane Doe" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Vendor Name</label>
                        <input type="text" name="vendorName" id="vendorName" class="form-control bg-dark-transparent text-white border-secondary" placeholder="e.g. Royal Banquet Hall" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Rating (1 to 5 Stars)</label>
                        <select name="rating" id="rating" class="form-select bg-dark-transparent text-white border-secondary" required>
                            <option value="5" class="bg-dark" selected>★★★★★ (5 Stars - Perfect!)</option>
                            <option value="4" class="bg-dark">★★★★☆ (4 Stars - Great Service)</option>
                            <option value="3" class="bg-dark">★★★☆☆ (3 Stars - Satisfactory)</option>
                            <option value="2" class="bg-dark">★★☆☆☆ (2 Stars - Needs Improvement)</option>
                            <option value="1" class="bg-dark">★☆☆☆☆ (1 Star - Poor Experience)</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Review Verification Type</label>
                        <select name="reviewType" id="reviewType" class="form-select bg-dark-transparent text-white border-secondary" required>
                            <option value="VERIFIED" class="bg-dark">Verified (Booked through TTT - Editable)</option>
                            <option value="PUBLIC" class="bg-dark">Public Review (General feedback - Final/Cannot edit)</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label class="form-label text-white-50 small text-uppercase">Your Written Feedback</label>
                        <textarea name="comment" id="comment" class="form-control bg-dark-transparent text-white border-secondary" rows="4" placeholder="Detail your experience with this vendor, from setup to final delivery..." required></textarea>
                    </div>
                    
                    <div class="col-12 d-flex gap-2 mt-4">
                        <button type="submit" class="btn btn-warning px-4 rounded-pill fw-bold text-dark shadow-sm">Submit Feedback</button>
                        <a href="/reviews" class="btn btn-outline-light px-4 rounded-pill">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
