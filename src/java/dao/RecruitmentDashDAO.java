/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnectionFactory;
import entity.TicketRecruitment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author see_h
 */
public class RecruitmentDashDAO {
    
    public int getAverageNewClientsDetails() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT COUNT(clientID) AS `count` FROM Client where dateJoined BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment recruitment = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));

                recruitment.setCount(count);

            return count;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public int getAverageApplicantsDetails() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT COUNT(employeeID) AS `count` FROM `Employee-Personal-Information` where status='Qualified' OR status='Interview Scheduled' OR status = 'Not Qualified'";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment recruitment = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));

                recruitment.setCount(count);

            return count;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public int getAverageHiredApplicantsDetails() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT epi.status, epi.employeeID, esi.employeeID, esi.contractStart, esi.contractEnd, COUNT(esi.employeeID) AS `count` \n" +
"FROM `Employee-Personal-Information` epi JOIN `Employee-Safeguard-Information` esi ON epi.employeeID=esi.employeeID\n" +
"where (esi.contractStart BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()) AND (epi.status='Qualified' OR epi.status='Active')";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment recruitment = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));

                recruitment.setCount(count);

            return count;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
     public int getApplicantsNeedToHireDetails() {
         //not fixed yet! currently acquiring the # of buffer # of guards of the comp as of jan 22 (SUN)
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment recruitment = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));

                recruitment.setCount(count);

            return count;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
}
