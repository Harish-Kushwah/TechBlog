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
}
