<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<div class="container py-5 mt-4">
    <div class="mx-auto" style="max-width: 600px;">
        <a href="/vendors" class="btn btn-link text-light text-decoration-none mb-3"><i class="bi bi-arrow-left"></i> Back to Vendors</a>
        
        <div class="premium-card p-4">
            <h2 class="h4 fw-bold mb-4"><i class="bi bi-shop text-danger me-2"></i>Add New Vendor</h2>
            
            <form method="post" action="/vendors/new">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Business Name</label>
                        <input type="text" name="businessName" id="businessName" class="form-control bg-dark-transparent text-white border-secondary" placeholder="e.g. Crystal Palace Events" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Category</label>
                        <select name="category" id="category" class="form-select bg-dark-transparent text-white border-secondary" required>
                            <option value="" class="bg-dark">Select Category</option>
                            <option value="VENUE" class="bg-dark">Venue</option>
                            <option value="CATERING" class="bg-dark">Catering</option>
                            <option value="PHOTOGRAPHY" class="bg-dark">Photography</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Location</label>
                        <input type="text" name="location" id="location" class="form-control bg-dark-transparent text-white border-secondary" placeholder="e.g. Colombo, Sri Lanka" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Price Range</label>
                        <input type="text" name="priceRange" id="priceRange" class="form-control bg-dark-transparent text-white border-secondary" placeholder="e.g. LKR 100,000 - 500,000" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label text-white-50 small text-uppercase">Description</label>
                        <textarea name="description" id="description" class="form-control bg-dark-transparent text-white border-secondary" rows="3" placeholder="Describe the vendor's services..." required></textarea>
                    </div>
                    <div class="col-12 d-flex gap-2 mt-4">
                        <button type="submit" class="btn btn-warning px-4 rounded-pill fw-bold">Add Vendor</button>
                        <a href="/vendors" class="btn btn-outline-light px-4 rounded-pill">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
