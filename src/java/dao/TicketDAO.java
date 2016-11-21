package dao;

import db.DBConnectionFactory;
import entity.Ticket;
import entity.TicketRecruitment;
import entity.User;
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
 * @author John San Agustin
 */
public class TicketDAO {

    public ArrayList<Ticket> getAllTickets() {
        try {
            ArrayList<Ticket> TicketList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from tickets";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Ticket ticket = new Ticket();

                int ticketID = rs.getInt("ticketID");
                int guardInvolved = rs.getInt("guardInvolved");
                Date complaintDate = rs.getDate("complaintDate");
                String subject = rs.getString("subject");
                String status = rs.getString("status");
                String complaintDetails = rs.getString("complaintDetails");
                int establishment = rs.getInt("establishment");
                String severity = rs.getString("severity");

                ticket.setTicketID(ticketID);
                ticket.setGuardInvolved(guardInvolved);
                ticket.setComplaintDate(complaintDate);
                ticket.setSubject(subject);
                ticket.setStatus(status);
                ticket.setComplaintDetails(complaintDetails);
                ticket.setEstablishment(establishment);
                ticket.setSeverity(severity);

                TicketList.add(ticket);
            }
            conn.close();
            return TicketList;
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
    public boolean createNewTicket(Ticket ticket) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into tickets(ticketID,guardInvolved,subject,status,complaintDetails,establishment,severity,complaintDate) values (?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ticket.getTicketID());
            pstmt.setInt(2, ticket.getGuardInvolved());
            pstmt.setString(3, ticket.getSubject());
            pstmt.setString(4, ticket.getStatus());
            pstmt.setString(5, ticket.getComplaintDetails());
            pstmt.setInt(6, ticket.getEstablishment());
            pstmt.setString(7, ticket.getSeverity());
            pstmt.setDate(8, (java.sql.Date) ticket.getComplaintDate());

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
    public boolean updateTicket(int ticketID, int employeeID,String s, String t) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "update `tickets` set status=?, severity=? where ticketID=? and employeeID=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, s);
            pstmt.setString(2, t);
            pstmt.setInt(3, ticketID);
            pstmt.setInt(4, employeeID);

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<TicketRecruitment> getMostComplained() {

        try {
            ArrayList<TicketRecruitment> TicketList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT subject, COUNT(subject) AS count FROM tickets group by subject";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment ticket = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));
                String subject = rs.getString("subject");

                ticket.setCount(count);
                ticket.setSubject(subject);

                TicketList.add(ticket);
            }
            conn.close();
            return TicketList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<TicketRecruitment> getFilteredComplaints(ArrayList<TicketRecruitment> ticketList, int limit) {

        ArrayList<TicketRecruitment> tempList = new ArrayList<TicketRecruitment>();

        for (int i = 0; i < ticketList.size(); i++) {

            if (ticketList.get(i).getCount() >= limit) {
                tempList.add(ticketList.get(i));
            }

        }

        return tempList;
    }

     public ArrayList<TicketRecruitment> getNewTicketsDashboard() {
// ndi pa naaayos to
        try {
            ArrayList<TicketRecruitment> TicketList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT COUNT(subject) AS `count` FROM tickets where status='*New'";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment ticket = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));

                ticket.setCount(count);

                TicketList.add(ticket);
            }
            conn.close();
            return TicketList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

      public int getNewTicketsDashboardDetails() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT complaintDate, COUNT(subject) AS `count` FROM tickets where status='*New' AND complaintDate BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW();";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment ticket = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));

                ticket.setCount(count);

            return count;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
     
      public ArrayList<TicketRecruitment> getActionTakenTicketsDashboard() {
        try {
            ArrayList<TicketRecruitment> TicketList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT COUNT(subject) AS `count` FROM tickets where status='Action Taken'";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment ticket = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));

                ticket.setCount(count);

                TicketList.add(ticket);
            }
            conn.close();
            return TicketList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
      
        public int getActionTakenTicketsDashboardDetails() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT complaintDate, COUNT(subject) AS `count` FROM tickets where status='Action Taken' AND complaintDate BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW();";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment ticket = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));

                ticket.setCount(count);

            return count;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

     public ArrayList<TicketRecruitment> getOnGoingTicketsDashboard() {
        try {
            ArrayList<TicketRecruitment> TicketList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT COUNT(subject) AS `count` FROM tickets where status='On-Going'";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment ticket = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));

                ticket.setCount(count);

                TicketList.add(ticket);
            }
            conn.close();
            return TicketList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     
      public int getOnGoingTicketsDashboardDetails() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT complaintDate, COUNT(subject) AS `count` FROM tickets where status='On-Going' AND complaintDate BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW();";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment ticket = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));

                ticket.setCount(count);

            return count;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
     
     public ArrayList<TicketRecruitment> getResolvedTicketsDashboard() {
        try {
            ArrayList<TicketRecruitment> TicketList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT COUNT(subject) AS `count` FROM tickets where status='Resolved'";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment ticket = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));

                ticket.setCount(count);

                TicketList.add(ticket);
            }
            conn.close();
            return TicketList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     
      public int getResolvedTicketsDashboardDetails() {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT complaintDate, COUNT(subject) AS `count` FROM tickets where status='Resolved' AND complaintDate BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW();";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TicketRecruitment ticket = new TicketRecruitment();

                int count = Integer.parseInt(rs.getString("count"));

                ticket.setCount(count);

            return count;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
     
    
}
