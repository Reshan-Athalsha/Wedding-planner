<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<style>
    .container-admin { max-width: 1100px; margin: 0 auto; }
    .stats-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 36px; }
    .stat-icon { font-size: 1.8rem; margin-bottom: 12px; }
    .stat-value { font-size: 40px; font-weight: 700; margin-bottom: 4px; color: #ffffff !important; }
    .stat-label { color: rgba(255, 255, 255, 0.5); font-size: 14px; }
    .stat-link { display: block; margin-top: 16px; color: #a78bfa; font-size: 13px; font-weight: 600; text-decoration: none; }
    .stat-link:hover { color: #c4b5fd; }
    
    .layout-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; }
    .admin-section-title { font-size: 18px; font-weight: 700; margin-bottom: 20px; color: #ffffff !important; }
    
    .quick-link { display: flex; align-items: center; justify-content: space-between; padding: 12px 16px; background: rgba(255, 255, 255, 0.05); border-radius: 12px; margin-bottom: 10px; text-decoration: none; color: #fff; font-size: 14px; transition: background 0.2s; }
    .quick-link:hover { background: rgba(255, 255, 255, 0.1); color: #ffffff !important; }
    .quick-link-icon { font-size: 1.2rem; margin-right: 12px; }
    .arrow { color: rgba(255, 255, 255, 0.3); }
</style>

<div class="container py-5 mt-4">
    <div class="container-admin">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h1 class="display-6 fw-bold">Admin Dashboard</h1>
                <p class="text-secondary mt-1">System-wide overview across all 6 components</p>
            </div>
            <a href="/admin/admins" class="btn btn-nav-login" style="border-radius:12px; padding:10px 24px;"><i class="bi bi-shield-lock me-1"></i> Manage Admins</a>
        </div>

        <!-- STATS GRID -->
        <div class="stats-grid mt-4">
            <div class="premium-card p-4 d-flex flex-column justify-content-between">
                <div>
                    <div class="stat-icon"><i class="bi bi-people fs-4 text-primary"></i></div>
                    <div class="stat-value">${userCount}</div>
                    <div class="stat-label">Registered Users</div>
                </div>
                <a href="/register" class="stat-link">Manage Users &rarr;</a>
            </div>
            
            <div class="premium-card p-4 d-flex flex-column justify-content-between">
                <div>
                    <div class="stat-icon"><i class="bi bi-shop fs-4 text-danger"></i></div>
                    <div class="stat-value">${vendorCount}</div>
                    <div class="stat-label">Vendors</div>
                </div>
                <a href="/vendors" class="stat-link">Manage Vendors &rarr;</a>
            </div>
            
            <div class="premium-card p-4 d-flex flex-column justify-content-between">
                <div>
                    <div class="stat-icon"><i class="bi bi-calendar-check fs-4 text-warning"></i></div>
                    <div class="stat-value">${bookingCount}</div>
                    <div class="stat-label">Bookings</div>
                </div>
                <a href="/bookings" class="stat-link">Manage Bookings &rarr;</a>
            </div>
            
            <div class="premium-card p-4 d-flex flex-column justify-content-between">
                <div>
                    <div class="stat-icon"><i class="bi bi-credit-card fs-4 text-info"></i></div>
                    <div class="stat-value">${paymentCount}</div>
                    <div class="stat-label">Payments</div>
                </div>
                <a href="/payments" class="stat-link">Manage Payments &rarr;</a>
            </div>
            
            <div class="premium-card p-4 d-flex flex-column justify-content-between">
                <div>
                    <div class="stat-icon"><i class="bi bi-star fs-4 text-warning"></i></div>
                    <div class="stat-value">${reviewCount}</div>
                    <div class="stat-label">Reviews</div>
                </div>
                <a href="/reviews" class="stat-link">Manage Reviews &rarr;</a>
            </div>
            
            <div class="premium-card p-4 d-flex flex-column justify-content-between">
                <div>
                    <div class="stat-icon"><i class="bi bi-check2-square fs-4 text-success"></i></div>
                    <div class="stat-value">${taskCount}</div>
                    <div class="stat-label">Planning Tasks</div>
                </div>
                <a href="/planning" class="stat-link">Manage Planning &rarr;</a>
            </div>
        </div>

        <!-- SECTIONS GRID -->
        <div class="layout-grid mt-4">
            <div class="premium-card p-4">
                <div class="admin-section-title">⚡ Quick Actions</div>
                <a href="/vendors/new" class="quick-link">
                    <span><i class="bi bi-shop quick-link-icon text-danger"></i>Add New Vendor</span>
                    <span class="arrow">&rarr;</span>
                </a>
                <a href="/bookings/new" class="quick-link">
                    <span><i class="bi bi-calendar-check quick-link-icon text-warning"></i>Create Booking</span>
                    <span class="arrow">&rarr;</span>
                </a>
                <a href="/payments/new" class="quick-link">
                    <span><i class="bi bi-credit-card quick-link-icon text-info"></i>Record Payment</span>
                    <span class="arrow">&rarr;</span>
                </a>
                <a href="/reviews/submit" class="quick-link">
                    <span><i class="bi bi-star quick-link-icon text-warning"></i>Write Review</span>
                    <span class="arrow">&rarr;</span>
                </a>
                <a href="/planning" class="quick-link">
                    <span><i class="bi bi-card-checklist quick-link-icon text-success"></i>Planning Tools</span>
                    <span class="arrow">&rarr;</span>
                </a>
            </div>
            
            <div class="premium-card p-4">
                <div class="admin-section-title">🔧 System Info</div>
                <div class="quick-link"><span>Architecture</span><span style="color:#86efac;font-weight:600">File-based I/O</span></div>
                <div class="quick-link"><span>Database</span><span style="color:#86efac;font-weight:600">None (java.io)</span></div>
                <div class="quick-link"><span>Framework</span><span style="color:#a78bfa;font-weight:600">Spring Boot 3.2</span></div>
                <div class="quick-link"><span>Views</span><span style="color:#a78bfa;font-weight:600">JSP + JSTL</span></div>
                <div class="quick-link"><span>Components</span><span style="color:#fbbf24;font-weight:600">6 Modules</span></div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
