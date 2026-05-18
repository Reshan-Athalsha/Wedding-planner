<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="en"><head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Reviews — Tie The Tech</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box}
    body{font-family:'Outfit',sans-serif;min-height:100vh;background:linear-gradient(135deg,#1a0533,#2d1b69,#0d2137);padding:32px 20px;color:#fff}
    .nav{display:flex;justify-content:space-between;align-items:center;max-width:1100px;margin:0 auto 32px;padding:16px 24px;background:rgba(255,255,255,0.07);border-radius:16px;border:1px solid rgba(255,255,255,0.1)}
    .nav a{color:rgba(255,255,255,0.7);text-decoration:none;font-size:14px;font-weight:500}.nav .brand{color:#fff;font-weight:700;font-size:18px}
    .container{max-width:1100px;margin:0 auto}
    .header{display:flex;justify-content:space-between;align-items:center;margin-bottom:24px}
    h1{font-size:28px;font-weight:700}
    .btn{padding:11px 22px;border:none;border-radius:10px;font-size:14px;font-weight:600;font-family:'Outfit',sans-serif;cursor:pointer;text-decoration:none;display:inline-block}
    .btn-primary{background:linear-gradient(135deg,#7c3aed,#a855f7);color:#fff}
    .btn-secondary{background:rgba(255,255,255,0.1);color:rgba(255,255,255,0.7);border:1px solid rgba(255,255,255,0.15)}
    .btn-danger{background:rgba(239,68,68,0.2);border:1px solid rgba(239,68,68,0.4);color:#fca5a5}
    .grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(320px,1fr));gap:20px}
    .card{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.12);border-radius:20px;padding:24px;transition:transform 0.2s}
    .card:hover{transform:translateY(-3px)}
    .review-header{display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:12px}
    .reviewer{font-size:15px;font-weight:700}
    .vendor-name{color:rgba(255,255,255,0.5);font-size:13px;margin-top:2px}
    .stars{color:#fbbf24;font-size:18px;margin-bottom:12px}
    .comment{color:rgba(255,255,255,0.7);font-size:14px;line-height:1.6}
    .badge{display:inline-block;padding:3px 10px;border-radius:20px;font-size:11px;font-weight:600;margin-top:12px}
    .badge-verified{background:rgba(34,197,94,0.2);color:#86efac;border:1px solid rgba(34,197,94,0.3)}
    .badge-public{background:rgba(59,130,246,0.2);color:#93c5fd;border:1px solid rgba(59,130,246,0.3)}
    .empty{text-align:center;padding:80px 20px;color:rgba(255,255,255,0.4)}
  </style>
</head><body>
<nav class="nav"><span class="brand">💍 Tie The Tech</span>
  <div style="display:flex;gap:20px"><a href="/">Home</a><a href="/vendors">Vendors</a><a href="/bookings">Bookings</a><a href="/planning">Planning</a><a href="/reviews">Reviews</a><a href="/admin">Admin</a></div>
</nav>
<div class="container">
  <div class="header">
    <div>
      <h1>⭐ Reviews &amp; Ratings</h1>
      <c:if test="${not empty reviews}">
        <p style="color:rgba(255,255,255,0.5);font-size:14px;margin-top:6px">
          Average Rating: <strong style="color:#fbbf24">${avgRating} / 5</strong> &nbsp;·&nbsp; ${reviews.size()} review(s)
        </p>
      </c:if>
    </div>
    <div style="display:flex;gap:10px;align-items:center">
      <c:choose>
        <c:when test="${sort == 'rating'}">
          <a href="/reviews" class="btn btn-secondary">Default Order</a>
        </c:when>
        <c:otherwise>
          <a href="/reviews?sort=rating" class="btn btn-secondary">↓ Sort by Rating</a>
        </c:otherwise>
      </c:choose>
      <a href="/reviews/submit" class="btn btn-primary">+ Write Review</a>
    </div>
  </div>
  <c:choose>
    <c:when test="${empty reviews}"><div class="empty"><h3>No reviews yet</h3><p>Be the first to review a vendor!</p></div></c:when>
    <c:otherwise>
      <div class="grid">
        <c:forEach var="r" items="${reviews}">
          <div class="card">
            <div class="review-header">
              <div><div class="reviewer">${r.userName}</div><div class="vendor-name">→ ${r.vendorId}</div></div>
              <div style="display:flex;gap:6px;">
                <a href="/reviews/edit/${r.reviewId}" class="btn btn-secondary" style="font-size:12px;padding:5px 10px">✎ Edit</a>
                <a href="/reviews/delete/${r.reviewId}" class="btn btn-danger" style="font-size:12px;padding:5px 10px" onclick="return confirm('Delete?')">✕</a>
              </div>
            </div>
            <div class="stars">
              <c:forEach begin="1" end="${r.rating}">★</c:forEach><c:forEach begin="${r.rating + 1}" end="5">☆</c:forEach>
              <span style="color:rgba(255,255,255,0.5);font-size:13px"> ${r.rating}/5</span>
            </div>
            <div class="comment">${r.comment}</div>
            <div style="display:flex;justify-content:space-between;align-items:center;margin-top:12px">
              <span class="badge badge-${r.reviewType.toLowerCase()}">${r.reviewType}</span>
              <span style="color:rgba(255,255,255,0.35);font-size:11px">${r.reviewDate}</span>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:otherwise>
  </c:choose>
</div></body></html>
