package com.tech.blog.dao;

import com.tech.blog.entity.Post;
import com.tech.blog.entity.Stats;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author haris
 */
public class StatsDao {
    private Connection con;

    public StatsDao(Connection con) {
        this.con = con;
    }
    
    public boolean initStats(int user_id){
        boolean flag = false;
        try{
            String query = "INSERT INTO public.stats(user_id) VALUES (?);";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setInt(1, user_id);
            
            st.executeQuery();
            flag = true;
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
    
        return flag;
    }
    
    public Stats getStats(int user_id){
        try{
            String query = "SELECT * FROM public.stats where user_id=?";
            PreparedStatement st = this.con.prepareStatement(query);
            
            st.setInt(1, user_id);
            ResultSet set = st.executeQuery();
            while(set.next()){
                int id = set.getInt("id");
                int score = set.getInt("score");
                int total_likes = set.getInt("total_likes");
                int total_posts = set.getInt("total_posts");
                int streek = set.getInt("streek");
                
                Stats stat = new Stats(id, total_posts,  total_likes, streek, score );
                
                return stat;
            }
        }
        catch(Exception exp){
         exp.printStackTrace();
        }
        return new Stats();
    }
    public boolean updateTotalPostCount(int user_id){
        boolean flag = false;
        Stats stat = getStats(user_id);
        int total_posts = stat.getTotal_posts() + 1;
        stat.setTotal_posts(total_posts);
         int score = getScore(stat);
        try{
            String query = "update public.stats set total_posts = ? , score = ? where user_id = ?";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setInt(1,total_posts);
            st.setInt(2, score);
            st.setInt(3, user_id);
            st.executeUpdate();
            flag = true;
        }catch(Exception exp){
            exp.printStackTrace();
        }
        System.out.println("hello post likes by" + user_id);
        return flag;
    }
    
    public int getScore(Stats stat){
        return stat.getTotal_likes()*2 + stat.getTotal_posts()*5;
        
    }
    public boolean updateTotalLikes(int user_id){
        boolean flag = false;
        Stats stat = getStats(user_id);
        int total_likes = stat.getTotal_likes()+ 1;
        stat.setTotal_likes(total_likes);
        int score = getScore(stat);
        
        try{
            String query = "update public.stats set total_likes = ? , score = ? where user_id = ?";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setInt(1,total_likes);
            st.setInt(2, score);
            st.setInt(3, user_id);
            st.executeUpdate();
            flag = true;
        }catch(Exception exp){
            exp.printStackTrace();
        }
        
        return flag;
    }
     public boolean updateTotalDislike(int user_id){
        boolean flag = false;
        Stats stat = getStats(user_id);
        int total_likes = stat.getTotal_likes()- 1;
         stat.setTotal_likes(total_likes);
        int score = getScore(stat);
         try{
            String query = "update public.stats set total_likes = ? , score = ? where user_id = ?";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setInt(1,total_likes);
            st.setInt(2, score);
            st.setInt(3, user_id);
            st.executeUpdate();
            flag = true;
        }catch(Exception exp){
            exp.printStackTrace();
        }
        
        return flag;
    }
    
    
}
