<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="en"><head>
  <meta charset="UTF-8"><title>Vendor Detail — Tie The Tech</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700&display=swap" rel="stylesheet">
  <style>*{margin:0;padding:0;box-sizing:border-box}body{font-family:'Outfit',sans-serif;min-height:100vh;background:linear-gradient(135deg,#1a0533,#2d1b69,#0d2137);padding:32px 20px;color:#fff}.nav{display:flex;justify-content:space-between;align-items:center;max-width:800px;margin:0 auto 32px;padding:16px 24px;background:rgba(255,255,255,0.07);border-radius:16px;border:1px solid rgba(255,255,255,0.1)}.nav a{color:rgba(255,255,255,0.7);text-decoration:none;font-size:14px}.nav .brand{color:#fff;font-weight:700;font-size:18px}.card{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.15);border-radius:24px;padding:40px;max-width:800px;margin:0 auto}h2{font-size:26px;font-weight:700;margin-bottom:8px}.meta{color:rgba(255,255,255,0.5);font-size:14px;margin-bottom:24px}.stars{color:#fbbf24;font-size:22px;margin-bottom:20px}.desc{color:rgba(255,255,255,0.75);line-height:1.7;margin-bottom:28px}.actions{display:flex;gap:12px}.btn{padding:12px 24px;border:none;border-radius:10px;font-size:14px;font-weight:600;font-family:'Outfit',sans-serif;cursor:pointer;text-decoration:none;display:inline-block}.btn-primary{background:linear-gradient(135deg,#7c3aed,#a855f7);color:#fff}.btn-secondary{background:rgba(255,255,255,0.1);color:rgba(255,255,255,0.7);border:1px solid rgba(255,255,255,0.15)}</style>
</head><body>
<nav class="nav"><span class="brand">💍 Tie The Tech</span><a href="/vendors">← Back to Vendors</a></nav>
<div class="card">
  <c:if test="${not empty vendor}">
    <div style="margin-bottom:12px"><span style="background:rgba(167,139,250,0.2);border:1px solid rgba(167,139,250,0.4);color:#c4b5fd;padding:4px 14px;border-radius:20px;font-size:13px;font-weight:600">${vendor.category}</span></div>
    <h2>${vendor.businessName}</h2>
    <div class="meta">📍 ${vendor.location} &nbsp;|&nbsp; 💰 ${vendor.priceRange}</div>
    <div class="stars"><c:forEach begin="1" end="${vendor.rating}">★</c:forEach> ${vendor.rating}/5</div>
    <div class="desc">${vendor.description}</div>
    <div class="actions">
      <a href="/vendors/edit/${vendor.vendorId}" class="btn btn-primary">Edit Vendor</a>
      <a href="/vendors" class="btn btn-secondary">Back to List</a>
    </div>
  </c:if>
</div></body></html>
