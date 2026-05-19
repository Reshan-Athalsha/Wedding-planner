<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<style>
    .container-payments { max-width: 1100px; margin: 0 auto; }
    .header-payments { display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; }
    h1 { font-size: 28px; font-weight: 700; }
    .btn-payments { padding: 11px 22px; border: none; border-radius: 10px; font-size: 14px; font-weight: 600; font-family:'Outfit',sans-serif; cursor: pointer; text-decoration: none; display: inline-block; transition: opacity 0.2s; }
    .btn-primary { background: linear-gradient(135deg,#7c3aed,#a855f7); color: #fff; }
    .btn-danger { background: rgba(239,68,68,0.2); border: 1px solid rgba(239,68,68,0.4); color: #fca5a5; }
    .btn-payments:hover { opacity: 0.85; }

    .table-payments { width: 100%; border-collapse: collapse; background: rgba(255, 255, 255, 0.05); border-radius: 16px; overflow: hidden; border: 1px solid rgba(255, 255, 255, 0.1); }
    .table-payments th { background: rgba(255, 255, 255, 0.08); padding: 14px 16px; text-align: left; font-size: 12px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; color: rgba(255, 255, 255, 0.6); }
    .table-payments td { padding: 14px 16px; border-top: 1px solid rgba(255, 255, 255, 0.06); font-size: 14px; color: rgba(255, 255, 255, 0.85); }

    .badge { display: inline-block; padding: 4px 10px; border-radius: 20px; font-size: 12px; font-weight: 600; }
    .badge-paid { background: rgba(34,197,94,0.2); color: #86efac; border: 1px solid rgba(34,197,94,0.3); }
    .badge-pending { background: rgba(245,158,11,0.2); color: #fcd34d; border: 1px solid rgba(245,158,11,0.3); }
    .badge-failed { background: rgba(239,68,68,0.2); color: #fca5a5; border: 1px solid rgba(239,68,68,0.3); }
    .empty { text-align: center; padding: 60px; color: rgba(255, 255, 255, 0.4); }
</style>

<div class="container py-5 mt-4">
    <div class="container-payments">
        <div class="header-payments">
            <h1 class="display-6 fw-bold mb-0">Payments</h1>
            <a href="/payments/new" class="btn-payments btn-primary"><i class="bi bi-plus-circle me-1"></i> Record Payment</a>
        </div>

        <c:choose>
            <c:when test="${empty payments}">
                <div class="empty">
                    <h3 class="fw-bold">No Payments Recorded</h3>
                    <p class="text-muted">Record your first payment to track transactions.</p>
                </div>
            </c:when>
            <c:otherwise>
                <table class="table-payments mt-4">
                    <thead>
                        <tr>
                            <th>Payment ID</th>
                            <th>Booking ID</th>
                            <th>Amount (LKR)</th>
                            <th>Method</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${payments}">
                            <tr>
                                <td>${p.paymentId}</td>
                                <td>${p.bookingId}</td>
                                <td style="color:#a78bfa;font-weight:600">LKR ${p.amount}</td>
                                <td>${p.paymentMethod}</td>
                                <td>${p.paymentDate}</td>
                                <td><span class="badge badge-${p.status.toLowerCase()}">${p.status}</span></td>
                                <td>
                                    <a href="/payments/delete/${p.paymentId}" class="btn-payments btn-danger" style="font-size:12px;padding:6px 14px" onclick="return confirm('Delete?')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
