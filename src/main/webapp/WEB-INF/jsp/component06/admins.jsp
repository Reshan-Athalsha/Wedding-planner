<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="en"><head>
  <meta charset="UTF-8"><title>Manage Admins</title>
  <style>body{font-family:sans-serif;background:#1a0533;color:#fff;padding:20px} a{color:#a855f7} table{width:100%;border-collapse:collapse;margin-top:20px} th,td{padding:10px;border:1px solid #333;text-align:left}</style>
</head><body>
  <a href="/admin">← Back to Dashboard</a>
  <h2>Manage Administrator Accounts</h2>
  <form method="post" action="/admin/admins/new" style="background:#222;padding:20px;margin-bottom:20px">
    <h3>Add New Admin</h3>
    Username: <input type="text" name="username" required>
    Email: <input type="email" name="email" required>
    Password: <input type="password" name="password" required>
    Role: <select name="role"><option value="MODERATOR">Moderator</option><option value="SUPER_ADMIN">Super Admin</option></select>
    <button type="submit">Create Admin</button>
  </form>
  <table>
    <tr><th>ID</th><th>Username</th><th>Email</th><th>Role</th><th>Permissions</th><th>Actions</th></tr>
    <c:forEach var="a" items="${admins}">
      <tr>
        <td>${a.adminId}</td><td>${a.username}</td><td>${a.email}</td><td>${a.roleName}</td><td>${a.permissions}</td>
        <td><a href="/admin/admins/delete/${a.adminId}">Delete</a></td>
      </tr>
    </c:forEach>
  </table>
</body></html>
