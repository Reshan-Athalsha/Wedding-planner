<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<div class="container py-5 mt-4">
    <div class="mx-auto" style="max-width: 600px;">
        <a href="/vendors" class="btn btn-link text-light text-decoration-none mb-3"><i class="bi bi-arrow-left"></i> Back to Vendors</a>
        
        <div class="premium-card p-4">
            <h2 class="h4 fw-bold mb-4"><i class="bi bi-pencil text-warning me-2"></i>Edit Vendor</h2>
            
            <form method="post" action="/vendors/edit">
                <input type="hidden" name="vendorId" value="${vendor.vendorId}">
                
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Business Name</label>
                        <input type="text" name="businessName" class="form-control bg-dark-transparent text-white border-secondary" value="${vendor.businessName}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Rating (0–5)</label>
                        <input type="number" name="rating" class="form-control bg-dark-transparent text-white border-secondary" value="${vendor.rating}" min="0" max="5" step="0.5" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Location</label>
                        <input type="text" name="location" class="form-control bg-dark-transparent text-white border-secondary" value="${vendor.location}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Price Range</label>
                        <input type="text" name="priceRange" class="form-control bg-dark-transparent text-white border-secondary" value="${vendor.priceRange}" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label text-white-50 small text-uppercase">Description</label>
                        <textarea name="description" class="form-control bg-dark-transparent text-white border-secondary" rows="3" required>${vendor.description}</textarea>
                    </div>
                    <div class="col-12 d-flex gap-2 mt-4">
                        <button type="submit" class="btn btn-warning px-4 rounded-pill fw-bold">Save Changes</button>
                        <a href="/vendors" class="btn btn-outline-light px-4 rounded-pill">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
