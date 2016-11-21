/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnectionFactory;
import entity.Notification;
import entity.Ticket;
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
 * @author see_h
 */
public class NotificationDAO {
    
     public ArrayList<Notification> getLicenseAlert() {
        try {
            ArrayList<Notification> NotificationList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select epi.employeeID, COUNT(epi.employeeID) as 'count' from `employee-job-information` eji join `employee-personal-information` epi ON eji.employeeID = epi.employeeID\n" +
" join `employee-safeguard-information` esi ON epi.employeeID = esi.employeeID where esi.status = 'Active' AND esi.status = 'Unallocated'";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Notification notif = new Notification();

                int licenseCount = rs.getInt("count");
                Date today = new Date();
                today.getTime();

                notif.setMessage(licenseCount + "hey");
                notif.setToday(today);

                NotificationList.add(notif);
            }
            conn.close();
            return NotificationList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    
}
