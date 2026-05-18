<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="en"><head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Vendors — Tie The Tech</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box}
    body{font-family:'Outfit',sans-serif;min-height:100vh;background:linear-gradient(135deg,#1a0533,#2d1b69,#0d2137);padding:32px 20px;color:#fff}
    .nav{display:flex;justify-content:space-between;align-items:center;max-width:1100px;margin:0 auto 32px;padding:16px 24px;background:rgba(255,255,255,0.07);border-radius:16px;border:1px solid rgba(255,255,255,0.1)}
    .nav a{color:rgba(255,255,255,0.7);text-decoration:none;font-size:14px;font-weight:500;transition:color 0.2s}.nav a:hover{color:#fff}
    .brand{color:#fff;font-weight:700;font-size:18px}
    .container{max-width:1100px;margin:0 auto}
    .header{display:flex;justify-content:space-between;align-items:center;margin-bottom:24px}
    h1{font-size:28px;font-weight:700}
    .btn{padding:11px 22px;border:none;border-radius:10px;font-size:14px;font-weight:600;font-family:'Outfit',sans-serif;cursor:pointer;text-decoration:none;display:inline-block;transition:opacity 0.2s}
    .btn-primary{background:linear-gradient(135deg,#7c3aed,#a855f7);color:#fff}
    .btn-danger{background:rgba(239,68,68,0.2);border:1px solid rgba(239,68,68,0.4);color:#fca5a5}
    .btn:hover{opacity:0.85}
    .filter-bar{display:flex;gap:8px;margin-bottom:24px;flex-wrap:wrap}
    .filter-btn{padding:8px 18px;background:rgba(255,255,255,0.08);border:1px solid rgba(255,255,255,0.15);border-radius:20px;color:rgba(255,255,255,0.7);font-size:13px;cursor:pointer;text-decoration:none;transition:all 0.2s}
    .filter-btn.active,.filter-btn:hover{background:rgba(167,139,250,0.3);border-color:#a78bfa;color:#fff}
    .grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(300px,1fr));gap:20px}
    .card{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.12);border-radius:20px;padding:24px;transition:transform 0.2s,border-color 0.2s}
    .card:hover{transform:translateY(-3px);border-color:rgba(167,139,250,0.4)}
    .category-badge{display:inline-block;padding:4px 12px;border-radius:20px;font-size:12px;font-weight:600;margin-bottom:12px;text-transform:uppercase;letter-spacing:0.5px}
    .cat-venue{background:rgba(59,130,246,0.2);color:#93c5fd;border:1px solid rgba(59,130,246,0.3)}
    .cat-catering{background:rgba(34,197,94,0.2);color:#86efac;border:1px solid rgba(34,197,94,0.3)}
    .cat-photography{background:rgba(245,158,11,0.2);color:#fcd34d;border:1px solid rgba(245,158,11,0.3)}
    .vendor-name{font-size:18px;font-weight:700;margin-bottom:8px}
    .vendor-info{color:rgba(255,255,255,0.6);font-size:14px;margin-bottom:6px}
    .stars{color:#fbbf24;font-size:16px;margin-bottom:16px}
    .actions{display:flex;gap:8px;margin-top:16px}
    .empty{text-align:center;padding:80px 20px;color:rgba(255,255,255,0.4)}
    .empty h3{font-size:20px;margin-bottom:8px}
  </style>
</head><body>
<nav class="nav"><span class="brand">💍 Tie The Tech</span>
  <div style="display:flex;gap:20px">
    <a href="/">Home</a><a href="/vendors">Vendors</a><a href="/bookings">Bookings</a>
    <a href="/planning">Planning</a><a href="/reviews">Reviews</a><a href="/admin">Admin</a><a href="/profile">Profile</a>
  </div>
</nav>
<div class="container">
  <div class="header">
    <h1>🏪 Vendor Management</h1>
    <a href="/vendors/new" class="btn btn-primary">+ Add Vendor</a>
  </div>
  <div class="filter-bar">
    <a href="/vendors" class="filter-btn ${empty selectedCategory ? 'active' : ''}">All</a>
    <a href="/vendors?category=VENUE" class="filter-btn ${'VENUE' == selectedCategory ? 'active' : ''}">🏛 Venues</a>
    <a href="/vendors?category=CATERING" class="filter-btn ${'CATERING' == selectedCategory ? 'active' : ''}">🍽 Catering</a>
    <a href="/vendors?category=PHOTOGRAPHY" class="filter-btn ${'PHOTOGRAPHY' == selectedCategory ? 'active' : ''}">📸 Photography</a>
  </div>
  <c:choose>
    <c:when test="${empty vendors}">
      <div class="empty"><h3>No vendors yet</h3><p>Add your first vendor to get started</p></div>
    </c:when>
    <c:otherwise>
      <div class="grid">
        <c:forEach var="v" items="${vendors}">
          <div class="card">
            <span class="category-badge cat-${v.category.toLowerCase()}">${v.category}</span>
            <div class="vendor-name">${v.businessName}</div>
            <div class="vendor-info">📍 ${v.location}</div>
            <div class="vendor-info">💰 ${v.priceRange}</div>
            <div class="vendor-info" style="margin-bottom:12px">${v.description}</div>
            <div class="stars">
              <c:forEach begin="1" end="${v.rating > 0 ? v.rating : 0}">★</c:forEach>
              <span style="color:rgba(255,255,255,0.4);font-size:13px"> ${v.rating}/5</span>
            </div>
            <div class="actions">
              <a href="/vendors/edit/${v.vendorId}" class="btn btn-primary" style="font-size:13px;padding:8px 16px">Edit</a>
              <a href="/vendors/delete/${v.vendorId}" class="btn btn-danger" style="font-size:13px;padding:8px 16px" onclick="return confirm('Delete this vendor?')">Delete</a>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:otherwise>
  </c:choose>
</div></body></html>
