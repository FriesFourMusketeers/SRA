/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnectionFactory;
import entity.Client;
import entity.FinalKPI;
import entity.KPI;
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
public class KpiDAO {

    public ArrayList<KPI> getAllKpi() {
        try {
            ArrayList<KPI> kpiList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from kpi";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                KPI kpi = new KPI();

                int clientkpiID = rs.getInt("clientID");
                String performanceArea = rs.getString("performanceArea");
                String performanceMeasure = rs.getString("performanceMeasure");
                String perforamnceTarget = rs.getString("target");
                double weight = rs.getDouble("weight");

                kpi.setClientKPI(clientkpiID);
                kpi.setPerformanceArea(performanceArea);
                kpi.setPerformanceMeasure(performanceMeasure);
                kpi.setTarget(perforamnceTarget);

                kpiList.add(kpi);
            }
            conn.close();
            return kpiList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<KPI> getAllKpiByClient(int clientID) {
        try {
            ArrayList<KPI> kpiList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from kpi k join `custom-kpi` ck on k.customKPI = ck.customKPI where k.clientID = ? group by k.customKPI";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, clientID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                KPI kpi = new KPI();

                int clientkpiID = rs.getInt("clientID");
                String performanceArea = rs.getString("performanceArea");
                int customKPI = rs.getInt("customKPI");

                kpi.setClientKPI(clientkpiID);
                kpi.setPerformanceArea(performanceArea);
                kpi.setCustomKPI(customKPI);

                kpiList.add(kpi);
            }
            conn.close();
            return kpiList;
        } catch (SQLException ex) {
            Logger.getLogger(KpiDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<KPI> getPMbyKPI(int KPI) {
        try {
            ArrayList<KPI> kpiList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from kpi k join `custom-measure` cm on k.customMeasure = cm.customMeasure where k.customKPI = ? ";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, KPI);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                KPI kpi = new KPI();

                int customMeasure = rs.getInt("customMeasure");
                String performanceMeasure = rs.getString("performanceMeasure");

                kpi.setCustomMeasure(customMeasure);
                kpi.setPerformanceMeasure(performanceMeasure);

                kpiList.add(kpi);
            }
            conn.close();
            return kpiList;
        } catch (SQLException ex) {
            Logger.getLogger(KpiDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean createNewKPI(KPI kpi) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query1 = "insert into `KPI-List`(clientID,kpiID,measureID,weight,greenTarget,yellowTarget,redTarget) values (?,?,?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query1);
            pstmt.setInt(1, kpi.getClientID());
            pstmt.setInt(2, kpi.getKpiID());
            pstmt.setInt(3, kpi.getMeasureID());
            pstmt.setDouble(4, kpi.getWeight());
            pstmt.setInt(5, kpi.getGreenTarget());
            pstmt.setInt(6, kpi.getYellowTarget());
            pstmt.setInt(7, kpi.getRedTarget());

            int rows = pstmt.executeUpdate();

            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<FinalKPI> getLastCustomKpi() {

        try {
            ArrayList<FinalKPI> kpiList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT * FROM `custom-kpi` ORDER BY customKPI DESC LIMIT 1";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                FinalKPI kpi = new FinalKPI();

                int customKPI = rs.getInt("customKPI");
                int clientID = rs.getInt("clientID");

                kpi.setKpiID(customKPI);
                kpi.setClientID(clientID);

                kpiList.add(kpi);
            }
            conn.close();
            return kpiList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<FinalKPI> getLastMeasure() {

        try {
            ArrayList<FinalKPI> kpiList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT * FROM `custom-measure` ORDER BY customMeasure DESC LIMIT 1";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                FinalKPI kpi = new FinalKPI();

                int customMeasure = rs.getInt("customMeasure");

                kpi.setMeasureID(customMeasure);

                kpiList.add(kpi);
            }
            conn.close();
            return kpiList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<KPI> getPerformanceArea() {

        try {
            ArrayList<KPI> kpiList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT performanceArea FROM kpi group by performanceArea";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                KPI kpi = new KPI();

                String performanceArea = rs.getString("performanceArea");

                kpi.setPerformanceArea(performanceArea);

                kpiList.add(kpi);
            }
            conn.close();
            return kpiList;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
