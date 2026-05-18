<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="en"><head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Dashboard — Tie The Tech</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box}
    body{font-family:'Outfit',sans-serif;min-height:100vh;background:linear-gradient(135deg,#1a0533,#2d1b69,#0d2137);padding:32px 20px;color:#fff}
    .nav{display:flex;justify-content:space-between;align-items:center;max-width:1100px;margin:0 auto 32px;padding:16px 24px;background:rgba(255,255,255,0.07);border-radius:16px;border:1px solid rgba(255,255,255,0.1)}
    .nav a{color:rgba(255,255,255,0.7);text-decoration:none;font-size:14px;font-weight:500}.nav .brand{color:#fff;font-weight:700;font-size:18px}
    .container{max-width:1100px;margin:0 auto}
    h1{font-size:32px;font-weight:700;margin-bottom:8px}
    .subtitle{color:rgba(255,255,255,0.5);margin-bottom:36px}
    .stats{display:grid;grid-template-columns:repeat(3,1fr);gap:20px;margin-bottom:36px}
    .stat{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.12);border-radius:20px;padding:28px;transition:transform 0.2s}
    .stat:hover{transform:translateY(-3px)}
    .stat-icon{font-size:32px;margin-bottom:12px}
    .stat-value{font-size:40px;font-weight:700;margin-bottom:4px}
    .stat-label{color:rgba(255,255,255,0.5);font-size:14px}
    .stat-link{display:block;margin-top:16px;color:#a78bfa;font-size:13px;font-weight:600;text-decoration:none}
    .stat-link:hover{color:#c4b5fd}
    .sections{display:grid;grid-template-columns:1fr 1fr;gap:24px}
    .section-card{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.12);border-radius:20px;padding:28px}
    .section-title{font-size:16px;font-weight:700;margin-bottom:20px;color:rgba(255,255,255,0.9)}
    .quick-link{display:flex;align-items:center;justify-content:space-between;padding:12px 16px;background:rgba(255,255,255,0.05);border-radius:12px;margin-bottom:10px;text-decoration:none;color:#fff;font-size:14px;transition:background 0.2s}
    .quick-link:hover{background:rgba(255,255,255,0.1)}
    .quick-link-icon{font-size:20px;margin-right:12px}
    .arrow{color:rgba(255,255,255,0.3)}
    .oop-banner{background:linear-gradient(135deg,#7c3aed,#a855f7);border-radius:20px;padding:28px;margin-bottom:36px;display:flex;justify-content:space-between;align-items:center}
    .oop-btn{background:rgba(255,255,255,0.2);border:1px solid rgba(255,255,255,0.3);color:#fff;padding:10px 22px;border-radius:10px;text-decoration:none;font-size:14px;font-weight:600}
  </style>
</head><body>
<nav class="nav"><span class="brand">💍 Tie The Tech</span>
  <div style="display:flex;gap:20px"><a href="/">Home</a><a href="/vendors">Vendors</a><a href="/bookings">Bookings</a><a href="/planning">Planning</a><a href="/reviews">Reviews</a><a href="/admin">Admin</a></div>
</nav>
<div class="container">
  <h1>📊 Admin Dashboard</h1>
  <p class="subtitle">System-wide overview across all 6 components</p>

  <div class="oop-banner">
    <div><div style="font-size:18px;font-weight:700;margin-bottom:4px">🎓 OOP Concepts Showcase</div><div style="opacity:0.8;font-size:14px">View how Abstraction, Inheritance, Polymorphism &amp; Encapsulation are implemented</div></div>
    <a href="/oop" class="oop-btn">View OOP Page →</a>
  </div>

  <div class="stats">
    <div class="stat"><div class="stat-icon">👥</div><div class="stat-value">${userCount}</div><div class="stat-label">Registered Users</div><a href="/register" class="stat-link">Manage Users →</a></div>
    <div class="stat"><div class="stat-icon">🏪</div><div class="stat-value">${vendorCount}</div><div class="stat-label">Vendors</div><a href="/vendors" class="stat-link">Manage Vendors →</a></div>
    <div class="stat"><div class="stat-icon">📅</div><div class="stat-value">${bookingCount}</div><div class="stat-label">Bookings</div><a href="/bookings" class="stat-link">Manage Bookings →</a></div>
    <div class="stat"><div class="stat-icon">💳</div><div class="stat-value">${paymentCount}</div><div class="stat-label">Payments</div><a href="/payments" class="stat-link">Manage Payments →</a></div>
    <div class="stat"><div class="stat-icon">⭐</div><div class="stat-value">${reviewCount}</div><div class="stat-label">Reviews</div><a href="/reviews" class="stat-link">Manage Reviews →</a></div>
    <div class="stat"><div class="stat-icon">✅</div><div class="stat-value">${taskCount}</div><div class="stat-label">Planning Tasks</div><a href="/planning" class="stat-link">Manage Planning →</a></div>
  </div>

  <div class="sections">
    <div class="section-card">
      <div class="section-title">⚡ Quick Actions</div>
      <a href="/vendors/new" class="quick-link"><span><span class="quick-link-icon">🏪</span>Add New Vendor</span><span class="arrow">→</span></a>
      <a href="/bookings/new" class="quick-link"><span><span class="quick-link-icon">📅</span>Create Booking</span><span class="arrow">→</span></a>
      <a href="/payments/new" class="quick-link"><span><span class="quick-link-icon">💳</span>Record Payment</span><span class="arrow">→</span></a>
      <a href="/reviews/submit" class="quick-link"><span><span class="quick-link-icon">⭐</span>Write Review</span><span class="arrow">→</span></a>
      <a href="/planning" class="quick-link"><span><span class="quick-link-icon">📋</span>Planning Tools</span><span class="arrow">→</span></a>
    </div>
    <div class="section-card">
      <div class="section-title">🔧 System Info</div>
      <div class="quick-link"><span>Architecture</span><span style="color:#86efac;font-weight:600">File-based I/O</span></div>
      <div class="quick-link"><span>Database</span><span style="color:#86efac;font-weight:600">None (java.io)</span></div>
      <div class="quick-link"><span>Framework</span><span style="color:#a78bfa;font-weight:600">Spring Boot 3.2</span></div>
      <div class="quick-link"><span>Views</span><span style="color:#a78bfa;font-weight:600">JSP + JSTL</span></div>
      <div class="quick-link"><span>Components</span><span style="color:#fbbf24;font-weight:600">6 Modules</span></div>
    </div>
  </div>
</div></body></html>
