package com.ttt.component04.model;
import com.ttt.shared.FileOperations;
/** COMPONENT 04 — Guest | OOP: ENCAPSULATION · INTERFACE */
public class Guest implements FileOperations {
    private String guestId, name, email, rsvpStatus;
    private int tableNumber;
    private boolean plusOne;
    public Guest() {}
    public Guest(String guestId, String name, String email, String rsvpStatus, int tableNumber, boolean plusOne) {
        this.guestId=guestId; this.name=name; this.email=email; this.rsvpStatus=rsvpStatus; this.tableNumber=tableNumber; this.plusOne=plusOne;
    }
    @Override public String toFileString() { return guestId+"|"+name+"|"+email+"|"+rsvpStatus+"|"+tableNumber+"|"+plusOne; }
    public String getGuestId()     { return guestId; }     public void setGuestId(String v)     { this.guestId=v; }
    public String getName()        { return name; }        public void setName(String v)        { this.name=v; }
    public String getEmail()       { return email; }       public void setEmail(String v)       { this.email=v; }
    public String getRsvpStatus()  { return rsvpStatus; }  public void setRsvpStatus(String v)  { this.rsvpStatus=v; }
    public int getTableNumber()    { return tableNumber; }  public void setTableNumber(int v)    { this.tableNumber=v; }
    public boolean isPlusOne()     { return plusOne; }     public void setPlusOne(boolean v)    { this.plusOne=v; }
}
