package com.ttt.component06.model;

import com.ttt.shared.FileOperations;

/** COMPONENT 06 — AdminActivity Model | OOP: ENCAPSULATION · INTERFACE */
public class AdminActivity implements FileOperations {
    private String logId;
    private String action;
    private String timestamp;

    public AdminActivity() {}

    public AdminActivity(String logId, String action, String timestamp) {
        this.logId = logId;
        this.action = action;
        this.timestamp = timestamp;
    }

    @Override
    public String toFileString() {
        return logId + "|" + action + "|" + timestamp;
    }

    public String getLogId() { return logId; }
    public void setLogId(String logId) { this.logId = logId; }

    public String getAction() { return action; }
    public void setAction(String action) { this.action = action; }

    public String getTimestamp() { return timestamp; }
    public void setTimestamp(String timestamp) { this.timestamp = timestamp; }
}
