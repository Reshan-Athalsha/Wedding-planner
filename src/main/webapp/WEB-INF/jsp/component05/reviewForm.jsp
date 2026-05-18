<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Post a New Review — Tie The Tech</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Custom Outfit Font -->
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        * { font-family: 'Outfit', sans-serif; }
        body {
            background: linear-gradient(135deg, #0f0c1b 0%, #15102a 50%, #0c1824 100%);
            color: #ffffff;
            min-height: 100vh;
        }

        /* ---- UNIFIED NAVBAR ---- */
        .ttt-navbar {
            background: linear-gradient(135deg, #120b24 0%, #0d1220 100%);
            padding: 14px 0;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.4);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }
        .ttt-navbar .navbar-brand { color: #f0c040 !important; font-weight: 800; font-size: 1.3rem; letter-spacing: 0.5px; }
        .ttt-navbar .nav-link { color: rgba(255,255,255,0.75) !important; font-weight: 500; transition: color 0.2s; }
        .ttt-navbar .nav-link:hover { color: #f0c040 !important; }
        .ttt-navbar .btn-nav-login { background: #f0c040; color: #1a1a2e; font-weight: 700; border: none; border-radius: 20px; padding: 6px 20px; }
        .ttt-navbar .btn-nav-login:hover { background: #d4a017; color: #1a1a2e; }

        /* ---- GLASS FORM CARD ---- */
        .glass-card {
            background: rgba(255, 255, 255, 0.04);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 28px;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.3);
            max-width: 750px;
            margin: 0 auto;
        }
        
        .form-label {
            font-size: 0.82rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 8px;
        }
        
        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            color: #ffffff;
            padding: 12px 16px;
            font-size: 0.95rem;
            transition: all 0.2s ease;
        }
        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: #a78bfa;
            box-shadow: 0 0 0 4px rgba(167, 139, 250, 0.15);
            color: #ffffff;
        }
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.35);
        }
        .form-select option {
            background: #15102a;
            color: #ffffff;
        }

        .btn-premium-primary {
            background: linear-gradient(135deg, #7c3aed 0%, #a855f7 100%);
            color: #fff;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.2s ease;
        }
        .btn-premium-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(124, 58, 237, 0.3);
            color: #fff;
        }
        .btn-premium-secondary {
            background: rgba(255, 255, 255, 0.06);
            color: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.2s ease;
        }
        .btn-premium-secondary:hover {
            background: rgba(255, 255, 255, 0.12);
            color: #fff;
        }
        
        .section-header-badge {
            background: rgba(124, 58, 237, 0.15);
            color: #a78bfa;
            border: 1px solid rgba(124, 58, 237, 0.3);
            border-radius: 20px;
            padding: 6px 16px;
            font-size: 0.85rem;
            font-weight: 600;
            display: inline-block;
        }
    </style>
</head>
<body>

<!-- ===== NAVBAR (Unified) ===== -->
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/"><span>💍</span> Tie The Tech</a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
            <span class="navbar-toggler-icon" style="filter:invert(1)"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNav">
            <div class="navbar-nav ms-auto align-items-center gap-2">
                <a class="nav-link" href="/"><i class="bi bi-house me-1"></i>Home</a>
                <a class="nav-link" href="/vendors"><i class="bi bi-shop me-1"></i>Vendors</a>
                <a class="nav-link" href="/bookings"><i class="bi bi-calendar-check me-1"></i>Bookings</a>
                <a class="nav-link" href="/payments"><i class="bi bi-credit-card me-1"></i>Payments</a>
                <a class="nav-link" href="/planning"><i class="bi bi-check2-all me-1"></i>Planning</a>
                <a class="nav-link active" href="/reviews"><i class="bi bi-star me-1"></i>Reviews</a>
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

