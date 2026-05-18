<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="en"><head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Budget Tracker — Tie The Tech</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box}
    body{font-family:'Outfit',sans-serif;min-height:100vh;background:linear-gradient(135deg,#1a0533,#2d1b69,#0d2137);padding:32px 20px;color:#fff}
    .nav{display:flex;justify-content:space-between;align-items:center;max-width:1000px;margin:0 auto 32px;padding:16px 24px;background:rgba(255,255,255,0.07);border-radius:16px;border:1px solid rgba(255,255,255,0.1)}
    .nav a{color:rgba(255,255,255,0.7);text-decoration:none;font-size:14px;font-weight:500}.nav .brand{color:#fff;font-weight:700;font-size:18px}
    .container{max-width:1000px;margin:0 auto}
    h1{font-size:26px;font-weight:700;margin-bottom:24px}
    .total-card{background:linear-gradient(135deg,#7c3aed,#a855f7);border-radius:20px;padding:28px;margin-bottom:24px}
    .total-label{font-size:14px;opacity:0.8;margin-bottom:4px}.total-amount{font-size:36px;font-weight:700}
    .layout{display:grid;grid-template-columns:1fr 320px;gap:24px;align-items:start}
    .card{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.12);border-radius:20px;padding:28px}
    .form-group{margin-bottom:16px}
    label{display:block;color:rgba(255,255,255,0.7);font-size:13px;margin-bottom:6px;font-weight:500}
    input{width:100%;padding:11px 14px;background:rgba(255,255,255,0.08);border:1px solid rgba(255,255,255,0.15);border-radius:10px;color:#fff;font-size:14px;font-family:'Outfit',sans-serif;outline:none}
    input:focus{border-color:#a78bfa}
    .btn{padding:11px 20px;border:none;border-radius:10px;font-size:14px;font-weight:600;font-family:'Outfit',sans-serif;cursor:pointer;text-decoration:none;display:inline-block}
    .btn-primary{background:linear-gradient(135deg,#7c3aed,#a855f7);color:#fff;width:100%}
    .btn-danger{background:rgba(239,68,68,0.15);border:1px solid rgba(239,68,68,0.3);color:#fca5a5}
    .item{display:flex;align-items:center;justify-content:space-between;padding:14px 0;border-bottom:1px solid rgba(255,255,255,0.06)}
    .item:last-child{border-bottom:none}
    .item-name{font-size:14px}.item-cat{color:rgba(255,255,255,0.4);font-size:12px;margin-top:2px}
    .item-amount{color:#a78bfa;font-weight:700;font-size:16px;margin-right:12px}
    .empty{text-align:center;padding:40px;color:rgba(255,255,255,0.4)}
  </style>
</head><body>
<nav class="nav">
  <span class="brand">💍 Tie The Tech</span>
  <div style="display:flex;gap:16px"><a href="/planning">← Planning</a><a href="/planning/tasks">Tasks</a><a href="/planning/guests">Guests</a></div>
</nav>
<div class="container">
  <h1>💰 Budget Tracker</h1>
  <div class="total-card">
    <div class="total-label">Total Spent</div>
    <div class="total-amount">LKR ${totalActual}</div>
  </div>
  <div class="layout">
    <div class="card">
      <c:choose>
        <c:when test="${empty budgetItems}"><div class="empty"><p>No expenses yet. Add your first one →</p></div></c:when>
        <c:otherwise>
          <c:forEach var="b" items="${budgetItems}">
            <div class="item">
              <div><div class="item-name">${b.description}</div><div class="item-cat">${b.category}</div></div>
              <div style="display:flex;align-items:center">
                <span class="item-amount">LKR ${b.actual}</span>
                <a href="/planning/budget/delete/${b.itemId}" class="btn btn-danger" style="font-size:12px;padding:5px 10px" onclick="return confirm('Delete?')">✕</a>
              </div>
            </div>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>
    <div class="card">
      <h2 style="font-size:18px;margin-bottom:20px;font-weight:700">Add Expense</h2>
      <form method="post" action="/planning/budget/add">
        <div class="form-group"><label>Description</label><input type="text" name="description" placeholder="e.g. Venue Deposit" required></div>
        <div class="form-group"><label>Category</label><input type="text" name="category" placeholder="e.g. Venue, Catering"></div>
        <div class="form-group"><label>Estimated (LKR)</label><input type="number" name="estimated" min="0" step="0.01" placeholder="0.00" required></div>
        <div class="form-group"><label>Actual Spent (LKR)</label><input type="number" name="actual" min="0" step="0.01" placeholder="0.00" value="0"></div>
        <button type="submit" class="btn btn-primary">Add Expense</button>
      </form>
    </div>
  </div>
</div></body></html>
