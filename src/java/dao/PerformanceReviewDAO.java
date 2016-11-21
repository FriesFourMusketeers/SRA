/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnectionFactory;
import entity.KPI;
import entity.KPIAlignment;
import entity.PerformanceRevTemplate;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JohnMichael
 */
public class PerformanceReviewDAO {

    public ArrayList<PerformanceRevTemplate> getAllPRTbyClient(int client) {
        try {
            ArrayList<PerformanceRevTemplate> prtList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select prt.prtID, prt.kpiID, prt.clientID, cq.question, cq.type, k.weight, c.clientName \n"
                    + "from `performance-review-template` prt join `custom-questions` cq on prt.customQuestion = cq.customQuestion \n"
                    + "join KPI k on prt.kpiID = k.finalKPI \n"
                    + "join Client c on k.clientID = c.clientID \n"
                    + "where prt.clientID = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, client);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                PerformanceRevTemplate prt = new PerformanceRevTemplate();

                int prtID = rs.getInt("prtID");
                int kpiID = rs.getInt("kpiID");
                int clientID = rs.getInt("clientID");
                String question = rs.getString("question");
                String type = rs.getString("type");
                double weight = rs.getDouble("weight");
                String clientName = rs.getString("clientName");

                prt.setPrtID(prtID);
                prt.setKpiID(kpiID);
                prt.setClientID(clientID);
                prt.setQuestion(question);
                prt.setType(type);
                prt.setWeight(weight);
                prt.setClientName(clientName);
                
                prtList.add(prt);
            }
            conn.close();
            return prtList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean createNewPRT1(KPIAlignment kpi) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into `custom-questions`(question,type) values (?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, kpi.getQuestion());
            pstmt.setString(2, kpi.getQuestionType());

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean createNewPRT(KPIAlignment kpi) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into `performance-review-template`(kpiID,clientID,questionID) values (?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, kpi.getKpiID());
            pstmt.setString(2, kpi.getClientID());
            pstmt.setString(3, kpi.getQuestionID());

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<KPIAlignment> getLastCustomQuestion() {

        try {
            ArrayList<KPIAlignment> kpiList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT * FROM `custom-questions` ORDER BY customQuestion DESC LIMIT 1";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                KPIAlignment kpi = new KPIAlignment();

                String question = rs.getString("customQuestion");

                kpi.setQuestionID(question);

                kpiList.add(kpi);
            }
            conn.close();
            return kpiList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public KPI getKPIforPRT(String clientN, String perfA, String perfM) {

        try {
            KPI kpi = new KPI();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `client-kpi` where clientName=? and performanceArea=? and performanceMeasure=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, clientN);
            pstmt.setString(2, perfA);
            pstmt.setString(3, perfM);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int clientkpiID = rs.getInt("clientID");
                String performanceArea = rs.getString("performanceArea");
                String performanceMeasure = rs.getString("performanceMeasure");
                String perforamnceTarget = rs.getString("target");
                double weight = rs.getDouble("weight");

                kpi.setClientKPI(clientkpiID);
                kpi.setPerformanceArea(performanceArea);
                kpi.setPerformanceMeasure(performanceMeasure);
                kpi.setTarget(perforamnceTarget);

            }
            pstmt.close();
            conn.close();
            return kpi;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
