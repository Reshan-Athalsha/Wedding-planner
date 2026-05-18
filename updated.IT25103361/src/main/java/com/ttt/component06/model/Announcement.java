package com.ttt.component06.model;

import com.ttt.shared.FileOperations;

public class Announcement implements FileOperations {
    
    private String id, title, content, date;
    
    public Announcement(String id, String title, String content, String date) {
        this.id=id; 
        this.title=title;
        this.content=content; 
        this.date=date;
    }
    
    @Override
    public String toFileString() {
        return id+"|"+title+"|"+content.replace("|",";")+"|"+date;
    }
    public String getId() {
        return id; 
    } 
    public void setId(String v) {
        this.id=v; 
    }
    public String getTitle() {
        return title;
    } 
    public void setTitle(String v) {
        this.title=v; 
    }
    public String getContent() { 
        return content; 
    } 
    public void setContent(String v) { 
        this.content=v; 
    }
    public String getDate() {
        return date; 
    } 
    public void setDate(String v) {
        this.date=v; 
    }
}
