<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="en"><head>
  <meta charset="UTF-8"><title>Edit Booking — Tie The Tech</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700&display=swap" rel="stylesheet">
  <style>*{margin:0;padding:0;box-sizing:border-box}body{font-family:'Outfit',sans-serif;min-height:100vh;background:linear-gradient(135deg,#1a0533,#2d1b69,#0d2137);padding:32px 20px;color:#fff}.nav{display:flex;justify-content:space-between;align-items:center;max-width:700px;margin:0 auto 32px;padding:16px 24px;background:rgba(255,255,255,0.07);border-radius:16px;border:1px solid rgba(255,255,255,0.1)}.nav a{color:rgba(255,255,255,0.7);text-decoration:none;font-size:14px}.nav .brand{color:#fff;font-weight:700;font-size:18px}.card{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.15);border-radius:24px;padding:40px;max-width:700px;margin:0 auto}h2{font-size:24px;font-weight:700;margin-bottom:28px}.form-row{display:grid;grid-template-columns:1fr 1fr;gap:16px}.form-group{margin-bottom:20px}label{display:block;color:rgba(255,255,255,0.7);font-size:13px;margin-bottom:8px;font-weight:500;text-transform:uppercase;letter-spacing:0.5px}input,select{width:100%;padding:13px 16px;background:rgba(255,255,255,0.08);border:1px solid rgba(255,255,255,0.15);border-radius:12px;color:#fff;font-size:14px;font-family:'Outfit',sans-serif;outline:none}input:focus,select:focus{border-color:#a78bfa}select option{background:#1a0533}.btn{padding:13px 28px;border:none;border-radius:12px;font-size:15px;font-weight:600;font-family:'Outfit',sans-serif;cursor:pointer;text-decoration:none;display:inline-block}.btn-primary{background:linear-gradient(135deg,#7c3aed,#a855f7);color:#fff}.btn-secondary{background:rgba(255,255,255,0.1);color:rgba(255,255,255,0.7);border:1px solid rgba(255,255,255,0.15)}.actions{display:flex;gap:12px;margin-top:8px}</style>
</head><body>
<nav class="nav"><span class="brand">💍 Tie The Tech</span><a href="/bookings">← Back to Bookings</a></nav>
<div class="card">
  <h2>✏️ Edit Booking</h2>
  <form method="post" action="/bookings/edit">
    <input type="hidden" name="bookingId" value="${booking.bookingId}">
    <input type="hidden" name="createdDate" value="${booking.createdDate}">
    <div class="form-row">
      <div class="form-group"><label>Client Name</label><input type="text" name="clientName" value="${booking.clientName}" required></div>
      <div class="form-group"><label>Vendor Name</label><input type="text" name="vendorName" value="${booking.vendorName}" required></div>
    </div>
    <div class="form-row">
      <div class="form-group"><label>Event Date</label><input type="date" name="eventDate" value="${booking.eventDate}" required></div>
      <div class="form-group"><label>Status</label>
        <select name="status">
          <option value="PENDING" ${booking.status == 'PENDING' ? 'selected' : ''}>Pending</option>
          <option value="CONFIRMED" ${booking.status == 'CONFIRMED' ? 'selected' : ''}>Confirmed</option>
          <option value="CANCELLED" ${booking.status == 'CANCELLED' ? 'selected' : ''}>Cancelled</option>
        </select>
      </div>
    </div>
    <div class="actions"><button type="submit" class="btn btn-primary">Save Changes</button><a href="/bookings" class="btn btn-secondary">Cancel</a></div>
  </form>
</div></body></html>

