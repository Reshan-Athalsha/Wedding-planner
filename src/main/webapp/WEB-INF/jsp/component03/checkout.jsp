<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<div class="container py-5 mt-4">
    <div class="mx-auto" style="max-width: 600px;">
        <a href="javascript:history.back()" class="btn btn-link text-light text-decoration-none mb-3"><i class="bi bi-arrow-left"></i> Back</a>
        
        <div class="premium-card p-4">
            <h2 class="h4 fw-bold mb-4"><i class="bi bi-credit-card text-warning me-2"></i>Record Payment</h2>
            
            <form method="post" action="/payments/new">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Booking ID</label>
                        <input type="text" name="bookingId" id="bookingId" class="form-control bg-dark-transparent text-white border-secondary" placeholder="e.g. BKG-XXXXX" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Amount (LKR)</label>
                        <input type="number" name="amount" id="amount" min="0" step="0.01" class="form-control bg-dark-transparent text-white border-secondary" placeholder="0.00" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Payment Method</label>
                        <select name="paymentMethod" id="paymentMethod" class="form-select bg-dark-transparent text-white border-secondary" required>
                            <option value="" class="bg-dark">Select...</option>
                            <option class="bg-dark">Cash</option>
                            <option class="bg-dark">Bank Transfer</option>
                            <option class="bg-dark">Card</option>
                            <option class="bg-dark">Cheque</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white-50 small text-uppercase">Payment Date</label>
                        <input type="date" name="paymentDate" id="paymentDate" class="form-control bg-dark-transparent text-white border-secondary" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label text-white-50 small text-uppercase">Status</label>
                        <select name="status" id="status" class="form-select bg-dark-transparent text-white border-secondary">
                            <option value="PAID" class="bg-dark">Paid</option>
                            <option value="PENDING" class="bg-dark">Pending</option>
                        </select>
                    </div>
                    
                    <div class="col-12 d-flex gap-2 mt-4">
                        <button type="submit" class="btn btn-warning px-4 rounded-pill fw-bold text-dark shadow-sm">Record Payment</button>
                        <a href="/payments" class="btn btn-outline-light px-4 rounded-pill">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
