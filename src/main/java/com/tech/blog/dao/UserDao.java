/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

/**
 *
 * @author haris
 */
import com.tech.blog.entity.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //Insert user to database
    public boolean saveUser(User user) {
        boolean isDataInsert = false;
        try {
            String query = "INSERT INTO public.user( name, email, password, gender, about) VALUES (?, ?, ?, ?, ?);";
            PreparedStatement statement = this.con.prepareStatement(query);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getGender());
            statement.setString(5, user.getAbout());

            statement.executeUpdate();
            isDataInsert = true;

        } catch (Exception exp) {
            exp.printStackTrace();
        }

        return isDataInsert;
    }
    
    public User userByEmailAndPassword(String email , String password){
        User user = null;
        try{
            String query = "SELECT * FROM public.user where email=? and password=?";
            
            PreparedStatement statement = this.con.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password);
            
            ResultSet res = statement.executeQuery();
            if(res.next()){
                user = new User();
                user.setName(res.getString("name"));
                user.setEmail(res.getString("email"));
                user.setPassword(res.getString("password"));
                user.setAbout(res.getString("about"));
                user.setId(res.getInt("id"));
                user.setGender(res.getString("gender"));
                user.setReg_date(res.getTimestamp("reg_date"));
                user.setProfile(res.getString("profile"));
            }
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        return user;
    }
}
