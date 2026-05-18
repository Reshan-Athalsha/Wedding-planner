<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="en"><head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bookings — Tie The Tech</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box}
    body{font-family:'Outfit',sans-serif;min-height:100vh;background:linear-gradient(135deg,#1a0533,#2d1b69,#0d2137);padding:32px 20px;color:#fff}
    .nav{display:flex;justify-content:space-between;align-items:center;max-width:1100px;margin:0 auto 32px;padding:16px 24px;background:rgba(255,255,255,0.07);border-radius:16px;border:1px solid rgba(255,255,255,0.1)}
    .nav a{color:rgba(255,255,255,0.7);text-decoration:none;font-size:14px;font-weight:500}.nav .brand{color:#fff;font-weight:700;font-size:18px}
    .container{max-width:1100px;margin:0 auto}
    .header{display:flex;justify-content:space-between;align-items:center;margin-bottom:24px}
    h1{font-size:28px;font-weight:700}
    .btn{padding:11px 22px;border:none;border-radius:10px;font-size:14px;font-weight:600;font-family:'Outfit',sans-serif;cursor:pointer;text-decoration:none;display:inline-block;transition:opacity 0.2s}
    .btn-primary{background:linear-gradient(135deg,#7c3aed,#a855f7);color:#fff}
    .btn-danger{background:rgba(239,68,68,0.2);border:1px solid rgba(239,68,68,0.4);color:#fca5a5}
    .btn:hover{opacity:0.85}
    table{width:100%;border-collapse:collapse;background:rgba(255,255,255,0.05);border-radius:16px;overflow:hidden;border:1px solid rgba(255,255,255,0.1)}
    th{background:rgba(255,255,255,0.08);padding:14px 16px;text-align:left;font-size:12px;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;color:rgba(255,255,255,0.6)}
    td{padding:14px 16px;border-top:1px solid rgba(255,255,255,0.06);font-size:14px;color:rgba(255,255,255,0.85)}
    tr:hover td{background:rgba(255,255,255,0.04)}
    .badge{display:inline-block;padding:4px 10px;border-radius:20px;font-size:12px;font-weight:600}
    .badge-confirmed{background:rgba(34,197,94,0.2);color:#86efac;border:1px solid rgba(34,197,94,0.3)}
    .badge-pending{background:rgba(245,158,11,0.2);color:#fcd34d;border:1px solid rgba(245,158,11,0.3)}
    .badge-cancelled{background:rgba(239,68,68,0.2);color:#fca5a5;border:1px solid rgba(239,68,68,0.3)}
    .empty{text-align:center;padding:60px;color:rgba(255,255,255,0.4)}
  </style>
</head><body>
<nav class="nav"><span class="brand">💍 Tie The Tech</span>
  <div style="display:flex;gap:20px"><a href="/">Home</a><a href="/vendors">Vendors</a><a href="/bookings">Bookings</a><a href="/payments">Payments</a><a href="/planning">Planning</a><a href="/admin">Admin</a></div>
</nav>
<div class="container">
  <div class="header"><h1>📅 Bookings</h1><a href="/bookings/new" class="btn btn-primary">+ New Booking</a></div>
  <c:choose>
    <c:when test="${empty bookings}"><div class="empty"><h3>No bookings yet</h3><p>Create your first booking</p></div></c:when>
    <c:otherwise>
      <table>
        <thead><tr><th>Booking ID</th><th>Client</th><th>Vendor</th><th>Event Date</th><th>Created On</th><th>Status</th><th>Actions</th></tr></thead>
        <tbody>
          <c:forEach var="b" items="${bookings}">
            <tr>
              <td>${b.bookingId}</td><td>${b.clientName}</td><td>${b.vendorName}</td>
              <td>${b.eventDate}</td><td>${b.createdDate}</td>
              <td><span class="badge badge-${b.status.toLowerCase()}">${b.status}</span></td>
              <td>
                <a href="/bookings/edit/${b.bookingId}" class="btn btn-primary" style="font-size:12px;padding:6px 14px">Edit</a>
                <a href="/bookings/delete/${b.bookingId}" class="btn btn-danger" style="font-size:12px;padding:6px 14px" onclick="return confirm('Delete?')">Delete</a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:otherwise>
  </c:choose>
</div></body></html>
