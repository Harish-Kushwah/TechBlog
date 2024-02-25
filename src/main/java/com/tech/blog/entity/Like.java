package com.tech.blog.entity;

import java.sql.Timestamp;

/**
 *
 * @author haris
 */
public class Like {
    private int id,pid,uid;
    private Timestamp date;

    public Like(int id, int pid, int uid, Timestamp date) {
        this.id = id;
        this.pid = pid;
        this.uid = uid;
        this.date = date;
    }

    public Like() {
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
}
