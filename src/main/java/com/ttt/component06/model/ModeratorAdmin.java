package com.ttt.component06.model;

public class ModeratorAdmin extends Admin {
    public ModeratorAdmin() {}
    public ModeratorAdmin(String adminId, String username, String password, String email) { super(adminId, username, password, email); }
    @Override public String getRoleName() { return "MODERATOR"; }
    @Override public String getPermissions() { return "Resolve Disputes, Verify Vendors"; }
}
