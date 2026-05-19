<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<div class="container py-5 mt-4" style="max-width: 900px;">
    <h1 class="display-6 fw-bold mb-2">OOP Concepts in TTT</h1>
    <p class="text-secondary mb-4">Tie The Tech applies core object-oriented principles across all six components.</p>

    <div class="row g-4">
        <div class="col-md-6">
            <div class="premium-card p-4 h-100">
                <h5 class="text-gold">Abstraction</h5>
                <p class="mb-0">Abstract base classes such as <code>User</code>, <code>Vendor</code>, and <code>Review</code> define contracts without exposing implementation details.</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="premium-card p-4 h-100">
                <h5 class="text-gold">Inheritance</h5>
                <p class="mb-0"><code>CoupleUser</code>, <code>VenueVendor</code>, and <code>VerifiedReview</code> extend parent types to reuse shared behavior.</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="premium-card p-4 h-100">
                <h5 class="text-gold">Encapsulation</h5>
                <p class="mb-0">Private fields with getters/setters protect domain state in every model class.</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="premium-card p-4 h-100">
                <h5 class="text-gold">Polymorphism</h5>
                <p class="mb-0">Controllers use parent references (<code>User</code>, <code>Vendor</code>, <code>Review</code>) while runtime types vary by input.</p>
            </div>
        </div>
        <div class="col-12">
            <div class="premium-card p-4">
                <h5 class="text-gold">Information Hiding</h5>
                <p class="mb-0">Repository classes hide all <code>java.io</code> file operations from controllers, exposing only CRUD methods.</p>
            </div>
        </div>
    </div>

    <div class="mt-4">
        <a href="/admin" class="btn btn-nav-login">← Back to Admin</a>
        <a href="/" class="btn btn-outline-light ms-2 rounded-pill">Home</a>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
