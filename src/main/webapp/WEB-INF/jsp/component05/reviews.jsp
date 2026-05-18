<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Reviews & Ratings — Tie The Tech</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Custom Outfit Font -->
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap');
        
        * { font-family: 'Outfit', sans-serif; }
        body {
            background: #fafafd;
            color: #1a1a2e;
            min-height: 100vh;
        }

        /* ---- UNIFIED NAVBAR ---- */
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

        /* ---- CLEAN SHADOW CARDS ---- */
        .review-card {
            background: white;
            border-radius: 24px;
            border: 1px solid rgba(0, 0, 0, 0.03);
            box-shadow: 0 10px 35px rgba(0,0,0,0.03);
            transition: transform 0.3s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.3s ease;
            overflow: hidden;
            height: 100%;
        }
        .review-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 50px rgba(0,0,0,0.07);
        }
        
        .section-header-badge {
            background: rgba(124, 58, 237, 0.06);
            color: #7c3aed;
            border: 1px solid rgba(124, 58, 237, 0.15);
            border-radius: 20px;
            padding: 6px 18px;
            font-size: 0.85rem;
            font-weight: 600;
            display: inline-block;
        }

        .rating-summary-box {
            background: white;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 24px;
            padding: 24px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.02);
        }

        /* ---- BADGES & STARS ---- */
        .badge-verified {
            background: rgba(16, 185, 129, 0.08);
            color: #059669;
            border: 1px solid rgba(16, 185, 129, 0.15);
            border-radius: 8px;
            font-size: 0.75rem;
            font-weight: 600;
            padding: 4px 12px;
        }
        .badge-public {
            background: rgba(59, 130, 246, 0.08);
            color: #2563eb;
            border: 1px solid rgba(59, 130, 246, 0.15);
            border-radius: 8px;
            font-size: 0.75rem;
            font-weight: 600;
            padding: 4px 12px;
        }
        .stars-gold {
            color: #fbbf24;
            font-size: 1.1rem;
        }
        .stars-empty {
            color: rgba(0, 0, 0, 0.1);
            font-size: 1.1rem;
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
            box-shadow: 0 6px 20px rgba(124, 58, 237, 0.25);
            color: #fff;
        }
        .btn-premium-secondary {
            background: #ffffff;
            color: #4b5563;
            border: 1px solid rgba(0, 0, 0, 0.08);
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.2s ease;
            box-shadow: 0 2px 8px rgba(0,0,0,0.02);
        }
        .btn-premium-secondary:hover {
            background: #f9fafb;
            color: #1f2937;
        }

        .btn-premium-action {
            background: #f3f4f6;
            border: 1px solid rgba(0, 0, 0, 0.05);
            color: #4b5563;
            border-radius: 10px;
            padding: 6px 12px;
            font-size: 0.8rem;
            font-weight: 600;
            transition: all 0.2s ease;
        }
        .btn-premium-action:hover {
            background: #e5e7eb;
            color: #1f2937;
        }
        .btn-premium-danger {
            background: rgba(239, 68, 68, 0.08);
            border: 1px solid rgba(239, 68, 68, 0.15);
            color: #dc2626;
            border-radius: 10px;
            padding: 6px 12px;
            font-size: 0.8rem;
            font-weight: 600;
            transition: all 0.2s ease;
        }
        .btn-premium-danger:hover {
            background: rgba(239, 68, 68, 0.15);
            color: #b91c1c;
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

<div class="container py-5 mt-4">
    
    <!-- Action Warning Status Notifications -->
    <c:if test="${param.error == 'unauthorized'}">
        <div class="alert alert-danger d-flex align-items-center border-0 rounded-4 p-3 mb-4 shadow-sm" style="background: rgba(239, 68, 68, 0.08); color: #c53030;">
            <i class="bi bi-exclamation-triangle-fill fs-4 me-3"></i>
            <div>
                <strong>Action Denied:</strong> Public reviews are <strong>final</strong> and cannot be modified. Only Verified reviews can be edited.
            </div>
        </div>
    </c:if>

    <!-- ===== HEADER ===== -->
    <div class="row align-items-center mb-5 pb-3 g-4">
        <div class="col-md-7">
            <span class="section-header-badge mb-3"><i class="bi bi-award-fill me-1"></i> Ratings & Reviews Suite</span>
            <h1 class="display-6 fw-bold mb-2" style="color: #120b24;">Vendor Reviews & Ratings</h1>
            <p class="text-secondary">Read verified experiences from real couples, and rate your favorite wedding vendors.</p>
        </div>
        <div class="col-md-5 d-flex justify-content-md-end gap-3 align-items-center">
            <c:choose>
                <c:when test="${sort == 'rating'}">
                    <a href="/reviews" class="btn btn-premium-secondary px-4 py-3"><i class="bi bi-sort-numeric-down me-2"></i>Default Order</a>
                </c:when>
                <c:otherwise>
                    <a href="/reviews?sort=rating" class="btn btn-premium-secondary px-4 py-3"><i class="bi bi-star-fill me-2" style="color: #fbbf24;"></i>Sort by Rating</a>
                </c:otherwise>
            </c:choose>
            <a href="/reviews/submit" class="btn btn-premium-primary px-4 py-3"><i class="bi bi-plus-circle me-2"></i>Write a Review</a>
        </div>
    </div>

    <!-- ===== STATS SUMMARY ===== -->
    <c:if test="${not empty reviews}">
        <div class="row mb-5 pb-2">
            <div class="col-lg-4 col-md-6 mx-auto">
                <div class="rating-summary-box text-center">
                    <span class="text-uppercase tracking-wider text-muted small d-block mb-1 fw-600">Average Platform Rating</span>
                    <h2 class="display-5 fw-bold mb-0 text-dark">${avgRating} <span style="font-size: 1.3rem;" class="text-muted">/ 5</span></h2>
                    <div class="my-2">
                        <c:forEach begin="1" end="${avgRating.intValue()}"><span class="stars-gold">★</span></c:forEach><c:forEach begin="${avgRating.intValue() + 1}" end="5"><span class="stars-empty">☆</span></c:forEach>
                    </div>
                    <span class="text-muted small">${reviews.size()} registered reviews in total</span>
                </div>
            </div>
        </div>
    </c:if>

    <!-- ===== REVIEWS GRID ===== -->
    <c:choose>
        <c:when test="${empty reviews}">
            <div class="review-card text-center py-5 px-4 my-4">
                <div style="font-size: 3.5rem;" class="mb-3 text-warning">⭐</div>
                <h3 class="fw-bold text-dark mb-2">No Reviews Posted Yet</h3>
                <p class="text-muted mx-auto" style="max-width: 450px;">Be the first to share your experience! Click the "Write a Review" button above to submit feedback for a vendor.</p>
                <a href="/reviews/submit" class="btn btn-premium-primary px-4 py-2 mt-3">Post First Review</a>
            </div>
        </c:when>
        
        <c:otherwise>
            <div class="row g-4">
                <c:forEach var="r" items="${reviews}">
                    <div class="col-md-6 col-lg-4">
                        <div class="review-card h-100 p-4 d-flex flex-column justify-content-between">
                            <div>
                                <!-- Card Header -->
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <div>
                                        <h5 class="fw-bold mb-1" style="color: #120b24;"><i class="bi bi-person-fill text-muted me-1"></i>${r.userName}</h5>
                                        <span class="text-muted small d-block">Reviewed: <strong class="text-dark">${r.vendorId}</strong></span>
                                    </div>
                                    <div class="d-flex gap-2">
                                        <!-- Edit button ONLY displays if the review type allows it (canEdit() == true) -->
                                        <c:if test="${r.canEdit()}">
                                            <a href="/reviews/edit/${r.reviewId}" class="btn-premium-action" title="Edit Review"><i class="bi bi-pencil-square"></i></a>
                                        </c:if>
                                        <a href="/reviews/delete/${r.reviewId}" class="btn-premium-danger" title="Delete Review" onclick="return confirm('Are you sure you want to delete this review?')"><i class="bi bi-trash3-fill"></i></a>
                                    </div>
                                </div>

                                <!-- Stars -->
                                <div class="mb-3 d-flex align-items-center gap-1">
                                    <div>
                                        <c:forEach begin="1" end="${r.rating}"><span class="stars-gold">★</span></c:forEach><c:forEach begin="${r.rating + 1}" end="5"><span class="stars-empty">☆</span></c:forEach>
                                    </div>
                                    <span class="text-secondary ms-2 small">(${r.rating}/5)</span>
                                </div>

                                <!-- Review Comment -->
                                <p class="card-text text-secondary small" style="line-height: 1.7; min-height: 60px;">"${r.comment}"</p>
                            </div>

                            <!-- Footer -->
                            <div class="border-top border-light pt-3 mt-3 d-flex justify-content-between align-items-center">
                                <c:choose>
                                    <c:when test="${r.reviewType == 'VERIFIED'}">
                                        <span class="badge-verified"><i class="bi bi-patch-check-fill me-1"></i>Verified Couple</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge-public"><i class="bi bi-globe me-1"></i>Public Review</span>
                                    </c:otherwise>
                                </c:choose>
                                <span class="text-muted small" style="font-size: 0.75rem;"><i class="bi bi-calendar-event me-1"></i>${r.reviewDate}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<!-- Minimalist Footer -->
<footer class="py-4 mt-5 text-center border-top border-light">
    <div class="container text-muted small">
        <p class="mb-0">© 2026 TTT. All Rights Reserved.</p>
    </div>
</footer>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
