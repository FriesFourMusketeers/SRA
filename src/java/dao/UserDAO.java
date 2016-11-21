/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnectionFactory;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author John San Agustin
 */
public class UserDAO {
    
    public ArrayList<User> getAllUsers() {
        try {
            ArrayList<User> userList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from users";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                User user = new User();

                String employeeID = rs.getString("employeeID");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String position = rs.getString("position");

                user.setEmployeeID(employeeID);
                user.setUsername(username);
                user.setPassword(password);
                user.setEmail(email);
                user.setPosition(position);

                userList.add(user);
            }
            conn.close();
            return userList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

 /*  
    These 2 functions might be needed for future purposes
    */
    
//    public User getUser(String username) {
//        try {
//            User user = new User();
//            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
//            Connection conn = myFactory.getConnection();
//            String query = "select * from users where username=?";
//            PreparedStatement pstmt = conn.prepareStatement(query);
//            pstmt.setString(1, username);
//            ResultSet rs = pstmt.executeQuery();
//
//            while (rs.next()) {
//                String employeeID = rs.getString("employeeID");
//                String username1 = rs.getString("username");
//                String password = rs.getString("password");
//
//                user.setEmployeeID(employeeID);
//                user.setUsername(username1);
//                user.setPassword(password);
//            }
//            conn.close();
//            return user;
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }
//
// 
//    public boolean checkUser(String username) {
//        boolean verify = false;
//        try {
//            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
//            Connection conn = myFactory.getConnection();
//            String query = "select * from users where username=?";
//            PreparedStatement pstmt = conn.prepareStatement(query);
//            pstmt.setString(1, username);
//            ResultSet rs = pstmt.executeQuery();
//            verify = rs.next();
//            conn.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return verify;
//    }
//
    /*
    This function adds a new user
    */
    public boolean createNewUser(User user) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into users(employeeID,username,password,email,position) values (?,?,password(?),?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, user.getEmployeeID());
            pstmt.setString(2, user.getUsername());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPosition());
            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /*
    This function verifies the user
    */
    
    public boolean verifyAccount(User user) {
        boolean valid = false;
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from users where username=? and password=password(?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            ResultSet rs = pstmt.executeQuery();
            

            if (rs.next()) {
                valid = true;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return valid;
    }
    
}
