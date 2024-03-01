/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entity;

/**
 *
 * @author haris
 */
public class Stats {
    int id,total_posts,total_likes,streek,score,user_id;

    @Override
    public String toString() {
        return "StatsDao{" + "id=" + id + ", total_posts=" + total_posts + ", total_likes=" + total_likes + ", streek=" + streek + ", score=" + score + ", user_id=" + user_id + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTotal_posts() {
        return total_posts;
    }

    public void setTotal_posts(int total_posts) {
        this.total_posts = total_posts;
    }

    public int getTotal_likes() {
        return total_likes;
    }

    public void setTotal_likes(int total_likes) {
        this.total_likes = total_likes;
    }

    public int getStreek() {
        return streek;
    }

    public void setStreek(int streek) {
        this.streek = streek;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Stats(int id, int total_posts, int total_likes, int streek, int score) {
        this.id = id;
        this.total_posts = total_posts;
        this.total_likes = total_likes;
        this.streek = streek;
        this.score = score;
       
    }

    public Stats() {
    }
    
}
