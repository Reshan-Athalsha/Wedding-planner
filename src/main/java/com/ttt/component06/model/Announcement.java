package com.ttt.component06.model;

import com.ttt.shared.FileOperations;

public class Announcement implements FileOperations {
    private String id, title, content, date;

    public Announcement() {}

    public Announcement(String id, String title, String content, String date) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.date = date;
    }

    @Override
    public String toFileString() {
        return id + "|" + title + "|" + content + "|" + date;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }
}
