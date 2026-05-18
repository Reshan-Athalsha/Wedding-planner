package com.ttt.component01.model;

import com.ttt.shared.FileOperations;

/** COMPONENT 01 — User Management | OOP: ABSTRACTION · ENCAPSULATION · INTERFACE */
public abstract class User implements FileOperations {
    private String userId;
    private String name;
    private String email;
    private String password;
    private String role;

    public User() {}
    public User(String userId, String name, String email, String password, String role) {
        this.userId = userId; this.name = name; this.email = email; this.password = password; this.role = role;
    }

    public abstract void displayRoleDetails(); // ABSTRACTION

    @Override
    public String toFileString() { return userId+"|"+name+"|"+email+"|"+password+"|"+role; }

    public String getUserId()   { return userId; }   public void setUserId(String v)   { this.userId = v; }
    public String getName()     { return name; }     public void setName(String v)     { this.name = v; }
    public String getEmail()    { return email; }    public void setEmail(String v)    { this.email = v; }
    public String getPassword() { return password; } public void setPassword(String v) { this.password = v; }
    public String getRole()     { return role; }     public void setRole(String v)     { this.role = v; }
}
