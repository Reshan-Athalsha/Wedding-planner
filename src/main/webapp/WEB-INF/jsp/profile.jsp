<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile - WeddingBliss</title>
    <!-- BOOTSTRAP 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f6f9; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar { background: linear-gradient(to right, #2575fc, #6a11cb); }
        .card { border-radius: 12px; border: none; }
        .bg-gradient-primary { background: linear-gradient(to right, #2575fc, #6a11cb); color: white; }
    </style>
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">💍 WeddingBliss</a>
        <div class="d-flex">
            <a href="/logout" class="btn btn-outline-light btn-sm fw-bold">Logout</a>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row">
        <!-- Left Column: Profile Card & Delete Account -->
        <div class="col-md-4">
            
            <!-- User Info Card -->
            <div class="card shadow-sm mb-4">
                <div class="card-body text-center p-4">
                    <div class="rounded-circle bg-gradient-primary d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 80px; height: 80px;">
                        <h2 class="mb-0 text-white">
                            <% 
                               String uName = (String) session.getAttribute("userName");
                               if (uName != null && !uName.isEmpty()) {
                                   out.print(uName.substring(0, 1).toUpperCase());
                               } else {
                                   out.print("U");
                               }
                            %>
                        </h2>
                    </div>
                    <h4 class="card-title fw-bold">${sessionScope.userName}</h4>
                    <p class="text-muted mb-2">${sessionScope.userEmail}</p>
                    <span class="badge bg-primary px-3 py-2">${sessionScope.userRole}</span>
                </div>
            </div>
            
            <!-- Danger Zone (Delete Account) -->
            <div class="card shadow-sm border-danger">
                <div class="card-body text-center p-4">
                    <h5 class="text-danger fw-bold">Danger Zone</h5>
                    <p class="small text-muted mb-3">Deleting your account will permanently remove your data from our text files. This cannot be undone.</p>
                    <form action="/profile/delete" method="POST" onsubmit="return confirm('WARNING: Are you absolutely sure you want to delete your account?');">
                        <button type="submit" class="btn btn-outline-danger w-100 fw-bold">Delete My Account</button>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- Right Column: Update Details Form -->
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-header bg-white border-bottom py-3">
                    <h5 class="mb-0 fw-bold text-primary">Update Profile Details</h5>
                </div>
                <div class="card-body p-4">
                    
                    <!-- Success Alert -->
                    <% if (request.getAttribute("success") != null) { %>
                        <div class="alert alert-success fw-bold"><%= request.getAttribute("success") %></div>
                    <% } %>
                    
                    <form action="/profile/update" method="POST">
                        <div class="mb-3">
                            <label class="form-label fw-bold text-muted">Full Name</label>
                            <input type="text" name="name" class="form-control bg-light" value="${sessionScope.userName}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label fw-bold text-muted">Email Address <small class="text-danger">(Cannot be changed)</small></label>
                            <input type="email" class="form-control text-muted" value="${sessionScope.userEmail}" disabled>
                        </div>
                        
                        <hr class="my-4">
                        <h6 class="fw-bold mb-3">Change Password</h6>
                        <p class="small text-muted mb-3">If you do not wish to change your password, simply leave this field blank.</p>
                        
                        <div class="mb-4">
                            <label class="form-label fw-bold text-muted">New Password</label>
                            <input type="password" name="password" class="form-control bg-light" placeholder="Enter new password">
                        </div>
                        
                        <button type="submit" class="btn btn-primary px-4 fw-bold" style="background: linear-gradient(to right, #2575fc, #6a11cb); border:none;">
                            Save Changes
                        </button>
                    </form>
                </div>
            </div>
        </div>
        
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
