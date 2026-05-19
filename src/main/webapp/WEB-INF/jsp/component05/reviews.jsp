<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<style>

    .rating-summary-box {
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 24px;
        padding: 24px;
        box-shadow: 0 10px 35px rgba(0,0,0,0.2);
    }
    .badge-verified {
        background: rgba(16, 185, 129, 0.15);
        color: #34d399;
        border: 1px solid rgba(16, 185, 129, 0.3);
        border-radius: 8px;
        font-size: 0.75rem;
        font-weight: 600;
        padding: 4px 12px;
    }
    .badge-public {
        background: rgba(59, 130, 246, 0.15);
        color: #60a5fa;
        border: 1px solid rgba(59, 130, 246, 0.3);
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
        color: rgba(255, 255, 255, 0.15);
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
        background: rgba(255, 255, 255, 0.06);
        color: rgba(255, 255, 255, 0.8);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 12px;
        font-weight: 600;
        transition: all 0.2s ease;
        box-shadow: 0 2px 8px rgba(0,0,0,0.02);
    }
    .btn-premium-secondary:hover {
        background: rgba(255, 255, 255, 0.12);
        color: #fff;
    }
    .btn-premium-action {
        background: rgba(255, 255, 255, 0.06);
        border: 1px solid rgba(255, 255, 255, 0.1);
        color: rgba(255, 255, 255, 0.8);
        border-radius: 10px;
        padding: 6px 12px;
        font-size: 0.8rem;
        font-weight: 600;
        transition: all 0.2s ease;
    }
    .btn-premium-action:hover {
        background: rgba(255, 255, 255, 0.15);
        color: #fff;
    }
    .btn-premium-danger {
        background: rgba(239, 68, 68, 0.1);
        border: 1px solid rgba(239, 68, 68, 0.2);
        color: #fca5a5;
        border-radius: 10px;
        padding: 6px 12px;
        font-size: 0.8rem;
        font-weight: 600;
        transition: all 0.2s ease;
    }
    .btn-premium-danger:hover {
        background: rgba(239, 68, 68, 0.25);
        color: #fff;
    }
    .section-header-badge {
        background: rgba(124, 58, 237, 0.15);
        color: #a78bfa;
        border: 1px solid rgba(124, 58, 237, 0.3);
        border-radius: 20px;
        padding: 6px 18px;
        font-size: 0.85rem;
        font-weight: 600;
        display: inline-block;
    }
</style>

<div class="container py-5 mt-4">


    <c:if test="${param.error == 'unauthorized'}">
        <div class="alert alert-danger d-flex align-items-center border-0 rounded-4 p-3 mb-4 shadow-sm" style="background: rgba(239, 68, 68, 0.15); color: #fca5a5;">
            <i class="bi bi-exclamation-triangle-fill fs-4 me-3"></i>
            <div>
                <strong>Action Denied:</strong> Public reviews are <strong>final</strong> and cannot be modified. Only Verified reviews can be edited.
            </div>
        </div>
    </c:if>


    <div class="row align-items-center mb-5 pb-3 g-4">
        <div class="col-md-7">
            <span class="section-header-badge mb-3"><i class="bi bi-award-fill me-1"></i> Ratings & Reviews Suite</span>
            <h1 class="display-6 fw-bold mb-2">Vendor Reviews & Ratings</h1>
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


    <c:if test="${not empty reviews}">
        <div class="row mb-5 pb-2">
            <div class="col-lg-4 col-md-6 mx-auto">
                <div class="rating-summary-box text-center">
                    <span class="text-uppercase tracking-wider text-muted small d-block mb-1 fw-600">Average Platform Rating</span>
                    <h2 class="display-5 fw-bold mb-0 text-white">${avgRating} <span style="font-size: 1.3rem;" class="text-muted">/ 5</span></h2>
                    <div class="my-2">
                        <c:forEach begin="1" end="${avgRating.intValue()}"><span class="stars-gold">★</span></c:forEach><c:forEach begin="${avgRating.intValue() + 1}" end="5"><span class="stars-empty">☆</span></c:forEach>
                    </div>
                    <span class="text-muted small">${reviews.size()} registered reviews in total</span>
                </div>
            </div>
        </div>
    </c:if>


    <c:choose>
        <c:when test="${empty reviews}">
            <div class="premium-card text-center py-5 px-4 my-4">
                <div style="font-size: 3.5rem;" class="mb-3 text-warning"><i class="bi bi-star-fill text-warning"></i></div>
                <h3 class="fw-bold text-white mb-2">No Reviews Posted Yet</h3>
                <p class="text-muted mx-auto" style="max-width: 450px;">Be the first to share your experience! Click the "Write a Review" button above to submit feedback for a vendor.</p>
                <a href="/reviews/submit" class="btn btn-premium-primary px-4 py-2 mt-3">Post First Review</a>
            </div>
        </c:when>

        <c:otherwise>
            <div class="row g-4">
                <c:forEach var="r" items="${reviews}">
                    <div class="col-md-6 col-lg-4">
                        <div class="premium-card h-100 p-4 d-flex flex-column justify-content-between">
                            <div>

                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <div>
                                        <h5 class="fw-bold mb-1"><i class="bi bi-person-fill text-muted me-1"></i>${r.userName}</h5>
                                        <span class="text-muted small d-block">Reviewed: <strong class="text-white">${r.vendorId}</strong></span>
                                    </div>
                                    <div class="d-flex gap-2">

                                        <c:if test="${r.canEdit()}">
                                            <a href="/reviews/edit/${r.reviewId}" class="btn-premium-action" title="Edit Review"><i class="bi bi-pencil-square"></i></a>
                                        </c:if>
                                        <a href="/reviews/delete/${r.reviewId}" class="btn-premium-danger" title="Delete Review" onclick="return confirm('Are you sure you want to delete this review?')"><i class="bi bi-trash3-fill"></i></a>
                                    </div>
                                </div>


                                <div class="mb-3 d-flex align-items-center gap-1">
                                    <div>
                                        <c:forEach begin="1" end="${r.rating}"><span class="stars-gold">★</span></c:forEach><c:forEach begin="${r.rating + 1}" end="5"><span class="stars-empty">☆</span></c:forEach>
                                    </div>
                                    <span class="text-secondary ms-2 small">(${r.rating}/5)</span>
                                </div>


                                <p class="card-text text-secondary small" style="line-height: 1.7; min-height: 60px;">"${r.comment}"</p>
                            </div>


                            <div class="border-top border-secondary pt-3 mt-3 d-flex justify-content-between align-items-center">
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

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
