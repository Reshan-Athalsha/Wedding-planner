<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<style>
    .container-planning { max-width: 1100px; margin: 0 auto; }
    h1 { font-size: 32px; font-weight: 700; margin-bottom: 8px; }
    .subtitle { color: rgba(255,255,255,0.5); margin-bottom: 40px; }
    .grid-planning { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; }
    .tool-card { background: rgba(255, 255, 255, 0.05); border: 1px solid rgba(255, 255, 255, 0.12); border-radius: 24px; padding: 36px; text-align: center; text-decoration: none; color: #fff; transition: all 0.25s; }
    .tool-card:hover { transform: translateY(-5px); border-color: rgba(167,139,250,0.5); background: rgba(255, 255, 255, 0.1); color: #ffffff !important; }
    .tool-icon { font-size: 48px; margin-bottom: 16px; color: #fbbf24; }
    .tool-name { font-size: 20px; font-weight: 700; margin-bottom: 8px; color: #ffffff !important; }
    .tool-desc { color: rgba(255,255,255,0.5); font-size: 14px; line-height: 1.5; }
    .tool-count { display: inline-block; margin-top: 16px; padding: 6px 16px; background: rgba(167,139,250,0.2); border: 1px solid rgba(167,139,250,0.3); border-radius: 20px; font-size: 13px; color: #c4b5fd; font-weight: 600; }
</style>

<div class="container py-5 mt-4">
    <div class="container-planning">
        <h1 class="display-6 fw-bold">Wedding Planning Tools</h1>
        <p class="subtitle mt-2">Manage your tasks, budget, and guest list all in one place</p>
        
        <div class="grid-planning mt-5">
            <a href="/planning/checklist" class="tool-card">
                <div class="tool-icon"><i class="bi bi-card-checklist text-success"></i></div>
                <div class="tool-name">Task Checklist</div>
                <div class="tool-desc">Track all your wedding to-dos with due dates and priorities</div>
                <div class="tool-count">${taskCount} tasks</div>
            </a>
            
            <a href="/planning/budget" class="tool-card">
                <div class="tool-icon"><i class="bi bi-tag-fill text-warning"></i></div>
                <div class="tool-name">Budget Tracker</div>
                <div class="tool-desc">Monitor your wedding expenses and stay within budget</div>
                <div class="tool-count">LKR ${totalBudget}</div>
            </a>
            
            <a href="/planning/guests" class="tool-card">
                <div class="tool-icon"><i class="bi bi-people-fill text-info"></i></div>
                <div class="tool-name">Guest List</div>
                <div class="tool-desc">Manage invitations and track RSVPs from your guests</div>
                <div class="tool-count">${guestCount} guests</div>
            </a>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
