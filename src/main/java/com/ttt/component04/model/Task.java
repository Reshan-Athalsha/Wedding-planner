package com.ttt.component04.model;
import com.ttt.shared.FileOperations;

public class Task implements FileOperations {
    private String taskId, title, category, dueDate, taskType;
    private boolean completed;
    public Task() {}
    public Task(String taskId, String title, String category, String dueDate, String taskType) {
        this.taskId=taskId; this.title=title; this.category=category; this.dueDate=dueDate; this.taskType=taskType; this.completed=false;
    }
    @Override public String toFileString() { return taskId+"|"+title+"|"+category+"|"+dueDate+"|"+completed+"|"+(taskType!=null?taskType:""); }
    public String getTaskId()    { return taskId; }    public void setTaskId(String v)    { this.taskId=v; }
    public String getTitle()     { return title; }     public void setTitle(String v)     { this.title=v; }
    public String getCategory()  { return category; }  public void setCategory(String v)  { this.category=v; }
    public String getDueDate()   { return dueDate; }   public void setDueDate(String v)   { this.dueDate=v; }
    public boolean isCompleted() { return completed; } public void setCompleted(boolean v){ this.completed=v; }
    public String getTaskType()  { return taskType; }  public void setTaskType(String v)  { this.taskType=v; }
}
