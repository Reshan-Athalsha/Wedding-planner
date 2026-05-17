package com.ttt.component01.model;

/** COMPONENT 01 — CoupleUser | OOP: INHERITANCE · POLYMORPHISM · ENCAPSULATION */
public class CoupleUser extends User {
    private String weddingDate;
    private double budget;
    private int guestCount;
    private String theme;

    public CoupleUser() { super(); this.setRole("COUPLE"); }
    public CoupleUser(String userId, String name, String email, String password) {
        super(userId, name, email, password, "COUPLE");
    }

    @Override
    public void displayRoleDetails() { System.out.println("Role: COUPLE — Planning their wedding with TTT."); }

    @Override
    public String toFileString() {
        return getUserId()+"|"+getName()+"|"+getEmail()+"|"+getPassword()+"|"+getRole()
                +"|"+(weddingDate!=null?weddingDate:"")+"|"+budget+"|"+guestCount+"|"+(theme!=null?theme:"");
    }

    public String getWeddingDate()       { return weddingDate; }
    public void setWeddingDate(String v) { this.weddingDate = v; }
    public double getBudget()            { return budget; }
    public void setBudget(double v)      { this.budget = v; }
    public int getGuestCount()           { return guestCount; }
    public void setGuestCount(int v)     { this.guestCount = v; }
    public String getTheme()             { return theme; }
    public void setTheme(String v)       { this.theme = v; }
}
