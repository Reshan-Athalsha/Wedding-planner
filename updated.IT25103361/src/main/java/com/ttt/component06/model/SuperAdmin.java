package com.ttt.component06.model;
/** COMPONENT 06 - SuperAdmin | OOP: INHERITANCE, POLYMORPHISM */
public class SuperAdmin extends Admin {
    public SuperAdmin() {}
    public SuperAdmin(String adminId, String username, String password, String email) { super(adminId, username, password, email); }
    @Override public String getRoleName() { return "SUPER_ADMIN"; }
    @Override public String getPermissions() { return "Full System Access, Add/Remove Admins"; }
}
