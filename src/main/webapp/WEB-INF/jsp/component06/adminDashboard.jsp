<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="en"><head>
  <meta charset="UTF-8"><title>Admin Dashboard</title>
  <style>body{font-family:sans-serif;background:#1a0533;color:#fff;padding:20px} a{color:#a855f7}</style>
</head><body>
  <h2>Admin Dashboard & Analytics</h2>
  <p><a href="/admin/admins">Manage System Admins (CRUD)</a></p>
  
  <h3>Platform Statistics</h3>
  <ul>
    <li>Users: ${userCount}</li>
    <li>Vendors: ${vendorCount}</li>
    <li>Bookings: ${bookingCount}</li>
    <li>Payments: ${paymentCount}</li>
    <li>Reviews: ${reviewCount}</li>
    <li>Tasks: ${taskCount}</li>
  </ul>

  <h3>Platform Announcements</h3>
  <form method="post" action="/admin/announcements/new" style="background:#222;padding:20px;margin-bottom:20px">
    Title: <input type="text" name="title" required>
    Content: <input type="text" name="content" required>
    <button type="submit">Post Announcement</button>
  </form>
  
  <c:forEach var="ann" items="${announcements}">
    <div style="background:#333;padding:15px;margin-bottom:10px">
      <h4>${ann.title} <small>(${ann.date})</small></h4>
      <p>${ann.content}</p>
      <a href="/admin/announcements/delete/${ann.id}">Delete</a>
    </div>
  </c:forEach>
</body></html>