<div class="container py-5">
    <div class="text-center mb-4">
        <a href="/reviews" class="btn btn-premium-secondary btn-sm px-3 rounded-pill mb-3"><i class="bi bi-arrow-left me-1"></i> Back to Reviews</a>
    </div>

    <!-- ===== FORM CARD ===== -->
    <div class="glass-card p-5 shadow">
        <div class="text-center mb-4">
            <span class="section-header-badge mb-2"><i class="bi bi-star-fill me-1"></i> Submitting Feedback</span>
            <h2 class="fw-bold text-white mb-2">Write a New Review</h2>
            <p class="text-white-50 small" style="max-width: 500px; margin: 0 auto;">Your reviews help the community find trusted wedding services and encourage high quality standards.</p>
        </div>

        <form method="post" action="/reviews/submit" class="needs-validation" novalidate>
            <!-- Reviewer & Vendor Inputs -->
            <div class="row mb-4">
                <div class="col-md-6 form-group">
                    <label class="form-label" for="reviewerName">Your Name</label>
                    <div class="input-group">
                        <span class="input-group-text bg-transparent border-end-0 text-white-50" style="border-color: rgba(255,255,255,0.15); border-top-left-radius: 12px; border-bottom-left-radius: 12px;"><i class="bi bi-person"></i></span>
                        <input type="text" id="reviewerName" name="reviewerName" class="form-control border-start-0 ps-0" placeholder="e.g. Jane Doe" style="border-top-right-radius: 12px; border-bottom-right-radius: 12px;" required>
                    </div>
                </div>
                <div class="col-md-6 form-group">
                    <label class="form-label" for="vendorName">Vendor Name</label>
                    <div class="input-group">
                        <span class="input-group-text bg-transparent border-end-0 text-white-50" style="border-color: rgba(255,255,255,0.15); border-top-left-radius: 12px; border-bottom-left-radius: 12px;"><i class="bi bi-shop"></i></span>
                        <input type="text" id="vendorName" name="vendorName" class="form-control border-start-0 ps-0" placeholder="e.g. Royal Banquet Hall" style="border-top-right-radius: 12px; border-bottom-right-radius: 12px;" required>
                    </div>
                </div>
            </div>

            <!-- Rating & Type Fields -->
            <div class="row mb-4">
                <div class="col-md-6 form-group">
                    <label class="form-label" for="rating">Rating (1 to 5 Stars)</label>
                    <select id="rating" name="rating" class="form-select" required>
                        <option value="5" selected>★★★★★ (5 Stars - Perfect!)</option>
                        <option value="4">★★★★☆ (4 Stars - Great Service)</option>
                        <option value="3">★★★☆☆ (3 Stars - Satisfactory)</option>
                        <option value="2">★★☆☆☆ (2 Stars - Needs Improvement)</option>
                        <option value="1">★☆☆☆☆ (1 Star - Poor Experience)</option>
                    </select>
                </div>
                <div class="col-md-6 form-group">
                    <label class="form-label" for="reviewType">Review Verification Type</label>
                    <select id="reviewType" name="reviewType" class="form-select" required>
                        <option value="VERIFIED">Verified (Couples who booked through TTT - Editable)</option>
                        <option value="PUBLIC">Public Review (General feedback - Final/Cannot edit)</option>
                    </select>
                </div>
            </div>

            <!-- Comments Text Area -->
            <div class="form-group mb-5">
                <label class="form-label" for="comment">Your Written Feedback</label>
                <textarea id="comment" name="comment" class="form-control" rows="4" placeholder="Detail your experience with this vendor, from setup to final delivery..." required></textarea>
            </div>

            <!-- Actions -->
            <div class="d-flex justify-content-end gap-3 border-top border-secondary-subtle pt-4">
                <a href="/reviews" class="btn btn-premium-secondary px-4 py-3"><i class="bi bi-x-circle me-2"></i>Cancel</a>
                <button type="submit" class="btn btn-premium-primary px-5 py-3"><i class="bi bi-send-fill me-2"></i>Submit Feedback</button>
            </div>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="py-4 mt-5 text-center border-top border-secondary-subtle" style="background: rgba(0,0,0,0.2);">
    <div class="container text-white-50 small">
        <p class="mb-1">© 2026 <strong style="color: #f0c040;">Tie The Tech (TTT)</strong> — Object Oriented Programming Project</p>
        <p class="mb-0">Built with Spring Boot · custom File Persistence (`java.io`) · Bootstrap 5</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
