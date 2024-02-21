package com.tech.blog.entity;

import java.sql.Timestamp;

/**
 *
 * @author haris
 */
public class Post {
    private int id;
    private String title,content,code,pic;
    private Timestamp date;
    private int categories_id;
    private int user_id;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Post(int id, String title, String content, String code, String pic, Timestamp date, int categories_id) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.date = date;
        this.categories_id = categories_id;
    }

    public Post() {
    }

    public Post(String title, String content, String code, String pic, Timestamp date, int categories_id) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.date = date;
        this.categories_id = categories_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getCategories_id() {
        return categories_id;
    }

    public void setCategories_id(int categories_id) {
        this.categories_id = categories_id;
    }

    @Override
    public String toString() {
        return "Post{" + "id=" + id + ", title=" + title + ", content=" + content + ", code=" + code + ", pic=" + pic + ", date=" + date + ", categories_id=" + categories_id + "user_id"  + user_id+ '}';
    }
    
    
}
