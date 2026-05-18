<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tie The Tech — Next-Gen Wedding Coordination Suite</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Outfit', sans-serif; }
        body { background: #fafafd; color: #1a1a2e; }

        /* ---- NAVBAR ---- */
        .ttt-navbar {
            background: linear-gradient(135deg, #120b24 0%, #0d1220 100%);
            padding: 16px 0;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.15);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }
        .ttt-navbar .navbar-brand { color: #f0c040 !important; font-weight: 800; font-size: 1.4rem; letter-spacing: 0.5px; }
        .ttt-navbar .nav-link { color: rgba(255,255,255,0.75) !important; font-weight: 500; transition: color 0.2s; }
        .ttt-navbar .nav-link:hover { color: #f0c040 !important; }
        .ttt-navbar .btn-nav-login { background: #f0c040; color: #1a1a2e; font-weight: 700; border: none; border-radius: 20px; padding: 6px 22px; transition: all 0.2s ease; }
        .ttt-navbar .btn-nav-login:hover { background: #d4a017; color: #1a1a2e; transform: translateY(-1px); }

        /* ---- HERO ---- */
        .hero {
            background: linear-gradient(135deg, #120b24 0%, #0c1220 60%, #091726 100%);
            padding: 130px 0 110px;
            position: relative;
            overflow: hidden;
        }
        .hero::before {
            content: '';
            position: absolute; top: -50%; left: -50%;
            width: 200%; height: 200%;
            background: radial-gradient(circle at 30% 50%, rgba(240,192,64,0.06) 0%, transparent 50%),
                        radial-gradient(circle at 70% 30%, rgba(240,192,64,0.04) 0%, transparent 40%);
        }
        .hero h1 { color: #f0c040; font-weight: 800; font-size: 3.5rem; line-height: 1.25; letter-spacing: -0.5px; }
        .hero p { color: rgba(255,255,255,0.75); font-size: 1.15rem; line-height: 1.7; max-width: 620px; }
        .hero .badge-tag { background: rgba(240,192,64,0.12); color: #f0c040; border: 1px solid rgba(240,192,64,0.25); border-radius: 20px; padding: 6px 18px; font-size: 0.85rem; font-weight: 600; display: inline-block; margin-bottom: 22px; letter-spacing: 0.5px; text-transform: uppercase; }
        .btn-hero { background: linear-gradient(135deg, #f0c040, #d4a017); color: #1a1a2e; font-weight: 700; border: none; border-radius: 30px; padding: 16px 42px; font-size: 1rem; transition: transform 0.2s, box-shadow 0.2s; }
        .btn-hero:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(240,192,64,0.4); color: #1a1a2e; }
        .btn-hero-outline { background: transparent; color: #f0c040; font-weight: 700; border: 2px solid #f0c040; border-radius: 30px; padding: 14px 36px; font-size: 1rem; transition: all 0.2s; }
        .btn-hero-outline:hover { background: #f0c040; color: #1a1a2e; }
        .hero-ring { font-size: 5.5rem; animation: float 3s ease-in-out infinite; display: inline-block; }
        @keyframes float { 0%,100% { transform: translateY(0); } 50% { transform: translateY(-12px); } }

        /* ---- COMPONENT CARDS ---- */
        .section-title { font-weight: 800; color: #120b24; font-size: 2.25rem; letter-spacing: -0.5px; }
        .section-sub { color: #828294; font-size: 1.05rem; }
        .comp-card {
            background: white;
            border-radius: 24px;
            border: 1px solid rgba(0, 0, 0, 0.03);
            box-shadow: 0 10px 35px rgba(0,0,0,0.03);
            transition: transform 0.3s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.3s ease;
            overflow: hidden;
            height: 100%;
        }
        .comp-card:hover { transform: translateY(-6px); box-shadow: 0 20px 50px rgba(0,0,0,0.08); }
        .comp-card .card-accent { height: 6px; }
        .comp-card .card-icon { width: 60px; height: 60px; border-radius: 18px; display: flex; align-items: center; justify-content: center; font-size: 1.7rem; margin-bottom: 20px; }
        .comp-card h5 { font-weight: 700; color: #120b24; font-size: 1.2rem; margin-bottom: 12px; }
        .comp-card p { color: #626274; font-size: 0.92rem; line-height: 1.65; }
        .comp-card .btn-card { border-radius: 20px; font-weight: 600; font-size: 0.88rem; padding: 10px 24px; border: none; transition: transform 0.2s ease; }
        .comp-card .btn-card:hover { transform: translateY(-1px); }
        .tag-crud { font-size: 0.72rem; font-weight: 700; color: #828294; background: #f2f2f7; border-radius: 8px; padding: 4px 12px; letter-spacing: 0.5px; }

        /* ---- FOOTER ---- */
        .minimalist-footer {
            background: transparent;
            border-top: 1px solid rgba(0,0,0,0.05);
            padding: 40px 0;
            color: #828294;
            font-size: 0.88rem;
        }
    </style>
</head>
<body>

<!-- ===== NAVBAR ===== -->
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/"><span>💍</span> Tie The Tech</a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
            <span class="navbar-toggler-icon" style="filter:invert(1)"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNav">
            <div class="navbar-nav ms-auto align-items-center gap-2">
                <a class="nav-link active" href="/"><i class="bi bi-house me-1"></i>Home</a>
                <a class="nav-link" href="/vendors"><i class="bi bi-shop me-1"></i>Vendors</a>
                <a class="nav-link" href="/bookings"><i class="bi bi-calendar-check me-1"></i>Bookings</a>
                <a class="nav-link" href="/payments"><i class="bi bi-credit-card me-1"></i>Payments</a>
                <a class="nav-link" href="/planning/checklist"><i class="bi bi-check2-all me-1"></i>Planning</a>
                <a class="nav-link" href="/reviews"><i class="bi bi-star me-1"></i>Reviews</a>
                <a class="nav-link" href="/admin"><i class="bi bi-speedometer2 me-1"></i>Admin</a>
                <a class="nav-link" href="/oop"><i class="bi bi-code-slash me-1"></i>OOP</a>
                <% if (session.getAttribute("userId") != null) { %>
                    <a class="nav-link" href="/profile"><i class="bi bi-person-circle me-1"></i><%= session.getAttribute("userName") %></a>
                    <a href="/logout" class="btn btn-nav-login ms-2">Logout</a>
                <% } else { %>
                    <a href="/login" class="btn btn-nav-login ms-2">Login</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>

<!-- ===== HERO ===== -->
<section class="hero">
    <div class="container position-relative">
        <div class="row align-items-center">
            <div class="col-lg-7">
                <span class="badge-tag"><i class="bi bi-shield-check me-1"></i> Next-Gen Wedding Coordination Suite</span>
                <h1>Plan Your Perfect<br>Wedding with TTT</h1>
                <p class="my-4">An enterprise-grade, zero-dependency wedding planning management suite. Seamlessly choreograph vendors, bookings, schedules, and payments on a unified, high-performance architecture.</p>
                <div class="d-flex gap-3 flex-wrap">
                    <a href="/register" class="btn-hero">Get Started <i class="bi bi-arrow-right ms-1"></i></a>
                    <a href="/login" class="btn-hero-outline">Sign In</a>
                </div>
            </div>
            <div class="col-lg-5 text-center mt-5 mt-lg-0">
                <div class="hero-ring">💍</div>
                <p class="text-white-50 mt-3 small">Tie The Tech — Making Weddings Happen</p>
            </div>
        </div>
    </div>
</section>

<!-- ===== MODULE CARDS ===== -->
<section style="padding: 120px 0 100px;" id="modules">
    <div class="container">
        <div class="text-center mb-5 pb-3">
            <h2 class="section-title">System Modules</h2>
            <p class="section-sub">Each module is a fully independent component with complete CRUD operations</p>
        </div>
        <div class="row g-4">

            <!-- Component 1: Couple/User Management -->
            <div class="col-md-4">
                <div class="comp-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #4776E6, #8E54E9);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(71,118,230,0.1);">
                            <span style="color:#4776E6; font-size:1.4rem">💑</span>
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
                <div class="comp-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #f953c6, #b91d73);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(249,83,198,0.1);">
                            <span style="color:#b91d73; font-size:1.4rem">🏪</span>
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
                <div class="comp-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #f0c040, #d4a017);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(240,192,64,0.12);">
                            <span style="font-size:1.4rem">📅</span>
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
                <div class="comp-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #11998e, #38ef7d);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(17,153,142,0.1);">
                            <span style="color:#11998e; font-size:1.4rem">📋</span>
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
                <div class="comp-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #f7971e, #ffd200);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(247,151,30,0.1);">
                            <span style="color:#f7971e; font-size:1.4rem">⭐</span>
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
                <div class="comp-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #1a1a2e, #4776E6);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(26,26,46,0.08);">
                            <span style="color:#1a1a2e; font-size:1.4rem">📊</span>
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

<!-- ===== MINIMALIST FOOTER ===== -->
<footer class="minimalist-footer">
    <div class="container text-center">
        <p class="mb-0 text-muted">© 2026 TTT. All Rights Reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
