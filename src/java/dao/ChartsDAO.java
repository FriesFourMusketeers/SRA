/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnectionFactory;
import entity.Employee;
import entity.PerformanceReviewScores;
import entity.Charts;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author see_h
 */
public class ChartsDAO {
    /*
     This is for getting all Grades from PRS table
     */

    public ArrayList<PerformanceReviewScores> getPerformanceGrade() {
        try {
            ArrayList<PerformanceReviewScores> prsList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `performance-review-scores`";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                PerformanceReviewScores prs = new PerformanceReviewScores();

                int scoreID = rs.getInt("scoreID");
                int score = rs.getInt("score");
                int employeeID = rs.getInt("employeeID");
                Date dateAnswered = rs.getDate("dateAnswered");

                prs.setEmployeeID(employeeID);
                prs.setScoreID(scoreID);
                prs.setScore(score);
                prs.setDateAnswered(dateAnswered);

                prsList.add(prs);
            }
            conn.close();
            return prsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<PerformanceReviewScores> getPerformanceGradeByYear(int year) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `performance-review-scores` where year(dateAnswered) =? order by employeeID";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, year);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<PerformanceReviewScores> prT = null;
            PerformanceReviewScores prs;
            if (rs.next()) {
                prT = new ArrayList();
                do {
                    prs = new PerformanceReviewScores();
                    prs.setEmployeeID(rs.getInt("employeeID"));
                    prs.setScoreID(rs.getInt("scoreID"));
                    prs.setScore(rs.getInt("score"));
                    prs.setDateAnswered(rs.getDate("dateAnswered"));

                    prT.add(prs);
                } while (rs.next());

                System.out.println(year);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return prT;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<PerformanceReviewScores> getPerformanceGradeByTotal(int year) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select employeeID, dateAnswered, sum(score) from `performance-review-scores` where year(dateAnswered) = 2013 group by employeeID, year(dateAnswered)=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, year);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<PerformanceReviewScores> prT = null;
            PerformanceReviewScores prs;
            if (rs.next()) {
                prT = new ArrayList();
                do {
                    prs = new PerformanceReviewScores();
                    prs.setEmployeeID(rs.getInt("employeeID"));
                    prs.setScoreID(rs.getInt("scoreID"));
                    prs.setScore(rs.getInt("score"));
                    prs.setDateAnswered(rs.getDate("dateAnswered"));

                    prT.add(prs);
                } while (rs.next());

                System.out.println(year);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return prT;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<PerformanceReviewScores> getPerformanceGradeByID(int id) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `performance-review-scores` where employeeID=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<PerformanceReviewScores> prT = null;
            PerformanceReviewScores prs;
            if (rs.next()) {
                prT = new ArrayList();
                do {
                    prs = new PerformanceReviewScores();
                    prs.setScoreID(rs.getInt("scoreID"));
                    prs.setEmployeeID(rs.getInt("employeeID"));
                    prs.setScore(rs.getInt("score"));
                    prs.setDateAnswered(rs.getDate("dateAnswered"));

                    prT.add(prs);
                } while (rs.next());

                System.out.println(id);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return prT;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getTicketsPerMonth() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "Select year(complaintDate), month(complaintDate),count(ticketID) from tickets group by year(complaintDate), month(complaintDate);  ";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();

                    String month = "";

                    int intMonth = rs.getInt("month(complaintDate)");

                    switch (intMonth) {
                        case 1:
                            month = "January";
                            break;
                        case 2:
                            month = "February";
                            break;
                        case 3:
                            month = "March";
                            break;
                        case 4:
                            month = "April";
                            break;
                        case 5:
                            month = "May";
                            break;
                        case 6:
                            month = "June";
                            break;
                        case 7:
                            month = "July";
                            break;
                        case 8:
                            month = "August";
                            break;
                        case 9:
                            month = "September";
                            break;
                        case 10:
                            month = "October";
                            break;
                        case 11:
                            month = "November";
                            break;
                        case 12:
                            month = "December";
                            break;
                    }

                    chart.setTicketMonth(month);
                    chart.setTicketYear(Integer.toString(rs.getInt("year(complaintDate)")));
                    chart.setTicketPerM(rs.getInt("count(ticketID)"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getTicketsPerYear() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "Select year(complaintDate), count(ticketID) from tickets group by year(complaintDate);  ";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setTicketYear(Integer.toString(rs.getInt("year(complaintDate)")));
                    chart.setTicketPerY(rs.getInt("count(ticketID)"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getTicketsPerSeverity() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "Select severity, count(ticketID) from tickets group by severity; ";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setTicketSeverity(rs.getString("severity"));
                    chart.setSeverityCount(rs.getInt("count(ticketID)"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getTicketsPerStatus() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "Select status, count(ticketID) from tickets group by status;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setTicketStatus(rs.getString("status"));
                    chart.setStatusCount(rs.getInt("count(ticketID)"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getSSERAverage() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select *, c.clientID, c.clientName, sum(cs.SSERscore)/count(c.clientName) as 'score', c.type from `client-score` cs join Client c where cs.clientID = c.clientID group by c.clientName;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setClientName(rs.getString("c.clientName"));
                    chart.setSserAverage(rs.getInt("score"));
                    chart.setClientID(rs.getInt("c.clientID"));
                    chart.setClientType(rs.getString("c.type"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getClientGradebyID(int year, int id) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select c.clientName, cs.clientID, YEAR(cs.date) as 'year', MONTHNAME(STR_TO_DATE(Month(cs.date), '%m')) as 'month', cs.SSERscore as `score` from `client-score` cs join Client c where cs.clientID = c.clientID AND YEAR(cs.date) = ? AND cs.clientID=? order by 'month';";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, year);
            pstmt.setInt(2, id);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setClientName(rs.getString("c.clientName"));
                    chart.setClientID(rs.getInt("cs.clientID"));
                    chart.setSserAverage(rs.getInt("score"));

                    chart.setSserMonth(rs.getString("month"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getEmployeesScorePerMonth() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select YEAR(prs.dateAnswered),MONTH(prs.dateAnswered), prs.employeeID, p.lastName,p.firstName, SUM(prs.score) ,COUNT(MONTH(prs.dateAnswered)), SUM(prs.score)/COUNT(MONTH(prs.dateAnswered)) as 'Score Per Month' from `performance-review-scores` prs join allocation a on prs.employeeID = a.employeeID join `Employee-Safeguard-Information` si on a.employeeID = si.employeeID join `Employee-Personal-Information` p on p.employeeID = si.employeeID group by prs.employeeID, YEAR(prs.dateAnswered),MONTH(prs.dateAnswered) where prs.employeeID = ?;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();

                    chart.setEmployeeID(rs.getInt("prs.employeeID"));
                    chart.setEmployeeName(rs.getString("p.lastName") + ", " + rs.getString("p.firstName"));

                    String month = "";

                    int intMonth = rs.getInt("MONTH(dateAnswered)");

                    switch (intMonth) {
                        case 1:
                            month = "January";
                            break;
                        case 2:
                            month = "February";
                            break;
                        case 3:
                            month = "March";
                            break;
                        case 4:
                            month = "April";
                            break;
                        case 5:
                            month = "May";
                            break;
                        case 6:
                            month = "June";
                            break;
                        case 7:
                            month = "July";
                            break;
                        case 8:
                            month = "August";
                            break;
                        case 9:
                            month = "September";
                            break;
                        case 10:
                            month = "October";
                            break;
                        case 11:
                            month = "November";
                            break;
                        case 12:
                            month = "December";
                            break;
                    }

                    chart.setEmployeeMonth(month);
                    chart.setEmployeeYear(Integer.toString(rs.getInt("YEAR(dateAnswered)")));
                    chart.setEmployeePerM(rs.getInt("SUM(score)/COUNT(MONTH(dateAnswered))"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getQualifiedEmployees() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "Select COUNT(employeeID) from `employee-personal-information` where status = 'Qualified';";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setQualifiedGuards(rs.getInt("COUNT(employeeID)"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getNumberOfApplicants(int year) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "Select YEAR(contractStart) as 'year', MONTHNAME(STR_TO_DATE(Month(contractStart), '%m')) as `month` , COUNT(employeeID) as 'count' from `employee-safeguard-information` where YEAR(contractStart) = ? group by MONTH(contractStart), YEAR(contractStart) order by YEAR(contractStart), MONTH(contractStart);";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, year);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setApplicantCount(rs.getInt("count"));
                    chart.setDateInputtedMonth(rs.getString("month"));
                    chart.setDateInputtedYear(rs.getString("year"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getNumberOfQualifiedApplicants(int year) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select YEAR(e.dateInputted) as 'year', MONTHNAME(STR_TO_DATE(Month(e.dateInputted), '%m')) as 'month', COUNT(e.employeeID) as 'count', e.status from `employee-personal-information` e where YEAR(e.dateInputted) =? AND e.status != 'Not Qualified' AND e.status != 'Temporary' AND e.status != 'Terminated' AND e.status != 'Interview Scheduled' group by MONTH(dateInputted), YEAR(dateInputted);";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, year);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setApplicantCount(rs.getInt("count"));
                    chart.setDateInputtedMonth(rs.getString("month"));
                    chart.setDateInputtedYear(rs.getString("year"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> viewLicenseChart() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "Select COUNT(employeeID) as 'Count', license from allocation group by license;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setLicenseCount(rs.getInt("Count"));
                    chart.setLicenseType(rs.getString("license"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public double getAverageSafeguardScore() {

        double total = 0;
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select COUNT(prs.dateAnswered), SUM(prs.score) ,COUNT(MONTH(prs.dateAnswered)), SUM(prs.score)/COUNT(prs.dateAnswered) as 'Average Employee Score' from `performance-review-scores` prs join allocation a on prs.employeeID = a.employeeID;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                do {

                    total += (rs.getDouble("Average Employee Score") * .7);

                } while (rs.next());
            }

            query = "select sum(SSERscore)/count(clientName) as 'Average SSER Score' from `client-score`;";
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            if (rs.next()) {

                do {

                    total += (rs.getDouble("Average SSER Score") * .3);

                } while (rs.next());
            }
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }

        return total;

    }

    public ArrayList<Charts> viewAllApplicantsStatus() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select status, count(employeeID) as 'count' from `employee-personal-information` group by status;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setCount(rs.getInt("count"));
                    chart.setStatus(rs.getString("status"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> viewAllApplicantsPlaces() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select count(employeeID) as 'count', city from `employee-personal-information` group by city;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setCity(rs.getString("city"));
                    chart.setCount(rs.getInt("count"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getSafeguardScorePerM() {

        ArrayList<Charts> sserScore = new ArrayList();

        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select YEAR(cs.date) as 'year', MONTHNAME(STR_TO_DATE(Month(cs.date), '%m')) as 'month', avg(SSERscore) as `score` from `client-score` cs join Client c on cs.clientID = c.clientID group by Year(cs.date), Month(cs.date) order by 'month';";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                do {
                    Charts chart = new Charts();

                    chart.setSserYear(rs.getString("year"));
                    chart.setSserMonth(rs.getString("month"));
                    chart.setSserScore(rs.getDouble("score"));

                    sserScore.add(chart);

                } while (rs.next());
            }

            query = "select a.clientID, avg(prs.score),YEAR(prs.dateAnswered) as 'year', MONTHNAME(STR_TO_DATE(Month(prs.dateAnswered), '%m')) as 'month', Month(prs.dateAnswered) from `performance-review-scores` prs join allocation a on prs.employeeID = a.employeeID group by clientID, year(dateAnswered), month(dateAnswered);";
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            if (rs.next()) {

                do {

                    for (int i = 0; i < sserScore.size(); i++) {

                        if (sserScore.get(i).getSserMonth().equalsIgnoreCase(rs.getString("month"))
                                && sserScore.get(i).getSserYear().equalsIgnoreCase(rs.getString("year"))) {
                            sserScore.get(i).setSserScore((sserScore.get(i).getSserScore() * 0.3) + (rs.getDouble("avg(prs.score)") * 0.7));

                        }

                    }

                } while (rs.next());
            }
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }

        return sserScore;

    }

    public ArrayList<Charts> getSafeguardScorePerW(int year) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "Select Year(dateAnswered) as 'year', WEEK(dateAnswered) as 'week', MONTHNAME(STR_TO_DATE(Month(dateAnswered), '%m')) as 'month' ,avg(score) as 'score' from `Performance-Review-Scores` where Year(dateAnswered)=? group by yearweek(dateAnswered);";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, year);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setSserYear(rs.getString("year"));
                    chart.setSserWeek("Week " + rs.getString("week"));
                    chart.setSserMonth(rs.getString("month"));
                    chart.setSserScore(rs.getInt("score"));

                    chartsList.add(chart);
                } while (rs.next());

            }

            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getClientScorePerW(int clientID) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "Select a.clientID, Year(prs.dateAnswered),week(prs.dateAnswered),avg(prs.score) from `Performance-Review-Scores` prs join allocation a on prs.employeeID = a.employeeID where a.clientID = ? group by  yearweek(dateAnswered);` group by  yearweek(dateAnswered);";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, clientID);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Charts> chartsList = null;
            Charts chart;
            if (rs.next()) {
                chartsList = new ArrayList();
                do {
                    chart = new Charts();
                    chart.setSserYear(rs.getString("Year(dateAnswered)"));
                    chart.setSserWeek(rs.getString("week(dateAnswered)"));
                    chart.setSserAverage(rs.getInt("avg(score)"));

                    chartsList.add(chart);
                } while (rs.next());

            }
            rs.close();
            pstmt.close();
            conn.close();
            return chartsList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Charts> getSafeguardScorePerY(int year) {

        ArrayList<Charts> sserScore = new ArrayList();

        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select YEAR(cs.date) as 'year', MONTHNAME(STR_TO_DATE(Month(cs.date), '%m')) as 'month', avg(SSERscore) as `score` from `client-score` cs join Client c on cs.clientID = c.clientID where YEAR(cs.date) = ? group by Year(cs.date), Month(cs.date) order by 'month';";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, year);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                do {
                    Charts chart = new Charts();
                    chart.setSserYear(rs.getString("year"));
                    chart.setSserMonth(rs.getString("month"));
                    chart.setSserScore(rs.getDouble("score"));

                    sserScore.add(chart);

                } while (rs.next());
            }

            query = "select a.clientID, avg(prs.score),YEAR(prs.dateAnswered) as 'year', MONTHNAME(STR_TO_DATE(Month(prs.dateAnswered), '%m')) as 'month', Month(prs.dateAnswered) from `performance-review-scores` prs join allocation a on prs.employeeID = a.employeeID where YEAR(prs.dateAnswered) = ? group by a.clientID, year(prs.dateAnswered), month(prs.dateAnswered);";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, year);
            rs = pstmt.executeQuery();

            if (rs.next()) {

                do {

                    for (int i = 0; i < sserScore.size(); i++) {

                        if (sserScore.get(i).getSserMonth().equalsIgnoreCase(rs.getString("month"))
                                && sserScore.get(i).getSserYear().equalsIgnoreCase(rs.getString("year"))) {
                            sserScore.get(i).setSserScore((sserScore.get(i).getSserScore() * 0.3) + (rs.getDouble("avg(prs.score)") * 0.7));

                        }

                    }

                } while (rs.next());
            }
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }

        return sserScore;

    }

}
