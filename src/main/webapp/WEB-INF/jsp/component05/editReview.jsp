<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<div class="container py-5 mt-4">
    <div class="mx-auto" style="max-width: 600px;">
        <a href="javascript:history.back()" class="btn btn-link text-light text-decoration-none mb-3"><i class="bi bi-arrow-left"></i> Back</a>

        <div class="premium-card p-4">
            <div class="text-center mb-4">
                <span class="badge bg-primary bg-opacity-20 text-warning mb-2 py-2 px-3 border border-warning border-opacity-25 rounded-pill"><i class="bi bi-pencil-square me-1"></i> Modifying Feedback</span>
                <h2 class="h4 fw-bold text-white mb-2">Edit Your Review</h2>
                <p class="text-white-50 small">Modifying verified review (`${review.reviewId}`). Original date (`${review.reviewDate}`) will be preserved.</p>
            </div>

            <form method="post" action="/reviews/edit" class="needs-validation" novalidate>
                <input type="hidden" name="reviewId" value="${review.reviewId}">

                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Your Name</label>
                        <input type="text" name="reviewerName" id="reviewerName" class="form-control bg-dark-transparent text-white border-secondary" value="${review.userName}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Vendor Name</label>
                        <input type="text" name="vendorName" id="vendorName" class="form-control bg-dark-transparent text-white border-secondary" value="${review.vendorId}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Rating (1 to 5 Stars)</label>
                        <select name="rating" id="rating" class="form-select bg-dark-transparent text-white border-secondary" required>
                            <option value="5" class="bg-dark" ${review.rating == 5 ? 'selected' : ''}>★★★★★ (5 Stars - Perfect!)</option>
                            <option value="4" class="bg-dark" ${review.rating == 4 ? 'selected' : ''}>★★★★☆ (4 Stars - Great Service)</option>
                            <option value="3" class="bg-dark" ${review.rating == 3 ? 'selected' : ''}>★★★☆☆ (3 Stars - Satisfactory)</option>
                            <option value="2" class="bg-dark" ${review.rating == 2 ? 'selected' : ''}>★★☆☆☆ (2 Stars - Needs Improvement)</option>
                            <option value="1" class="bg-dark" ${review.rating == 1 ? 'selected' : ''}>★☆☆☆☆ (1 Star - Poor Experience)</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Review Verification Type</label>
                        <select name="reviewType" id="reviewType" class="form-select bg-dark-transparent text-white border-secondary" required>
                            <option value="VERIFIED" class="bg-dark" ${review.reviewType == 'VERIFIED' ? 'selected' : ''}>Verified (Booked through TTT - Editable)</option>
                            <option value="PUBLIC" class="bg-dark" ${review.reviewType == 'PUBLIC' ? 'selected' : ''}>Public Review (General feedback - Final/Cannot edit)</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label class="form-label text-white-50 small text-uppercase">Your Written Feedback</label>
                        <textarea name="comment" id="comment" class="form-control bg-dark-transparent text-white border-secondary" rows="4" required>${review.comment}</textarea>
                    </div>

                    <div class="col-12 d-flex gap-2 mt-4">
                        <button type="submit" class="btn btn-warning px-4 rounded-pill fw-bold text-dark shadow-sm">Save Changes</button>
                        <a href="/reviews" class="btn btn-outline-light px-4 rounded-pill">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
