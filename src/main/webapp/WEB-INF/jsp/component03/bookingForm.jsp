<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="en"><head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>New Booking — Tie The Tech</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box}body{font-family:'Outfit',sans-serif;min-height:100vh;background:linear-gradient(135deg,#1a0533,#2d1b69,#0d2137);padding:32px 20px;color:#fff}
    .nav{display:flex;justify-content:space-between;align-items:center;max-width:700px;margin:0 auto 32px;padding:16px 24px;background:rgba(255,255,255,0.07);border-radius:16px;border:1px solid rgba(255,255,255,0.1)}
    .nav a{color:rgba(255,255,255,0.7);text-decoration:none;font-size:14px}.nav .brand{color:#fff;font-weight:700;font-size:18px}
    .card{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.15);border-radius:24px;padding:40px;max-width:700px;margin:0 auto}
    h2{font-size:24px;font-weight:700;margin-bottom:28px}
    .form-row{display:grid;grid-template-columns:1fr 1fr;gap:16px}.form-group{margin-bottom:20px}
    label{display:block;color:rgba(255,255,255,0.7);font-size:13px;margin-bottom:8px;font-weight:500;text-transform:uppercase;letter-spacing:0.5px}
    input,select{width:100%;padding:13px 16px;background:rgba(255,255,255,0.08);border:1px solid rgba(255,255,255,0.15);border-radius:12px;color:#fff;font-size:14px;font-family:'Outfit',sans-serif;outline:none}
    input:focus,select:focus{border-color:#a78bfa}select option{background:#1a0533}
    .btn{padding:13px 28px;border:none;border-radius:12px;font-size:15px;font-weight:600;font-family:'Outfit',sans-serif;cursor:pointer;transition:opacity 0.2s;text-decoration:none;display:inline-block}
    .btn-primary{background:linear-gradient(135deg,#7c3aed,#a855f7);color:#fff}.btn-secondary{background:rgba(255,255,255,0.1);color:rgba(255,255,255,0.7);border:1px solid rgba(255,255,255,0.15)}
    .actions{display:flex;gap:12px;margin-top:8px}
  </style>
</head><body>
<nav class="nav"><span class="brand">💍 Tie The Tech</span><a href="/bookings">← Back to Bookings</a></nav>
<div class="card">
  <h2>📅 New Booking</h2>
  <form method="post" action="/bookings/new">
    <div class="form-row">
      <div class="form-group"><label>Vendor Name</label><input type="text" name="vendorName" id="vendorName" placeholder="Vendor business name" required></div>
      <div class="form-group"><label>Event Date</label><input type="date" name="eventDate" id="eventDate" required></div>
    </div>
    <div class="form-row">
      <div class="form-group"><label>Event Type</label>
        <select name="eventType" id="eventType" required>
          <option value="">Select...</option><option>Wedding Ceremony</option><option>Reception</option><option>Pre-wedding Shoot</option><option>Engagement</option>
        </select>
      </div>
      <div class="form-group"><label>Guest Count</label><input type="number" name="guestCount" id="guestCount" min="1" placeholder="Number of guests" required></div>
    </div>
    <div class="form-row">
      <div class="form-group"><label>Special Requests</label><input type="text" name="specialRequests" id="specialRequests" placeholder="Any special requirements"></div>
      <div class="form-group"><label>Status</label>
        <select name="status" id="status"><option value="PENDING">Pending</option><option value="CONFIRMED">Confirmed</option></select>
      </div>
    </div>
    <div class="actions"><button type="submit" class="btn btn-primary">Create Booking</button><a href="/bookings" class="btn btn-secondary">Cancel</a></div>
  </form>
</div></body></html>
