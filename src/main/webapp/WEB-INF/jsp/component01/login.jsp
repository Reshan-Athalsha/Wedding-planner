<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login — Tie The Tech</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box}
    body{font-family:'Outfit',sans-serif;min-height:100vh;background:linear-gradient(135deg,#1a0533 0%,#2d1b69 50%,#0d2137 100%);display:flex;align-items:center;justify-content:center}
    .card{background:rgba(255,255,255,0.07);backdrop-filter:blur(20px);border:1px solid rgba(255,255,255,0.15);border-radius:24px;padding:48px 40px;width:100%;max-width:420px;box-shadow:0 25px 60px rgba(0,0,0,0.4)}
    .logo{text-align:center;margin-bottom:32px}
    .logo h1{color:#fff;font-size:28px;font-weight:700;letter-spacing:-0.5px}
    .logo p{color:rgba(255,255,255,0.5);font-size:14px;margin-top:4px}
    .form-group{margin-bottom:20px}
    label{display:block;color:rgba(255,255,255,0.8);font-size:14px;margin-bottom:8px;font-weight:500}
    input{width:100%;padding:14px 16px;background:rgba(255,255,255,0.1);border:1px solid rgba(255,255,255,0.2);border-radius:12px;color:#fff;font-size:15px;font-family:'Outfit',sans-serif;outline:none;transition:border-color 0.2s}
    input:focus{border-color:#a78bfa}
    input::placeholder{color:rgba(255,255,255,0.35)}
    .btn{width:100%;padding:15px;background:linear-gradient(135deg,#7c3aed,#a855f7);border:none;border-radius:12px;color:#fff;font-size:16px;font-weight:600;font-family:'Outfit',sans-serif;cursor:pointer;transition:opacity 0.2s,transform 0.1s;margin-top:8px}
    .btn:hover{opacity:0.9;transform:translateY(-1px)}
    .alert{padding:12px 16px;border-radius:10px;margin-bottom:20px;font-size:14px}
    .alert-error{background:rgba(239,68,68,0.2);border:1px solid rgba(239,68,68,0.4);color:#fca5a5}
    .alert-success{background:rgba(34,197,94,0.2);border:1px solid rgba(34,197,94,0.4);color:#86efac}
    .footer-link{text-align:center;margin-top:24px;color:rgba(255,255,255,0.5);font-size:14px}
    .footer-link a{color:#a78bfa;text-decoration:none;font-weight:600}
  </style>
</head>
<body>
<div class="card">
  <div class="logo">
    <h1>💍 Tie The Tech</h1>
    <p>Wedding Planning System</p>
  </div>
  <c:if test="${not empty error}"><div class="alert alert-error">${error}</div></c:if>
  <c:if test="${param.registered == 'true'}"><div class="alert alert-success">Account created! Please log in.</div></c:if>
  <c:if test="${param.logout == 'true'}"><div class="alert alert-success">Logged out successfully.</div></c:if>
  <c:if test="${param.deleted == 'true'}"><div class="alert alert-success">Account deleted. Goodbye!</div></c:if>
  <form method="post" action="/login">
    <div class="form-group">
      <label>Email Address</label>
      <input type="email" name="email" id="email" placeholder="you@example.com" required>
    </div>
    <div class="form-group">
      <label>Password</label>
      <input type="password" name="password" id="password" placeholder="Your password" required>
    </div>
    <button type="submit" class="btn">Sign In</button>
  </form>
  <div class="footer-link">Don't have an account? <a href="/register">Register</a></div>
</div>
</body>
</html>
