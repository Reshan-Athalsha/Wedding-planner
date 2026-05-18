<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<div class="container py-5 mt-4">
    <div class="mx-auto" style="max-width: 600px;">
        <a href="/bookings" class="btn btn-link text-light text-decoration-none mb-3"><i class="bi bi-arrow-left"></i> Back to Bookings</a>
        
        <div class="premium-card p-4">
            <h2 class="h4 fw-bold mb-4"><i class="bi bi-calendar-check text-warning me-2"></i>New Booking</h2>
            
            <form method="post" action="/bookings/new">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Client Name</label>
                        <input type="text" name="clientName" id="clientName" class="form-control bg-dark-transparent text-white border-secondary" placeholder="Couple's name" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Vendor Name</label>
                        <input type="text" name="vendorName" id="vendorName" class="form-control bg-dark-transparent text-white border-secondary" placeholder="Vendor business name" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Event Date</label>
                        <input type="date" name="eventDate" id="eventDate" class="form-control bg-dark-transparent text-white border-secondary" required>
                    </div>
                    <div class="col-md-6"></div>
                    
                    <div class="col-12 d-flex gap-2 mt-4">
                        <button type="submit" class="btn btn-warning px-4 rounded-pill fw-bold">Create Booking</button>
                        <a href="/bookings" class="btn btn-outline-light px-4 rounded-pill">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
