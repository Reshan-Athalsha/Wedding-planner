<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<style>
    .container-budget { max-width: 1000px; margin: 0 auto; }
    h1 { font-size: 26px; font-weight: 700; margin-bottom: 24px; }
    .total-card { background: linear-gradient(135deg, #7c3aed, #a855f7); border-radius: 20px; padding: 28px; margin-bottom: 24px; }
    .total-label { font-size: 14px; opacity: 0.8; margin-bottom: 4px; }
    .total-amount { font-size: 36px; font-weight: 700; color: #ffffff !important; }
    .layout-budget { display: grid; grid-template-columns: 1fr 320px; gap: 24px; align-items: start; }
    .budget-card { background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(10px); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px; padding: 28px; }
    .form-group { margin-bottom: 16px }
    label { display: block; color: rgba(255,255,255,0.7); font-size: 13px; margin-bottom: 6px; font-weight: 500 }
    input { width: 100%; padding: 11px 14px; background: rgba(255,255,255,0.08); border: 1px solid rgba(255,255,255,0.15); border-radius: 10px; color: #fff; font-size: 14px; font-family:'Outfit',sans-serif; outline: none }
    input:focus { border-color:#a78bfa }
    .btn-budget { padding: 11px 20px; border: none; border-radius: 10px; font-size: 14px; font-weight: 600; font-family:'Outfit',sans-serif; cursor: pointer; text-decoration: none; display: inline-block; transition: opacity 0.2s; }
    .btn-primary { background: linear-gradient(135deg,#7c3aed,#a855f7); color: #fff; width: 100% }
    .btn-secondary { background: rgba(255,255,255,0.12); border: 1px solid rgba(255,255,255,0.18); color: #fff; }
    .btn-danger { background: rgba(239,68,68,0.15); border: 1px solid rgba(239,68,68,0.3); color: #fca5a5; }

    .item { display: flex; align-items: center; justify-content: space-between; padding: 14px 0; border-bottom: 1px solid rgba(255,255,255,0.06); }
    .item:last-child { border-bottom: none; }
    .item-name { font-size: 14px; color: #ffffff !important; }
    .item-cat { color: rgba(255,255,255,0.4); font-size: 12px; margin-top: 2px; }
    .item-amount { color: #a78bfa; font-weight: 700; font-size: 16px; margin-right: 12px; }
    .empty { text-align: center; padding: 40px; color: rgba(255,255,255,0.4); }
</style>

<div class="container py-5 mt-4">
    <div class="container-budget">
        <h1 class="display-6 fw-bold mb-4">Budget Tracker</h1>

        <div class="total-card shadow-sm">
            <div class="total-label text-white">Total Spent</div>
            <div class="total-amount text-white">LKR ${totalActual}</div>
        </div>

        <div class="layout-budget">
            <div class="budget-card">
                <c:choose>
                    <c:when test="${empty budgetItems}">
                        <div class="empty"><p class="text-muted">No expenses yet. Add your first expense &rarr;</p></div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="b" items="${budgetItems}">
                            <div class="item">
                                <div>
                                    <div class="item-name">${b.description}</div>
                                    <div class="item-cat">${b.category}</div>
                                </div>
                                <div style="display:flex;align-items:center">
                                    <span class="item-amount">LKR ${b.actual}</span>
                                    <a href="/planning/budget/edit/${b.itemId}" class="btn-budget btn-secondary" style="font-size:12px;padding:5px 10px">Edit</a>
                                    <a href="/planning/budget/delete/${b.itemId}" class="btn-budget btn-danger" style="font-size:12px;padding:5px 10px" onclick="return confirm('Delete?')">&#x2715;</a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="budget-card">
                <c:choose>
                    <c:when test="${not empty editingBudget}">
                        <h2 style="font-size:18px;margin-bottom:20px;font-weight:700" class="text-white">Edit Expense</h2>
                        <form method="post" action="/planning/budget/update">
                            <input type="hidden" name="itemId" value="${editingBudget.itemId}">
                            <div class="form-group"><label>Description</label><input type="text" name="description" value="${editingBudget.description}" placeholder="e.g. Venue Deposit" required></div>
                            <div class="form-group"><label>Category</label><input type="text" name="category" value="${editingBudget.category}" placeholder="e.g. Venue, Catering"></div>
                            <div class="form-group"><label>Estimated (LKR)</label><input type="number" name="estimated" min="0" step="0.01" value="${editingBudget.estimated}" placeholder="0.00" required></div>
                            <div class="form-group"><label>Actual Spent (LKR)</label><input type="number" name="actual" min="0" step="0.01" value="${editingBudget.actual}" placeholder="0.00"></div>
                            <button type="submit" class="btn-budget btn-primary mt-3">Save Changes</button>
                            <a href="/planning/budget" class="btn-budget btn-secondary mt-2" style="display:block; text-align:center;">Cancel</a>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <h2 style="font-size:18px;margin-bottom:20px;font-weight:700" class="text-white">Add Expense</h2>
                        <form method="post" action="/planning/budget/add">
                            <div class="form-group"><label>Description</label><input type="text" name="description" placeholder="e.g. Venue Deposit" required></div>
                            <div class="form-group"><label>Category</label><input type="text" name="category" placeholder="e.g. Venue, Catering"></div>
                            <div class="form-group"><label>Estimated (LKR)</label><input type="number" name="estimated" min="0" step="0.01" placeholder="0.00" required></div>
                            <div class="form-group"><label>Actual Spent (LKR)</label><input type="number" name="actual" min="0" step="0.01" placeholder="0.00" value="0"></div>
                            <button type="submit" class="btn-budget btn-primary mt-3">Add Expense</button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
