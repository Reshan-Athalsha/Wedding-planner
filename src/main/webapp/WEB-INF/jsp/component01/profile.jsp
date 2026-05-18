<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>My Profile — Tie The Tech</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box}
    body{font-family:'Outfit',sans-serif;min-height:100vh;background:linear-gradient(135deg,#1a0533 0%,#2d1b69 50%,#0d2137 100%);padding:40px 20px}
    .nav{display:flex;justify-content:space-between;align-items:center;max-width:900px;margin:0 auto 32px;padding:16px 24px;background:rgba(255,255,255,0.07);border-radius:16px;border:1px solid rgba(255,255,255,0.1)}
    .nav a{color:rgba(255,255,255,0.7);text-decoration:none;font-size:14px;font-weight:500}
    .nav a:hover{color:#fff}
    .nav .brand{color:#fff;font-weight:700;font-size:18px}
    .container{max-width:700px;margin:0 auto}
    .card{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.15);border-radius:24px;padding:40px;margin-bottom:24px}
    h2{color:#fff;font-size:24px;margin-bottom:24px;font-weight:700}
    .form-row{display:grid;grid-template-columns:1fr 1fr;gap:16px}
    .form-group{margin-bottom:20px}
    label{display:block;color:rgba(255,255,255,0.7);font-size:13px;margin-bottom:8px;font-weight:500;text-transform:uppercase;letter-spacing:0.5px}
    input,select{width:100%;padding:13px 16px;background:rgba(255,255,255,0.08);border:1px solid rgba(255,255,255,0.15);border-radius:12px;color:#fff;font-size:14px;font-family:'Outfit',sans-serif;outline:none}
    input:focus{border-color:#a78bfa}
    .btn{padding:13px 28px;border:none;border-radius:12px;font-size:15px;font-weight:600;font-family:'Outfit',sans-serif;cursor:pointer;transition:opacity 0.2s}
    .btn-primary{background:linear-gradient(135deg,#7c3aed,#a855f7);color:#fff}
    .btn-danger{background:rgba(239,68,68,0.2);border:1px solid rgba(239,68,68,0.4);color:#fca5a5}
    .btn:hover{opacity:0.85}
    .alert{padding:12px 16px;border-radius:10px;margin-bottom:20px;font-size:14px}
    .alert-success{background:rgba(34,197,94,0.2);border:1px solid rgba(34,197,94,0.4);color:#86efac}
    .info-badge{display:inline-block;padding:4px 12px;background:rgba(167,139,250,0.2);border:1px solid rgba(167,139,250,0.4);border-radius:20px;color:#c4b5fd;font-size:13px}
    .actions{display:flex;gap:12px;margin-top:8px}
  </style>
</head>
<body>
<nav class="nav">
  <span class="brand">💍 Tie The Tech</span>
  <div style="display:flex;gap:20px">
    <a href="/">Home</a><a href="/vendors">Vendors</a><a href="/bookings">Bookings</a>
    <a href="/planning">Planning</a><a href="/reviews">Reviews</a><a href="/admin">Admin</a>
    <a href="/logout">Logout</a>
  </div>
</nav>
<div class="container">
  <c:if test="${not empty success}"><div class="alert alert-success">${success}</div></c:if>
  <div class="card">
    <h2>👤 My Profile</h2>
    <c:if test="${not empty coupleUser}">
      <p style="color:rgba(255,255,255,0.5);margin-bottom:24px;font-size:14px">
        ID: <span class="info-badge">${coupleUser.userId}</span> &nbsp;
        Role: <span class="info-badge">${coupleUser.role}</span>
      </p>
      <form method="post" action="/profile/update">
        <div class="form-row">
          <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="name" value="${coupleUser.name}" required>
          </div>
          <div class="form-group">
            <label>New Password (leave blank to keep)</label>
            <input type="password" name="password" placeholder="••••••••">
          </div>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label>Wedding Date</label>
            <input type="date" name="weddingDate" value="${coupleUser.weddingDate}">
          </div>
          <div class="form-group">
            <label>Budget (LKR)</label>
            <input type="number" name="budget" value="${coupleUser.budget}" step="1000">
          </div>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label>Guest Count</label>
            <input type="number" name="guestCount" value="${coupleUser.guestCount}">
          </div>
          <div class="form-group">
            <label>Wedding Theme</label>
            <input type="text" name="theme" value="${coupleUser.theme}" placeholder="e.g. Rustic, Garden">
          </div>
        </div>
        <div class="actions">
          <button type="submit" class="btn btn-primary">Save Changes</button>
        </div>
      </form>
      <hr style="border-color:rgba(255,255,255,0.1);margin:32px 0">
      <form method="post" action="/profile/delete" onsubmit="return confirm('Delete your account permanently?')">
        <button type="submit" class="btn btn-danger">Delete Account</button>
      </form>
    </c:if>
  </div>
</div>
</body>
</html>
