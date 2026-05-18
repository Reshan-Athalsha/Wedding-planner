<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<style>
    .container-vendors { max-width: 1100px; margin: 0 auto; }
    .header-vendors { display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; }
    h1 { font-size: 28px; font-weight: 700; }
    
    .btn-vendors { padding: 11px 22px; border: none; border-radius: 10px; font-size: 14px; font-weight: 600; font-family:'Outfit',sans-serif; cursor: pointer; text-decoration: none; display: inline-block; transition: opacity 0.2s; }
    .btn-primary { background: linear-gradient(135deg,#7c3aed,#a855f7); color: #fff; }
    .btn-danger { background: rgba(239,68,68,0.2); border: 1px solid rgba(239,68,68,0.4); color: #fca5a5; }
    
    .filter-bar { display: flex; gap: 8px; margin-bottom: 24px; flex-wrap: wrap; }
    .filter-btn { padding: 8px 18px; background: rgba(255,255,255,0.08); border: 1px solid rgba(255,255,255,0.15); border-radius: 20px; color: rgba(255,255,255,0.7); font-size: 13px; cursor: pointer; text-decoration: none; transition: all 0.2s; }
    .filter-btn.active, .filter-btn:hover { background: rgba(167,139,250,0.3); border-color: #a78bfa; color: #fff; }
    
    .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(320px, 1fr)); gap: 20px; }
    .category-badge { display: inline-block; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; margin-bottom: 12px; text-transform: uppercase; letter-spacing: 0.5px; }
    .cat-venue { background: rgba(59,130,246,0.2); color: #93c5fd; border: 1px solid rgba(59,130,246,0.3); }
    .cat-catering { background: rgba(34,197,94,0.2); color: #86efac; border: 1px solid rgba(34,197,94,0.3); }
    .cat-photography { background: rgba(245,158,11,0.2); color: #fcd34d; border: 1px solid rgba(245,158,11,0.3); }
    
    .vendor-name { font-size: 18px; font-weight: 700; margin-bottom: 8px; color: #ffffff !important; }
    .vendor-info { color: rgba(255,255,255,0.6); font-size: 14px; margin-bottom: 6px; }
    .stars { color: #fbbf24; font-size: 16px; margin-bottom: 16px; }
    .actions { display: flex; gap: 8px; margin-top: 16px; }
    .empty { text-align: center; padding: 80px 20px; color: rgba(255,255,255,0.4); }
</style>

<div class="container py-5 mt-4">
    <div class="container-vendors">
        <div class="header-vendors">
            <h1 class="display-6 fw-bold mb-0">Vendor Management</h1>
            <a href="/vendors/new" class="btn-vendors btn-primary"><i class="bi bi-plus-circle me-1"></i> Add Vendor</a>
        </div>
        
        <div class="filter-bar mt-4">
            <a href="/vendors" class="filter-btn ${empty selectedCategory ? 'active' : ''}">All Vendors</a>
            <a href="/vendors?category=VENUE" class="filter-btn ${'VENUE' == selectedCategory ? 'active' : ''}"><i class="bi bi-building me-1"></i> Venues</a>
            <a href="/vendors?category=CATERING" class="filter-btn ${'CATERING' == selectedCategory ? 'active' : ''}"><i class="bi bi-egg-fried me-1"></i> Catering</a>
            <a href="/vendors?category=PHOTOGRAPHY" class="filter-btn ${'PHOTOGRAPHY' == selectedCategory ? 'active' : ''}"><i class="bi bi-camera me-1"></i> Photography</a>
        </div>
        
        <c:choose>
            <c:when test="${empty vendors}">
                <div class="empty">
                    <h3 class="fw-bold">No Vendors Yet</h3>
                    <p class="text-muted">Add your first vendor to populate the catalog.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="grid">
                    <c:forEach var="v" items="${vendors}">
                        <div class="premium-card p-4 d-flex flex-column justify-content-between">
                            <div>
                                <span class="category-badge cat-${v.category.toLowerCase()}">${v.category}</span>
                                <div class="vendor-name">${v.businessName}</div>
                                <div class="vendor-info"><i class="bi bi-geo-alt-fill text-muted me-1"></i> ${v.location}</div>
                                <div class="vendor-info"><i class="bi bi-tag-fill text-muted me-1"></i> ${v.priceRange}</div>
                                <div class="vendor-info mt-2" style="font-size:0.9rem; line-height:1.6; color:rgba(255,255,255,0.7) !important;">${v.description}</div>
                            </div>
                            
                            <div class="mt-4">
                                <div class="stars">
                                    <c:forEach begin="1" end="${v.rating > 0 ? v.rating : 0}">★</c:forEach>
                                    <span style="color:rgba(255,255,255,0.4);font-size:13px"> (${v.rating}/5)</span>
                                </div>
                                <div class="actions">
                                    <a href="/vendors/edit/${v.vendorId}" class="btn-vendors btn-primary" style="font-size:13px;padding:8px 16px">Edit</a>
                                    <a href="/vendors/delete/${v.vendorId}" class="btn-vendors btn-danger" style="font-size:13px;padding:8px 16px" onclick="return confirm('Delete this vendor?')">Delete</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
