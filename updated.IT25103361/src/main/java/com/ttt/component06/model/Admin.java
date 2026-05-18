package com.ttt.component06.model;

import com.ttt.shared.FileOperations;


public abstract class Admin implements FileOperations {
    
    private String adminId, username, password, email;
    
    public Admin(String adminId, String username, String password, String email) {
        this.adminId = adminId; 
        this.username = username;
        this.password = password; 
        this.email = email;
    }
    
    public abstract String getRoleName(); 
    
    public abstract String getPermissions();
    
    @Override 
    public String toFileString() { 
        return adminId+"|"+username+"|"+password+"|"+email+"|"+getRoleName();
    }
    public String getAdminId() {
        return adminId; 
    } 
    public void setAdminId(String v) { 
        this.adminId=v; 
    }
    public String getUsername() {
        return username; 
    }
    public void setUsername(String v) { 
        this.username=v;
    }
    public String getPassword() {
        return password; 
    } 
    public void setPassword(String v) {
        this.password=v;
    }
    public String getEmail() {
        return email; 
    }
    public void setEmail(String v) { 
        this.email=v;
    }
}
