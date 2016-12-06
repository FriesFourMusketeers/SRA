/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Schedule;
import java.util.ArrayList;
import db.DBConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author John San Agustin
 */
public class ScheduleDAO {
    
     /*
    This is for getting all Physical Related Info
    */
    
    public ArrayList<Schedule> getAllInterview() {
        try {
            ArrayList<Schedule> scheduleList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-personal-information` p join `application-schedule` s on p.employeeID = s.employeeID where status ='Interview Scheduled' ";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Schedule schedule = new Schedule();
                
                int scheduleID = rs.getInt("scheduleID");
                int employeeID = rs.getInt("employeeID");
                Date scheduledDate = rs.getDate("scheduledDate");
                
                
                String name = (rs.getString("firstName")+" "+rs.getString("lastName"));
                
                schedule.setScheduleID(scheduleID);
                schedule.setEmployeeID(employeeID);
                schedule.setScheduledDate((java.sql.Date) scheduledDate);
               
                schedule.setName(name);

                scheduleList.add(schedule);
            }
            conn.close();
            return scheduleList;
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
      /*
    This function inputs the Applicants Job Info
    */
    public boolean inputSchedule(Schedule schedule) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into `application-schedule`(employeeID,scheduledDate) values (?,date_add(current_date, Interval 3 DAY))";
            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, schedule.getEmployeeID());
           
           
       
            
            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
