<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tie The Tech — Next-Gen Wedding Coordination Suite</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap');

        * { font-family: 'Outfit', sans-serif; }
        body {
            background: linear-gradient(135deg, #160f29 0%, #2b193d 100%);
            color: #e2e2e2;
            min-height: 100vh;
            overflow-x: hidden;
        }


        h1, h2, h3, h4, h5, h6, .text-dark, .section-title { color: #ffffff !important; }
        .text-muted, .section-sub { color: #a19ba8 !important; }


        .ttt-navbar {
            background: linear-gradient(135deg, #120b24 0%, #0d1220 100%);
            padding: 16px 0;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.15);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }
        .ttt-navbar .navbar-brand { color: #f0c040 !important; font-weight: 800; font-size: 1.4rem; letter-spacing: 0.5px; }
        .ttt-navbar .nav-link { color: rgba(255,255,255,0.75) !important; font-weight: 500; transition: color 0.2s; }
        .ttt-navbar .nav-link:hover, .ttt-navbar .nav-link.active { color: #f0c040 !important; }
        .ttt-navbar .btn-nav-login { background: #f0c040; color: #1a1a2e; font-weight: 700; border: none; border-radius: 20px; padding: 6px 22px; transition: all 0.2s ease; }
        .ttt-navbar .btn-nav-login:hover { background: #d4a017; color: #1a1a2e; transform: translateY(-1px); }


        .premium-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 24px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.15);
            transition: transform 0.3s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.3s ease;
            overflow: hidden;
            height: 100%;
        }
        .premium-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 50px rgba(0,0,0,0.25);
        }
        .premium-card .card-accent { height: 6px; }
        .premium-card .card-icon { width: 60px; height: 60px; border-radius: 18px; display: flex; align-items: center; justify-content: center; font-size: 1.7rem; margin-bottom: 20px; }
        .premium-card h5 { color: #ffffff !important; font-weight: 700; font-size: 1.2rem; margin-bottom: 12px; }
        .premium-card p { color: #d1cdd6 !important; font-size: 0.92rem; line-height: 1.65; }
        .premium-card .btn-card { border-radius: 20px; font-weight: 600; font-size: 0.88rem; padding: 10px 24px; border: none; transition: transform 0.2s ease; }
        .premium-card .btn-card:hover { transform: translateY(-1px); }


        .section-spacer {
            padding: 120px 0;
        }
        .text-indigo { color: #e2e2e2 !important; }
        .text-gold { color: #f0c040 !important; }
        .bg-indigo { background-color: #120b24 !important; }
        .bg-gold { background-color: #f0c040 !important; }


        .form-control, .form-select {
            color: #120b24 !important;
        }
        .form-control::placeholder {
            color: #6c757d !important;
        }
    </style>
</head>
<body>


<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/"><i class="bi bi-heart-fill text-warning me-1"></i> Tie The Tech</a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
            <span class="navbar-toggler-icon" style="filter:invert(1)"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNav">
            <div class="navbar-nav ms-auto align-items-center gap-2">
                <a class="nav-link" href="/"><i class="bi bi-house me-1"></i>Home</a>
                <span class="nav-link text-muted" style="cursor: not-allowed; opacity: 0.5;" title="Disabled for Component Isolation"><i class="bi bi-shop me-1"></i>Vendors</span>
                <span class="nav-link text-muted" style="cursor: not-allowed; opacity: 0.5;" title="Disabled for Component Isolation"><i class="bi bi-calendar-check me-1"></i>Bookings</span>
                <span class="nav-link text-muted" style="cursor: not-allowed; opacity: 0.5;" title="Disabled for Component Isolation"><i class="bi bi-credit-card me-1"></i>Payments</span>
                <span class="nav-link text-muted" style="cursor: not-allowed; opacity: 0.5;" title="Disabled for Component Isolation"><i class="bi bi-check2-all me-1"></i>Planning</span>
                <span class="nav-link text-muted" style="cursor: not-allowed; opacity: 0.5;" title="Disabled for Component Isolation"><i class="bi bi-star me-1"></i>Reviews</span>
                <span class="nav-link text-muted" style="cursor: not-allowed; opacity: 0.5;" title="Disabled for Component Isolation"><i class="bi bi-speedometer2 me-1"></i>Admin</span>
                <% if (session.getAttribute("userId") != null) { %>
                    <a class="nav-link" href="/profile"><i class="bi bi-person-circle me-1"></i><%= session.getAttribute("userName") %></a>
                    <a href="/logout" class="btn btn-nav-login ms-2">Logout</a>
                <% } else { %>
                    <a href="/login" class="btn btn-nav-login ms-2">Login</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>
