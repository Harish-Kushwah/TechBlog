/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

/**
 *
 * @author haris
 */

import com.tech.blog.entity.Category;
import com.tech.blog.entity.Post;
import com.tech.blog.entity.User;
import java.sql.*;
import java.util.ArrayList;
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> categories = new ArrayList<Category>();
        
        try{
        String query = "select * from public.categories;";
        
         PreparedStatement st = this.con.prepareStatement(query);
         ResultSet rs = st.executeQuery();
         while(rs.next()){
             Category category = new Category();
             category.setId(rs.getInt("id"));
             category.setName(rs.getString("name"));
             category.setDescription(rs.getString("description"));
             categories.add(category);
         }
             
         
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
         return categories;
    }
    
    public boolean addPost(Post post)
    {
        boolean flag = false;
        try{
            String query = "INSERT INTO public.post(title, content, code, pic, categories_id, user_id)VALUES (?, ?, ?, ?, ?, ?);";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setString(1, post.getTitle());
            st.setString(2, post.getContent());
            st.setString(3, post.getCode());
           
            st.setString(4, post.getPic());
            st.setInt(5, post.getCategories_id());
            st.setInt(6, post.getUser_id());
            st.execute();
            flag = true;
            
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
        return flag;
    }
    
    public ArrayList<Post> getAllPost()
    {
        ArrayList<Post> list = new ArrayList<>();
        
        try{
        String query = "select * from public.post order by id desc;";
        PreparedStatement st = this.con.prepareStatement(query);
        ResultSet res =  st.executeQuery();
        while(res.next())
        {
            int id = res.getInt("id");
            String title = res.getString("title");
            String content = res.getString("content");
            String code = res.getString("code");
            String pic = res.getString("pic");
            if(pic == null){
                pic = "defaultBlog.png";
            }
            int categories_id = res.getInt("categories_id");
            int userId = res.getInt("user_id");
             
            
            Post post = new Post();
            post.setContent(content);
            post.setCode(code);
            post.setCategories_id(categories_id);
            post.setId(id);
            post.setUser_id(userId);
            post.setPic(pic);
            post.setTitle(title);
            post.setDate(res.getTimestamp("date"));
            
            list.add(post);
          
        }
        
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        
        return list;
    }
    
    public Post getPostById(int postId)
    {
        Post post = null;
         try{
        String query = "select * from public.post where id = ? ;";
        
        PreparedStatement st = this.con.prepareStatement(query);
        st.setInt(1, postId);
        ResultSet res =  st.executeQuery();
        while(res.next())
        {
            int id = res.getInt("id");
            String title = res.getString("title");
            String content = res.getString("content");
            String code = res.getString("code");
            String pic = res.getString("pic");
            if(pic == null){
                pic = "defaultBlog.png";
            }
            int categories_id = res.getInt("categories_id");
            int userId = res.getInt("user_id");
             
            
            post = new Post();
            post.setContent(content);
            post.setCode(code);
            post.setCategories_id(categories_id);
            post.setId(id);
            post.setUser_id(userId);
            post.setPic(pic);
            post.setTitle(title);
            post.setDate(res.getTimestamp("date"));
            
           
          
        }
        
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        
        return post;
    }
    
    public ArrayList<Post> getPostByCatId(int catId)
    {
        ArrayList<Post> list = new ArrayList<>();
        
        try{
        String query = "select * from public.post where categories_id = ? order by id desc;";
        PreparedStatement st = this.con.prepareStatement(query);
        st.setInt(1, catId);
        
        ResultSet res =  st.executeQuery();
        while(res.next())
        {
            int id = res.getInt("id");
            String title = res.getString("title");
            String content = res.getString("content");
            String code = res.getString("code");
            String pic = res.getString("pic");
             if(pic == null){
                pic = "defaultBlog.png";
            }
            int categories_id = res.getInt("categories_id");
            int userId = res.getInt("user_id");
             
            
            Post post = new Post();
            post.setContent(content);
            post.setCode(code);
            post.setCategories_id(categories_id);
            post.setId(id);
            post.setUser_id(userId);
            post.setPic(pic);
            post.setTitle(title);
            post.setDate(res.getTimestamp("date"));
            
            list.add(post);
          
        }
        
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        
        return list;
    }
    public ArrayList<Post> getPostByUserId(int user_id)
    {
        ArrayList<Post> list = new ArrayList<>();
        
        try{
        String query = "select * from public.post where user_id = ? order by id desc;";
        PreparedStatement st = this.con.prepareStatement(query);
        st.setInt(1, user_id);
        
        ResultSet res =  st.executeQuery();
        while(res.next())
        {
            int id = res.getInt("id");
            String title = res.getString("title");
            String content = res.getString("content");
            String code = res.getString("code");
            String pic = res.getString("pic");
             if(pic == null){
                pic = "defaultBlog.png";
            }
            int categories_id = res.getInt("categories_id");
            int userId = res.getInt("user_id");
             
            
            Post post = new Post();
            post.setContent(content);
            post.setCode(code);
            post.setCategories_id(categories_id);
            post.setId(id);
            post.setUser_id(userId);
            post.setPic(pic);
            post.setTitle(title);
            post.setDate(res.getTimestamp("date"));
            
            list.add(post);
          
        }
        
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        
        return list;
    }
    public ArrayList<Post> getPostByCatUserId(int user_id , int cat_id)
    {
        ArrayList<Post> list = new ArrayList<>();
        
        try{
        String query = "select * from public.post where user_id = ? and categories_id = ? order by id desc;";
        PreparedStatement st = this.con.prepareStatement(query);
        st.setInt(1, user_id);
        st.setInt(2, cat_id);
        
        ResultSet res =  st.executeQuery();
        while(res.next())
        {
            int id = res.getInt("id");
            String title = res.getString("title");
            String content = res.getString("content");
            String code = res.getString("code");
            String pic = res.getString("pic");
             if(pic == null){
                pic = "defaultBlog.png";
            }
            int categories_id = res.getInt("categories_id");
            int userId = res.getInt("user_id");
             
            
            Post post = new Post();
            post.setContent(content);
            post.setCode(code);
            post.setCategories_id(categories_id);
            post.setId(id);
            post.setUser_id(userId);
            post.setPic(pic);
            post.setTitle(title);
            post.setDate(res.getTimestamp("date"));
            
            list.add(post);
          
        }
        
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        
        return list;
    }
}
