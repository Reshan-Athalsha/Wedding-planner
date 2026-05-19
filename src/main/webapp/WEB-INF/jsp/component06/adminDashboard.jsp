<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<style>
    .container-admin { max-width: 1100px; margin: 0 auto; }
    .stats-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 36px; }
    .stat-icon { font-size: 1.8rem; margin-bottom: 12px; }
    .stat-value { font-size: 40px; font-weight: 700; margin-bottom: 4px; color: #ffffff !important; }
    .stat-label { color: rgba(255, 255, 255, 0.5); font-size: 14px; }

    .layout-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; }
    .admin-section-title { font-size: 18px; font-weight: 700; margin-bottom: 20px; color: #ffffff !important; }

    input { width: 100%; padding: 10px; background: rgba(255, 255, 255, 0.08); border: 1px solid rgba(255, 255, 255, 0.15); border-radius: 8px; color: #fff; margin-bottom: 10px; }
</style>

<div class="container py-5 mt-4">
    <div class="container-admin">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h1 class="display-6 fw-bold">Admin Dashboard</h1>
                <p class="text-secondary mt-1">System-wide overview across all components</p>
            </div>
            <a href="/admin/admins" class="btn btn-nav-login" style="border-radius:12px; padding:10px 24px;"><i class="bi bi-shield-lock me-1"></i> Manage Admins</a>
        </div>


        <div class="stats-grid mt-4">
            <div class="premium-card p-4">
                <div class="stat-icon"><i class="bi bi-people fs-4 text-primary"></i></div>
                <div class="stat-value">${userCount}</div>
                <div class="stat-label">Registered Users</div>
            </div>

            <div class="premium-card p-4">
                <div class="stat-icon"><i class="bi bi-shop fs-4 text-danger"></i></div>
                <div class="stat-value">${vendorCount}</div>
                <div class="stat-label">Vendors</div>
            </div>

            <div class="premium-card p-4">
                <div class="stat-icon"><i class="bi bi-calendar-check fs-4 text-warning"></i></div>
                <div class="stat-value">${bookingCount}</div>
                <div class="stat-label">Bookings</div>
            </div>

            <div class="premium-card p-4">
                <div class="stat-icon"><i class="bi bi-credit-card fs-4 text-info"></i></div>
                <div class="stat-value">${paymentCount}</div>
                <div class="stat-label">Payments</div>
            </div>

            <div class="premium-card p-4">
                <div class="stat-icon"><i class="bi bi-star fs-4 text-warning"></i></div>
                <div class="stat-value">${reviewCount}</div>
                <div class="stat-label">Reviews</div>
            </div>

            <div class="premium-card p-4">
                <div class="stat-icon"><i class="bi bi-check2-square fs-4 text-success"></i></div>
                <div class="stat-value">${taskCount}</div>
                <div class="stat-label">Planning Tasks</div>
            </div>
        </div>


        <div class="layout-grid mt-4">
            <div class="premium-card p-4">
                <h3 class="admin-section-title"><i class="bi bi-megaphone text-danger me-2"></i>Post Announcement</h3>
                <form method="post" action="/admin/announcements/new">
                    <input type="text" name="title" placeholder="Announcement Title" required>
                    <input type="text" name="content" placeholder="Content..." required>
                    <button type="submit" class="btn btn-nav-login" style="width:100%; margin-top:10px; border-radius:8px;">Post Announcement</button>
                </form>
            </div>

            <div class="premium-card p-4">
                <h3 class="admin-section-title"><i class="bi bi- megaphone-fill text-danger me-2"></i>Recent Announcements</h3>
                <c:forEach var="ann" items="${announcements}">
                    <div style="background:rgba(0,0,0,0.2);padding:15px;border-radius:12px;margin-bottom:10px">
                        <div style="display:flex;justify-content:space-between">
                            <strong>${ann.title}</strong>
                            <a href="/admin/announcements/delete/${ann.id}" style="color:#ef4444;text-decoration:none;font-size:12px">Delete</a>
                        </div>
                        <div style="font-size:13px;color:rgba(255,255,255,0.6);margin:4px 0">${ann.date}</div>
                        <div style="font-size:14px;color:rgba(255,255,255,0.9)">${ann.content}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
