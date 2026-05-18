<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<style>
    .container-guests { max-width: 1000px; margin: 0 auto; display: grid; grid-template-columns: 1fr 320px; gap: 24px; align-items: start; }
    h1 { font-size: 26px; font-weight: 700; margin-bottom: 24px; grid-column: 1/-1; }
    .guests-card { background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(10px); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px; padding: 28px; }
    .form-group { margin-bottom: 16px }
    label { display: block; color: rgba(255,255,255,0.7); font-size: 13px; margin-bottom: 6px; font-weight: 500 }
    input, select { width: 100%; padding: 11px 14px; background: rgba(255,255,255,0.08); border: 1px solid rgba(255,255,255,0.15); border-radius: 10px; color: #fff; font-size: 14px; font-family:'Outfit',sans-serif; outline: none }
    input:focus, select:focus { border-color:#a78bfa }
    select option { background:#1a0533 }
    .btn-guests { padding: 11px 20px; border: none; border-radius: 10px; font-size: 14px; font-weight: 600; font-family:'Outfit',sans-serif; cursor: pointer; transition: opacity 0.2s; text-decoration: none; display: inline-block }
    .btn-primary { background: linear-gradient(135deg,#7c3aed,#a855f7); color: #fff; width: 100% }
    .btn-danger { background: rgba(239,68,68,0.15); border: 1px solid rgba(239,68,68,0.3); color: #fca5a5 }
    
    .table-guests { width: 100%; border-collapse: collapse }
    .table-guests th { text-align: left; padding: 10px; color: rgba(255,255,255,0.5); font-size: 12px; text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 1px solid rgba(255,255,255,0.08); }
    .table-guests td { padding: 12px 10px; border-bottom: 1px solid rgba(255,255,255,0.05); font-size: 14px; color: rgba(255,255,255,0.85); }
    
    .badge { display: inline-block; padding: 3px 10px; border-radius: 20px; font-size: 11px; font-weight: 600 }
    .badge-attending { background: rgba(34,197,94,0.2); color: #86efac }
    .badge-declined { background: rgba(239,68,68,0.2); color: #fca5a5 }
    .badge-pending { background: rgba(245,158,11,0.2); color: #fcd34d }
    .empty { text-align: center; padding: 40px; color: rgba(255,255,255,0.4) }
</style>

<div class="container py-5 mt-4">
    <div class="container-guests">
        <h1 class="display-6 fw-bold mb-4">Guest List</h1>
        <div class="guests-card">
            <c:choose>
                <c:when test="${empty guests}">
                    <div class="empty"><p class="text-muted">No guests added yet.</p></div>
                </c:when>
                <c:otherwise>
                    <table class="table-guests">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>RSVP</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="g" items="${guests}">
                                <tr>
                                    <td>${g.name}</td>
                                    <td>${g.email}</td>
                                    <td>${g.phone}</td>
                                    <td><span class="badge badge-${g.rsvpStatus.toLowerCase()}">${g.rsvpStatus}</span></td>
                                    <td><a href="/planning/guests/delete/${g.guestId}" class="btn-guests btn-danger" style="font-size:12px;padding:5px 10px" onclick="return confirm('Remove guest?')">&#x2715;</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
        
        <div class="guests-card">
            <h2 style="font-size:18px;margin-bottom:20px;font-weight:700" class="text-white">Add Guest</h2>
            <form method="post" action="/planning/guests/add">
                <div class="form-group"><label>Name</label><input type="text" name="name" id="guestName" placeholder="Guest full name" required></div>
                <div class="form-group"><label>Email</label><input type="email" name="email" id="guestEmail" placeholder="guest@email.com"></div>
                <div class="form-group"><label>Phone</label><input type="text" name="phone" id="guestPhone" placeholder="+94 7X XXX XXXX"></div>
                <div class="form-group"><label>RSVP</label>
                    <select name="rsvpStatus" id="rsvpStatus">
                        <option value="PENDING">Pending</option>
                        <option value="ATTENDING">Attending</option>
                        <option value="DECLINED">Declined</option>
                    </select>
                </div>
                <button type="submit" class="btn-guests btn-primary">Add Guest</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
