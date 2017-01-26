/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Schedule;
import java.util.ArrayList;
import db.DBConnectionFactory;
import entity.Employee;
import entity.EmployeeJobInfo;
import entity.EmployeePersonalInfo;
import entity.EmployeePhysicalInfo;
import java.sql.Blob;
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
    
        public ArrayList<EmployeePersonalInfo> getAllPendingPersonalInfo() {
        try {
            ArrayList<EmployeePersonalInfo> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
                       String query = "select * from `employee-personal-information` p left join `Employee-Physical-Information` e on p.employeeID = e.employeeID  join `Employee-Job-Information` s on p.employeeID = s.employeeID where p.status = 'Interview Scheduled';";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                EmployeePersonalInfo personalInfo = new EmployeePersonalInfo();
                int employeeID = rs.getInt("employeeID");
                Blob picture = rs.getBlob("picture");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String nickname = rs.getString("nickname");
                java.sql.Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");
                String details = rs.getString("details");

                personalInfo.setEmployeeID(employeeID);
                personalInfo.setPicture(picture);
                personalInfo.setLastName(lastName);
                personalInfo.setFirstName(firstName);
                personalInfo.setMiddleName(middleName);
                personalInfo.setNickname(nickname);
                personalInfo.setBirthday((java.sql.Date) birthday);
                personalInfo.setAge(age);
                personalInfo.setSex(sex);
                personalInfo.setReligion(religion);
                personalInfo.setCellphoneNo(cellphoneNo);
                personalInfo.setTelephoneNo(telephoneNo);
                personalInfo.setEducation(education);
                personalInfo.setCity(city);
                personalInfo.setMarriageStatus(marriageStatus);
                personalInfo.setStatus(status);
                personalInfo.setDetails(details);

                personalList.add(personalInfo);
            }
            conn.close();
            return personalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<EmployeePhysicalInfo> getAllPendingPhysicalInfo() {
        try {
            ArrayList<EmployeePhysicalInfo> physicalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-physical-information` j join `employee-personal-information` p on j.employeeID = p.employeeID where p.status = 'Interview Scheduled'";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                EmployeePhysicalInfo physicalInfo = new EmployeePhysicalInfo();

                int employeeID = rs.getInt("employeeID");
                int height = rs.getInt("height");
                int weight = rs.getInt("weight");
                String sears = rs.getString("sears");
                String physicalDefects = rs.getString("physicalDefects");
                String illnesses = rs.getString("illnesses");
                String bodyBuild = rs.getString("bodyBuild");
                String skinColor = rs.getString("skinColor");
                String stateOfHealth = rs.getString("stateOfHealth");

                physicalInfo.setEmployeeID(employeeID);
                physicalInfo.setHeight(height);
                physicalInfo.setWeight(weight);
                physicalInfo.setSears(sears);
                physicalInfo.setPhysicalDefects(physicalDefects);
                physicalInfo.setIllnesses(illnesses);
                physicalInfo.setBodyBuild(bodyBuild);
                physicalInfo.setSkinColor(skinColor);
                physicalInfo.setStateOfHealth(stateOfHealth);

                physicalList.add(physicalInfo);
            }
            conn.close();
            return physicalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<EmployeeJobInfo> getAllPendingJobInfo() {
        try {
            ArrayList<EmployeeJobInfo> jobList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-job-information` j join `employee-personal-information` p on j.employeeID = p.employeeID where p.status = 'Interview Scheduled'";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                EmployeeJobInfo jobInfo = new EmployeeJobInfo();

                int employeeID = rs.getInt("employeeID");
                String driversLicense = rs.getString("driversLicense");
                java.sql.Date driversLicenseExpDate = rs.getDate("driversLicenseExpDate");
                String license = rs.getString("licenseNo");
                java.sql.Date licenseExpDate = rs.getDate("licenseExpDate");
                String trainingAttended = rs.getString("trainingAttended");
                String formerEmployer = rs.getString("formerEmployer");
                String inclusiveDate = rs.getString("inclusiveDate");
                String formerJob = rs.getString("formerJob");
                String reasonForLeaving = rs.getString("reasonForLeaving");

                jobInfo.setEmployeeID(employeeID);
                jobInfo.setDriversLicense(driversLicense);
                jobInfo.setDriversLicenseExpDate((java.sql.Date) driversLicenseExpDate);
                jobInfo.setLicense(license);
                jobInfo.setLicenseExpDate((java.sql.Date) licenseExpDate);
                jobInfo.setTrainingAttended(trainingAttended);
                jobInfo.setFormerEmployer(formerEmployer);
                jobInfo.setInclusiveDate(inclusiveDate);
                jobInfo.setFormerJob(formerJob);
                jobInfo.setReasonForLeaving(reasonForLeaving);

                jobList.add(jobInfo);
            }
            conn.close();
            return jobList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
