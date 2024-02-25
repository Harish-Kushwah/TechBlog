package com.tech.blog.dao;

import com.tech.blog.entity.Post;
import com.tech.blog.entity.User;
import java.sql.*;

/**
 *
 * @author haris
 */
public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    public boolean addLike(int pid , int uid)
    {
        boolean flag = false;
        try{
        String query = "insert into public.like(pid,uid) values(?,?); ";
        
        PreparedStatement st = this.con.prepareStatement(query);
        st.setInt(1, pid);
        st.setInt(2, uid);
        
        
        st.execute();
        flag = true;
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
        return flag;
    }
    
    public int getTotalLikes(int pid)
    {
       
        String query = "select COUNT(*) as total_likes  from public.like where pid= ?;";
        try{
        
        PreparedStatement st = this.con.prepareStatement(query);
        st.setInt(1, pid);
        
        
        ResultSet set =  st.executeQuery();
        while(set.next()){
            return set.getInt("total_likes");
        }
       
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
        return 0;
    }
    public boolean isPostLikedByUser(int pid , int uid)
    {
         boolean flag = false;
        try{
        String query = "select COUNT(*) as total_likes  from public.like where pid= ? and uid=?; ";
        
        PreparedStatement st = this.con.prepareStatement(query);
        st.setInt(1, pid);
        st.setInt(2, uid);
        
        
         ResultSet set = st.executeQuery();
         if(set.next()){
             int count = set.getInt("total_likes");
             System.out.println(count);
             if(count>0){
               flag = true;
             }else{
                 return false;
             }
         }
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
        return flag;
    }
    
    public void deleteLike(int pid ,int uid){
    
        try{
        String query = "delete  from public.like where pid=? and uid=?; ";
        
        PreparedStatement st = this.con.prepareStatement(query);
        st.setInt(1, pid);
        st.setInt(2, uid);
        
        
          st.executeUpdate();
         
         
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
       
    }
}
