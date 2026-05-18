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
    .stat{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.12);border-radius:20px;padding:28px}
    .stat-icon{font-size:32px;margin-bottom:12px}
    .stat-value{font-size:40px;font-weight:700;margin-bottom:4px}
    .stat-label{color:rgba(255,255,255,0.5);font-size:14px}
    .sections{display:grid;grid-template-columns:1fr 1fr;gap:24px}
    .section-card{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.12);border-radius:20px;padding:28px}
    .btn{padding:8px 16px;border:none;border-radius:8px;font-size:14px;font-weight:600;font-family:'Outfit',sans-serif;cursor:pointer;background:linear-gradient(135deg,#7c3aed,#a855f7);color:#fff;text-decoration:none}
    input{width:100%;padding:10px;background:rgba(255,255,255,0.08);border:1px solid rgba(255,255,255,0.15);border-radius:8px;color:#fff;margin-bottom:10px}
  </style>
</head><body>
<nav class="nav"><span class="brand">💍 Tie The Tech</span>
  <div style="display:flex;gap:20px"><a href="/">Home</a><a href="/vendors">Vendors</a><a href="/bookings">Bookings</a><a href="/planning">Planning</a><a href="/reviews">Reviews</a><a href="/admin">Admin</a></div>
</nav>
<div class="container">
  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:36px">
    <div><h1>📊 Admin Dashboard</h1><p class="subtitle">System-wide overview across all components</p></div>
    <a href="/admin/admins" class="btn">Manage Admins</a>
  </div>

  <div class="stats">
    <div class="stat"><div class="stat-icon">👥</div><div class="stat-value">${userCount}</div><div class="stat-label">Registered Users</div></div>
    <div class="stat"><div class="stat-icon">🏪</div><div class="stat-value">${vendorCount}</div><div class="stat-label">Vendors</div></div>
    <div class="stat"><div class="stat-icon">📅</div><div class="stat-value">${bookingCount}</div><div class="stat-label">Bookings</div></div>
    <div class="stat"><div class="stat-icon">💳</div><div class="stat-value">${paymentCount}</div><div class="stat-label">Payments</div></div>
    <div class="stat"><div class="stat-icon">⭐</div><div class="stat-value">${reviewCount}</div><div class="stat-label">Reviews</div></div>
    <div class="stat"><div class="stat-icon">✅</div><div class="stat-value">${taskCount}</div><div class="stat-label">Planning Tasks</div></div>
  </div>

  <div class="sections">
    <div class="section-card">
      <h3 style="margin-bottom:20px">📢 Post Announcement</h3>
      <form method="post" action="/admin/announcements/new">
        <input type="text" name="title" placeholder="Announcement Title" required>
        <input type="text" name="content" placeholder="Content..." required>
        <button type="submit" class="btn" style="width:100%;margin-top:10px">Post Announcement</button>
      </form>
    </div>
    <div class="section-card">
      <h3 style="margin-bottom:20px">📰 Recent Announcements</h3>
      <c:forEach var="ann" items="${announcements}">
        <div style="background:rgba(0,0,0,0.2);padding:15px;border-radius:12px;margin-bottom:10px">
          <div style="display:flex;justify-content:space-between">
            <strong>${ann.title}</strong>
            <a href="/admin/announcements/delete/${ann.id}" style="color:#ef4444;text-decoration:none;font-size:12px">Delete</a>
          </div>
          <div style="font-size:13px;color:rgba(255,255,255,0.6);margin:4px 0">${ann.date}</div>
          <div style="font-size:14px;color:rgba(255,255,255,0.9)">${ann.content}</div>
        </div>
      </c:forEach>
    </div>
  </div>
</div></body></html>
