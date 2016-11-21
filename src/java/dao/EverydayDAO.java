/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnectionFactory;
import entity.Everyday;
import entity.Score;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JohnMichael
 */
public class EverydayDAO {

    public ArrayList<Everyday> getAllEveryday() {
        try {
            ArrayList<Everyday> everydayList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from everyday";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Everyday everyday = new Everyday();

                int employeeID = rs.getInt("employeeID");
                String attendance = rs.getString("employeeID");
                Date date = rs.getDate("date");

                everyday.setEmployeeID(employeeID);
                everyday.setAttendance(attendance);
                everyday.setDate(date);

                everydayList.add(everyday);
            }
            conn.close();
            return everydayList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean createNewEveryday(Everyday kpi) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query1 = "insert into `everyday`(employeeID,absence,date) values (?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query1);
            pstmt.setInt(1, kpi.getEmployeeID());
            pstmt.setString(2, kpi.getAttendance());
            pstmt.setDate(3, (java.sql.Date) kpi.getDate());

            int rows = pstmt.executeUpdate();

            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean createNewEveryday1(Everyday kpi) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into `violations`(everydayID,violations) values (?,?)";
            PreparedStatement pstmt2 = conn.prepareStatement(query);
            pstmt2.setInt(1, kpi.getEverydayID());
            pstmt2.setString(2, kpi.getViolations());
            int rows = pstmt2.executeUpdate();

            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean createNewEveryday2(Everyday kpi) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into `activity-log`(everydayID,activityLog) values (?,?)";
            PreparedStatement pstmt2 = conn.prepareStatement(query);
            pstmt2.setInt(1, kpi.getEverydayID());
            pstmt2.setString(2, kpi.getActivityLog());
            int rows = pstmt2.executeUpdate();

            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Everyday> getLastEveryday() {

        try {
            ArrayList<Everyday> everydayList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT * FROM `everyday` ORDER BY everydayID DESC LIMIT 1";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Everyday everyday = new Everyday();

                int everydayID = rs.getInt("everydayID");
                int employeeID = rs.getInt("employeeID");

                everyday.setEverydayID(everydayID);
                everyday.setEmployeeID(employeeID);

                everydayList.add(everyday);
            }
            conn.close();
            return everydayList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean addScore(Score score) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into `performance-review-scores`(score,employeeID,dateAnswered) values (?,?,?)";
            PreparedStatement pstmt2 = conn.prepareStatement(query);
            pstmt2.setDouble(1, score.getScore());
            pstmt2.setInt(2, score.getEmployeeID());
            pstmt2.setDate(3, (java.sql.Date) score.getDateAnswered());
            int rows = pstmt2.executeUpdate();

            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
