<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<!-- ===== HERO ===== -->
<section class="hero">
    <div class="container position-relative">
        <div class="row align-items-center">
            <div class="col-lg-7">
                <span class="badge-tag"><i class="bi bi-shield-check me-1"></i> Next-Gen Wedding Coordination Suite</span>
                <h1>Plan Your Perfect<br>Wedding with TTT</h1>
                <p class="my-4">An enterprise-grade, zero-dependency wedding planning management suite. Seamlessly choreograph vendors, bookings, schedules, and payments on a unified, high-performance architecture.</p>
                <div class="d-flex gap-3 flex-wrap">
                    <a href="/register" class="btn btn-warning btn-lg rounded-pill px-4 fw-bold shadow-sm">Get Started <i class="bi bi-arrow-right"></i></a>
                    <a href="/login" class="btn btn-outline-light btn-lg rounded-pill px-4 fw-bold">Sign In</a>
                </div>
            </div>
            <div class="col-lg-5 text-center mt-5 mt-lg-0">
                <div class="hero-ring"><i class="bi bi-gem text-warning"></i></div>
                <p class="text-white-50 mt-3 small">Tie The Tech — Making Weddings Happen</p>
            </div>
        </div>
    </div>
</section>

<!-- ===== MODULE CARDS ===== -->
<section class="section-spacer" id="modules">
    <div class="container">
        <div class="text-center mb-5 pb-3">
            <h2 class="section-title">System Modules</h2>
            <p class="section-sub">Each module is a fully independent component with complete CRUD operations</p>
        </div>
        <div class="row g-4">

            <!-- Component 1: Couple/User Management -->
            <div class="col-md-4">
                <div class="premium-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #4776E6, #8E54E9);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(71,118,230,0.15);">
                            <i class="bi bi-people-fill" style="color:#4776E6; font-size:1.8rem"></i>
                        </div>
                        <span class="tag-crud mb-2 d-inline-block">CREATE · READ · UPDATE · DELETE</span>
                        <h5>Component 1 — Couple/User Management</h5>
                        <p>Register couples, secure login with sessions, manage wedding profiles (date, budget, theme, guest count). OOP: Inheritance · Polymorphism · Encapsulation.</p>
                        <a href="/register" class="btn btn-card text-white mt-3" style="background:linear-gradient(135deg,#4776E6,#8E54E9)">Access Portal →</a>
                    </div>
                </div>
            </div>

            <!-- Component 2: Vendor Management -->
            <div class="col-md-4">
                <div class="premium-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #f953c6, #b91d73);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(249,83,198,0.15);">
                            <i class="bi bi-shop" style="color:#f953c6; font-size:1.8rem"></i>
                        </div>
                        <span class="tag-crud mb-2 d-inline-block">CREATE · READ · UPDATE · DELETE</span>
                        <h5>Component 2 — Vendor Management</h5>
                        <p>Register venues, photographers &amp; caterers. Filter by category. OOP: Abstraction (calculatePricing) · Inheritance (VenueVendor, PhotographyVendor, CateringVendor).</p>
                        <a href="/vendors" class="btn btn-card text-white mt-3" style="background:linear-gradient(135deg,#f953c6,#b91d73)">Browse Vendors →</a>
                    </div>
                </div>
            </div>

            <!-- Component 3: Booking & Payment -->
            <div class="col-md-4">
                <div class="premium-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #f0c040, #d4a017);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(240,192,64,0.15);">
                            <i class="bi bi-calendar-check" style="color:#f0c040; font-size:1.8rem"></i>
                        </div>
                        <span class="tag-crud mb-2 d-inline-block">CREATE · READ · UPDATE · DELETE</span>
                        <h5>Component 3 — Booking &amp; Payment</h5>
                        <p>Send booking requests, track status (PENDING → CONFIRMED), process payments. Confirming payment auto-updates booking status. OOP: Encapsulation · Abstraction.</p>
                        <a href="/bookings" class="btn btn-card mt-3" style="background:linear-gradient(135deg,#f0c040,#d4a017);color:#1a1a2e;">View Bookings →</a>
                    </div>
                </div>
            </div>

            <!-- Component 4: Wedding Planning Tools -->
            <div class="col-md-4">
                <div class="premium-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #11998e, #38ef7d);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(17,153,142,0.15);">
                            <i class="bi bi-card-checklist" style="color:#11998e; font-size:1.8rem"></i>
                        </div>
                        <span class="tag-crud mb-2 d-inline-block">CREATE · READ · UPDATE · DELETE</span>
                        <h5>Component 4 — Wedding Planning Tools</h5>
                        <p>Interactive checklist with progress tracking, budget tracker (estimated vs actual), and guest list with RSVP management. OOP: Encapsulation · Association.</p>
                        <a href="/planning/checklist" class="btn btn-card text-white mt-3" style="background:linear-gradient(135deg,#11998e,#38ef7d);color:#1a1a2e!important;">Open Planner →</a>
                    </div>
                </div>
            </div>

            <!-- Component 5: Reviews & Ratings -->
            <div class="col-md-4">
                <div class="premium-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #f7971e, #ffd200);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(247,151,30,0.15);">
                            <i class="bi bi-star" style="color:#f7971e; font-size:1.8rem"></i>
                        </div>
                        <span class="tag-crud mb-2 d-inline-block">CREATE · READ · UPDATE · DELETE</span>
                        <h5>Component 5 — Reviews &amp; Ratings</h5>
                        <p>Rate vendors 1–5 stars, write reviews, sort by rating or date. Two review types: Verified (editable) &amp; Public (final). OOP: Inheritance · Abstraction (canEdit()).</p>
                        <a href="/reviews" class="btn btn-card mt-3" style="background:linear-gradient(135deg,#f7971e,#ffd200);color:#1a1a2e;">View Reviews →</a>
                    </div>
                </div>
            </div>

            <!-- Component 6: Admin Dashboard -->
            <div class="col-md-4">
                <div class="premium-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #1a1a2e, #4776E6);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(26,26,46,0.15);">
                            <i class="bi bi-bar-chart-fill" style="color:#4776E6; font-size:1.8rem"></i>
                        </div>
                        <span class="tag-crud mb-2 d-inline-block">READ · UPDATE · DELETE</span>
                        <h5>Component 6 — Admin Dashboard</h5>
                        <p>Platform-wide analytics: total users, vendors, bookings, revenue. Manage and delete users, vendors &amp; reviews. Cross-component data aggregation. OOP: Encapsulation.</p>
                        <a href="/admin" class="btn btn-card text-white mt-3" style="background:linear-gradient(135deg,#1a1a2e,#4776E6)">Admin Panel →</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
