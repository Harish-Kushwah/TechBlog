package com.tech.blog.dao;

/**
 *
 * @author haris
 */
import com.tech.blog.entity.User;
import java.sql.*;

public class UserDao {

    private Connection con;
    StatsDao statsDao = null;

    public UserDao(Connection con) {
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
    
    //Insert user to database
    public boolean saveUser(User user) {
        boolean isDataInsert = false;
        try {
            String query = "INSERT INTO public.user( name, email, password, gender, about,profile) VALUES (?, ?, ?, ?, ?,?);";
            PreparedStatement statement = this.con.prepareStatement(query);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getGender());
            statement.setString(5, user.getAbout());
            statement.setString(6, user.getProfile());
            

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
//                if(profile_name==null){
//                    user.setProfile("default.jpg");
//                }
//                else{
//                    user.setProfile(profile_name);
//                }
            }
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        return user;
    }
    public User userById(int user_id)
    {
        User user = null;
        try{
            String query = "SELECT * FROM public.user where id = ?;";
            
            PreparedStatement statement = this.con.prepareStatement(query);
            statement.setInt(1, user_id);
            
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
//                if(profile_name==null){
//                    user.setProfile("default.jpg");
//                }
//                else{
//                    user.setProfile(profile_name);
//                }
            }
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user)
    {
        boolean flag = false;
        try{
            String query = "Update public.user set name=?,email=?,password=?,about=?,profile=? where id=?";
            PreparedStatement statement = this.con.prepareStatement(query);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getAbout());
            statement.setString(5, user.getProfile());
            statement.setInt(6, user.getId());
            
            statement.executeUpdate();
            flag = true;
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        return flag;
    }

}
