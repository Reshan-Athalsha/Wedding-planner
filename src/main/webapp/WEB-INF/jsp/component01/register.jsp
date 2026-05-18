<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<div class="container py-5 mt-4">
    <div class="mx-auto" style="max-width: 480px;">
        <a href="javascript:history.back()" class="btn btn-link text-light text-decoration-none mb-3"><i class="bi bi-arrow-left"></i> Back</a>
        
        <div class="premium-card p-4">
            <div class="text-center mb-4">
                <h2 class="h3 fw-bold mb-1"><i class="bi bi-person-plus text-warning me-2"></i>Create Account</h2>
                <p class="text-white-50 small">Start planning your perfect wedding</p>
            </div>
            
            <c:if test="${not empty error}">
                <div class="alert alert-danger bg-danger bg-opacity-20 border-danger text-light small py-2 mb-3" style="border-radius: 10px;">${error}</div>
            </c:if>
            
            <form method="post" action="/register">
                <div class="mb-3">
                    <label class="form-label text-white-50 small text-uppercase">Full Name</label>
                    <input type="text" name="name" id="name" class="form-control bg-dark-transparent text-white border-secondary" placeholder="Your name" required>
                </div>
                <div class="mb-3">
                    <label class="form-label text-white-50 small text-uppercase">Email Address</label>
                    <input type="email" name="email" id="email" class="form-control bg-dark-transparent text-white border-secondary" placeholder="you@example.com" required>
                </div>
                <div class="mb-4">
                    <label class="form-label text-white-50 small text-uppercase">Password</label>
                    <input type="password" name="password" id="password" class="form-control bg-dark-transparent text-white border-secondary" placeholder="Choose a password" required>
                </div>
                
                <button type="submit" class="btn btn-warning w-100 py-2 rounded-pill fw-bold text-dark shadow-sm">Create Account</button>
            </form>
            
            <div class="text-center mt-4">
                <span class="text-white-50 small">Already have an account? <a href="/login" class="text-warning text-decoration-none fw-bold">Sign In</a></span>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
