<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<div class="container py-5 mt-4" style="max-width: 1000px;">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="display-6 fw-bold mb-1">Manage Admins</h1>
            <p class="text-secondary">Super admins and moderators</p>
        </div>
        <a href="/admin" class="btn btn-nav-login" style="border-radius:12px;">← Dashboard</a>
    </div>

    <div class="premium-card p-4 mb-4">
        <h5 class="fw-bold mb-3">Add Admin</h5>
        <form method="post" action="/admin/admins/new" class="row g-3">
            <div class="col-md-6">
                <label class="form-label text-muted small">Username</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label class="form-label text-muted small">Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label class="form-label text-muted small">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label class="form-label text-muted small">Role</label>
                <select name="role" class="form-select">
                    <option value="MODERATOR">Moderator</option>
                    <option value="SUPER_ADMIN">Super Admin</option>
                </select>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-nav-login">Create Admin</button>
            </div>
        </form>
    </div>

    <div class="premium-card p-4">
        <h5 class="fw-bold mb-3">Existing Admins</h5>
        <c:choose>
            <c:when test="${empty admins}">
                <p class="text-muted mb-0">No admins registered yet.</p>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-dark table-borderless align-middle mb-0">
                        <thead>
                            <tr class="text-muted small text-uppercase">
                                <th>ID</th><th>Username</th><th>Email</th><th>Role</th><th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="a" items="${admins}">
                                <tr>
                                    <td>${a.adminId}</td>
                                    <td>${a.username}</td>
                                    <td>${a.email}</td>
                                    <td><span class="badge bg-warning text-dark">${a.roleName}</span></td>
                                    <td class="text-end">
                                        <a href="/admin/admins/delete/${a.adminId}" class="text-danger small" onclick="return confirm('Delete this admin?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
