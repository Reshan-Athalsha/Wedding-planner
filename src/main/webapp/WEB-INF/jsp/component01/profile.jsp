<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<div class="container py-5 mt-4">
    <div class="mx-auto" style="max-width: 700px;">
        <a href="javascript:history.back()" class="btn btn-link text-light text-decoration-none mb-3"><i class="bi bi-arrow-left"></i> Back</a>
        
        <c:if test="${not empty success}">
            <div class="alert alert-success bg-success bg-opacity-20 border-success text-light small py-2 mb-3" style="border-radius: 10px;">${success}</div>
        </c:if>
        
        <div class="premium-card p-4">
            <h2 class="h4 fw-bold mb-3"><i class="bi bi-person-circle text-warning me-2"></i>My Profile</h2>
            
            <c:if test="${not empty coupleUser}">
                <div class="d-flex gap-2 mb-4">
                    <span class="badge bg-primary bg-opacity-20 text-warning border border-warning border-opacity-25 py-2 px-3 rounded-pill">ID: ${coupleUser.userId}</span>
                    <span class="badge bg-primary bg-opacity-20 text-warning border border-warning border-opacity-25 py-2 px-3 rounded-pill">Role: ${coupleUser.role}</span>
                </div>
                
                <form method="post" action="/profile/update">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label text-white-50 small text-uppercase">Full Name</label>
                            <input type="text" name="name" class="form-control bg-dark-transparent text-white border-secondary" value="${coupleUser.name}" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-white-50 small text-uppercase">New Password (leave blank to keep)</label>
                            <input type="password" name="password" class="form-control bg-dark-transparent text-white border-secondary" placeholder="••••••••">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-white-50 small text-uppercase">Wedding Date</label>
                            <input type="date" name="weddingDate" class="form-control bg-dark-transparent text-white border-secondary" value="${coupleUser.weddingDate}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-white-50 small text-uppercase">Budget (LKR)</label>
                            <input type="number" name="budget" class="form-control bg-dark-transparent text-white border-secondary" value="${coupleUser.budget}" step="1000">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-white-50 small text-uppercase">Guest Count</label>
                            <input type="number" name="guestCount" class="form-control bg-dark-transparent text-white border-secondary" value="${coupleUser.guestCount}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-white-50 small text-uppercase">Wedding Theme</label>
                            <input type="text" name="theme" class="form-control bg-dark-transparent text-white border-secondary" value="${coupleUser.theme}" placeholder="e.g. Rustic, Garden">
                        </div>
                        
                        <div class="col-12 mt-4">
                            <button type="submit" class="btn btn-warning px-4 rounded-pill fw-bold text-dark shadow-sm">Save Changes</button>
                        </div>
                    </div>
                </form>
                
                <hr class="border-secondary my-4">
                
                <form method="post" action="/profile/delete" onsubmit="return confirm('Delete your account permanently?')">
                    <button type="submit" class="btn btn-danger px-4 rounded-pill fw-bold">Delete Account</button>
                </form>
            </c:if>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
