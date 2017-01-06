/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//hi
package dao;

import db.DBConnectionFactory;
import entity.Allocation;
import entity.Charts;
import entity.Criteria;
import entity.Employee;
import entity.EmployeeJobInfo;
import entity.EmployeePersonalInfo;
import entity.EmployeePhysicalInfo;
import entity.EmployeeSafeguardInfo;
import entity.PerformanceReviewScores;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author John San Agustin
 */
public class EmployeeDAO {
    
    public Criteria getCriteria() {
        Criteria criteria = new Criteria();
        try {
            
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `safeguard-criteria`";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                

               criteria.setMinAge(rs.getInt("minAge"));
               criteria.setMaxAge(rs.getInt("maxAge"));
               criteria.setMinWeight(rs.getInt("minWeight"));
               criteria.setMaxWeight(rs.getInt("maxWeight"));
               criteria.setMinHeight(rs.getInt("minHeight"));
               criteria.setBodybuild(rs.getString("bodybuild"));
               criteria.setTrainingAttended(rs.getString("trainingAttended"));
           
            }
            conn.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return criteria;
    }
    
    /*
     This function rejects the Applicant
     */
    public boolean updateCriteria(Criteria criteria) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "update`Safeguard-Criteria`set minAge=?,maxAge=? ,minWeight=?,maxWeight=?,minHeight=?,bodybuild=?,trainingAttended=?";
            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, criteria.getMinAge());
            pstmt.setInt(2, criteria.getMaxAge());
            pstmt.setInt(3,criteria.getMinWeight());
            pstmt.setInt(4,criteria.getMinWeight());
            pstmt.setInt(5,criteria.getMinHeight());
            pstmt.setString(6,criteria.getBodybuild());
            pstmt.setString(7, criteria.getTrainingAttended());
                    

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /*
     This function gets All Personal Infos of the Employees
     */
    public ArrayList<EmployeePersonalInfo> getTempPersonalInfo() {
        try {
            ArrayList<EmployeePersonalInfo> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-personal-information` where status = 'Temporary' ";
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
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");

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

                personalList.add(personalInfo);
            }
            conn.close();
            return personalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<EmployeeJobInfo> getTempJobInfo2() {
        try {
            ArrayList<EmployeeJobInfo> jobList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-job-information` j join `employee-personal-information` p on j.employeeID = p.employeeID where p.status = 'Temporary'";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                EmployeeJobInfo jobInfo = new EmployeeJobInfo();

                int employeeID = rs.getInt("employeeID");
                String driversLicense = rs.getString("driversLicense");
                Date driversLicenseExpDate = rs.getDate("driversLicenseExpDate");
                String license = rs.getString("license");
                Date licenseExpDate = rs.getDate("licenseExpDate");
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


    /*
     This function rejects the Applicant
     */
    public boolean notQualified(int employeeID, String reason) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "update`employee-personal-information`set status = 'Not Qualified', details = ?  where employeeID = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setString(1, reason);
            pstmt.setInt(2, employeeID);

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean Waitlisted(int employeeID) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "update`employee-personal-information`set status = 'Waitlisted' where employeeID = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, employeeID);

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /*
     This function accepts the Applicant
     */
    public boolean InterviewScheduled(int employeeID) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "update`employee-personal-information`set status = 'Interview Scheduled' where employeeID = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, employeeID);

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<EmployeePersonalInfo> getAllRejectedPersonalInfo() {
        try {
            ArrayList<EmployeePersonalInfo> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
                       String query = "select * from `employee-personal-information` p left join `Employee-Physical-Information` e on p.employeeID = e.employeeID  join `Employee-Job-Information` s on p.employeeID = s.employeeID where p.status = 'Not Qualified';";
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
                Date birthday = rs.getDate("birthday");
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
    
    public ArrayList<EmployeePhysicalInfo> getAllRejectedPhysicalInfo() {
        try {
            ArrayList<EmployeePhysicalInfo> physicalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-physical-information` j join `employee-personal-information` p on j.employeeID = p.employeeID where p.status = 'Not Qualified'";
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
    
    public ArrayList<EmployeeJobInfo> getAllRejectedJobInfo() {
        try {
            ArrayList<EmployeeJobInfo> jobList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-job-information` j join `employee-personal-information` p on j.employeeID = p.employeeID where p.status = 'Not Qualified'";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                EmployeeJobInfo jobInfo = new EmployeeJobInfo();

                int employeeID = rs.getInt("employeeID");
                String driversLicense = rs.getString("driversLicense");
                Date driversLicenseExpDate = rs.getDate("driversLicenseExpDate");
                String license = rs.getString("license");
                Date licenseExpDate = rs.getDate("licenseExpDate");
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

    public ArrayList<EmployeePersonalInfo> getAllWaitlisted() {
        try {
            ArrayList<EmployeePersonalInfo> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-personal-information` p left join `Employee-Physical-Information` e on p.employeeID = e.employeeID  join `Employee-Job-Information` s on p.employeeID = s.employeeID where p.status = 'Temporary';";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                EmployeePersonalInfo personalInfo = new EmployeePersonalInfo();

                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");

                personalInfo.setLastName(lastName);
                personalInfo.setFirstName(firstName);

                personalList.add(personalInfo);
            }
            conn.close();
            return personalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /*
     This function gets All Personal Infos of the Employees
     */
    public ArrayList<EmployeePersonalInfo> getAllPersonalInfo() {
        try {
            ArrayList<EmployeePersonalInfo> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-personal-information`";
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
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");

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

                personalList.add(personalInfo);
            }
            conn.close();
            return personalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public EmployeePersonalInfo getSinglePersonalInfo(int id) {
        try {

            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-personal-information` where employeeID = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            EmployeePersonalInfo personalInfo = null;
            if (rs.next()) {
                personalInfo = new EmployeePersonalInfo();

                int employeeID = rs.getInt("employeeID");
                Blob picture = rs.getBlob("picture");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String nickname = rs.getString("nickname");
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");

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

            }
            conn.close();
            return personalInfo;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

 /*
     This function inputs the Applicants Personal Info
     */
    public boolean inputPersonalInfo(EmployeePersonalInfo personalInfo, InputStream inputStream, InputStream inputStream2) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into `employee-personal-information`(lastName,firstName,middleName,nickname,birthday,age,sex,religion,cellphoneNo,telephoneNo,education,city,marriageStatus, picture, dateInputted, resume,status,details) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, personalInfo.getEmployeeID());
            pstmt.setString(1, personalInfo.getLastName());
            pstmt.setString(2, personalInfo.getFirstName());
            pstmt.setString(3, personalInfo.getMiddleName());
            pstmt.setString(4, personalInfo.getNickname());
            pstmt.setDate(5, personalInfo.getBirthday());
            pstmt.setInt(6, personalInfo.getAge());
            pstmt.setString(7, personalInfo.getSex());
            pstmt.setString(8, personalInfo.getReligion());
            pstmt.setString(9, personalInfo.getCellphoneNo());
            pstmt.setString(10, personalInfo.getTelephoneNo());
            pstmt.setString(11, personalInfo.getEducation());
            pstmt.setString(12, personalInfo.getCity());
            pstmt.setString(13, personalInfo.getMarriageStatus());
            pstmt.setBlob(14, inputStream);
            pstmt.setDate(15, personalInfo.getDateInput());
            pstmt.setBlob(16, inputStream2);
            pstmt.setString(17, personalInfo.getStatus());
            pstmt.setString(18, personalInfo.getDetails());

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }
    /*
     This is for getting all Personal Related Info
     */

    public ArrayList<EmployeeJobInfo> getTempJobInfo() {
        try {
            ArrayList<EmployeeJobInfo> jobList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-job-information` j join `employee-personal-information` p on j.employeeID = p.employeeID where p.status = 'Temporary'";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                EmployeeJobInfo jobInfo = new EmployeeJobInfo();

                int employeeID = rs.getInt("employeeID");
                String driversLicense = rs.getString("driversLicense");
                Date driversLicenseExpDate = rs.getDate("driversLicenseExpDate");
                String license = rs.getString("license");
                Date licenseExpDate = rs.getDate("licenseExpDate");
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

    /*
     This is for getting all Personal Related Info
     */
    public ArrayList<EmployeeJobInfo> getAllJobInfo() {
        try {
            ArrayList<EmployeeJobInfo> jobList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-job-information`";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                EmployeeJobInfo jobInfo = new EmployeeJobInfo();

                int employeeID = rs.getInt("employeeID");
                String driversLicense = rs.getString("driversLicense");
                Date driversLicenseExpDate = rs.getDate("driversLicenseExpDate");
                String license = rs.getString("license");
                Date licenseExpDate = rs.getDate("licenseExpDate");
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

    public EmployeeJobInfo getSingleJobInfo(int id) {
        try {

            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-job-information` where employeeID=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            EmployeeJobInfo jobInfo = null;
            if (rs.next()) {
                jobInfo = new EmployeeJobInfo();

                int employeeID = rs.getInt("employeeID");
                String driversLicense = rs.getString("driversLicense");
                Date driversLicenseExpDate = rs.getDate("driversLicenseExpDate");
                String license = rs.getString("license");
                Date licenseExpDate = rs.getDate("licenseExpDate");
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

            }
            conn.close();
            return jobInfo;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /*
     This function inputs the Applicants Job Info
     */
    public boolean inputJobInfo(EmployeeJobInfo jobInfo) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into `employee-job-information`(driversLicense,driversLicenseExpDate,licenseNo,licenseExpDate,licenseType,trainingAttended,formerEmployer,inclusiveDate,formerJob,reasonForLeaving) values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            //pstmt.setInt(1, jobInfo.getEmployeeID());
            pstmt.setString(1, jobInfo.getDriversLicense());
            pstmt.setDate(2, jobInfo.getDriversLicenseExpDate());
            pstmt.setString(3, jobInfo.getLicenseNo());
            pstmt.setDate(4, jobInfo.getLicenseExpDate());
            pstmt.setString(5, jobInfo.getLicenseType());
            pstmt.setString(6, jobInfo.getTrainingAttended());
            pstmt.setString(7, jobInfo.getFormerEmployer());
            pstmt.setString(8, jobInfo.getInclusiveDate());
            pstmt.setString(9, jobInfo.getFormerJob());
            pstmt.setString(10, jobInfo.getReasonForLeaving());

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /*
     This is for getting all Physical Related Info
     */
    public ArrayList<EmployeePhysicalInfo> getTempPhysicalInfo() {
        try {
            ArrayList<EmployeePhysicalInfo> physicalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-physical-information` j join `employee-personal-information` p on j.employeeID = p.employeeID where p.status = 'Temporary'";
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

    /*
     This is for getting all Physical Related Info
     */
    public ArrayList<EmployeePhysicalInfo> getAllPhysicalInfo() {
        try {
            ArrayList<EmployeePhysicalInfo> physicalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-physical-information`";
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

    public EmployeePhysicalInfo getSinglePhysicalInfo(int id) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-physical-information` where employeeID=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            EmployeePhysicalInfo physicalInfo = null;
            if (rs.next()) {
                physicalInfo = new EmployeePhysicalInfo();

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

            }
            conn.close();
            return physicalInfo;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public EmployeeSafeguardInfo getSingleSafeguardInfo(int id) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-safeguard-information` where employeeID=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            EmployeeSafeguardInfo safeguardInfo = null;
            if (rs.next()) {
                safeguardInfo = new EmployeeSafeguardInfo();

                int employeeID = rs.getInt("employeeID");
                String license = rs.getString("license");
                Date contractStart = rs.getDate("contractStart");
                Date contractEnd = rs.getDate("contractEnd");
                int numberOfYears = rs.getInt("numberOfYears");
                String status = rs.getString("status");

                safeguardInfo.setEmployeeID(employeeID);
                safeguardInfo.setLicense(license);
                safeguardInfo.setContractStart(contractStart);
                safeguardInfo.setContractEnd(contractEnd);
                safeguardInfo.setNumberOfYears(numberOfYears);
                safeguardInfo.setStatus(status);
            }
            conn.close();
            return safeguardInfo;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }


    /*
     This function inputs the Applicants Job Info
     */
    public boolean inputPhysicalInfo(EmployeePhysicalInfo physicalInfo) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into `employee-physical-information`(height, weight, sears, physicalDefects, illnesses, bodyBuild, skinColor, stateOfHealth) values (?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
//            pstmt.setInt(1, physicalInfo.getEmployeeID());
            pstmt.setInt(1, physicalInfo.getHeight());
            pstmt.setInt(2, physicalInfo.getWeight());
            pstmt.setString(3, physicalInfo.getSears());
            pstmt.setString(4, physicalInfo.getPhysicalDefects());
            pstmt.setString(5, physicalInfo.getIllnesses());
            pstmt.setString(6, physicalInfo.getBodyBuild());
            pstmt.setString(7, physicalInfo.getSkinColor());
            pstmt.setString(8, physicalInfo.getStateOfHealth());

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Employee> getEmployeebyClient(int c) {
        try {
            ArrayList<Employee> employeeList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT * \n"
                    + "From `employee-personal-information` epi\n"
                    + "JOIN  `employee-safeguard-information` esi on epi.employeeID = esi.employeeID \n"
                    + "JOIN allocation a on esi.employeeID = a.employeeID\n"
                    + "JOIN client c on a.clientID = c.clientID\n"
                    + "where c.clientID=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, c);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Employee employeeInfo = new Employee();

                int employeeID = rs.getInt("employeeID");
                Blob picture = rs.getBlob("picture");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String nickname = rs.getString("nickname");
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");

                employeeInfo.setEmployeeID(employeeID);
                employeeInfo.setPicture(picture);
                employeeInfo.setLastName(lastName);
                employeeInfo.setFirstName(firstName);
                employeeInfo.setMiddleName(middleName);
                employeeInfo.setNickname(nickname);
                employeeInfo.setBirthday((java.sql.Date) birthday);
                employeeInfo.setAge(age);
                employeeInfo.setSex(sex);
                employeeInfo.setReligion(religion);
                employeeInfo.setCellphoneNo(cellphoneNo);
                employeeInfo.setTelephoneNo(telephoneNo);
                employeeInfo.setEducation(education);
                employeeInfo.setCity(city);
                employeeInfo.setMarriageStatus(marriageStatus);
                employeeInfo.setStatus(status);

                employeeList.add(employeeInfo);

            }
            conn.close();
            return employeeList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Employee> getAllUnallocated() {
        try {
            ArrayList<Employee> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-personal-information` p left join `Employee-Physical-Information` e on p.employeeID = e.employeeID  left join `Employee-Safeguard-Information` s on p.employeeID = s.employeeID where p.status = 'Qualified' and s.status = 'Unallocated';";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Employee personalInfo = new Employee();
                int employeeID = rs.getInt("employeeID");
                Blob picture = rs.getBlob("picture");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String nickname = rs.getString("nickname");
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");
                int height = rs.getInt("height");
                int weight = rs.getInt("weight");
                String bodyBuild = rs.getString("bodyBuild");
                String skinColor = rs.getString("skinColor");
                String stateOfHealth = rs.getString("stateOfHealth");
                String license = rs.getString("license");

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

                personalInfo.setHeight(height);
                personalInfo.setWeight(weight);
                personalInfo.setBodyBuild(bodyBuild);
                personalInfo.setSkinColor(skinColor);
                personalInfo.setStateOfHealth(stateOfHealth);

                personalInfo.setLicense(license);
                personalList.add(personalInfo);
            }
            conn.close();
            return personalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Employee> getNearExpirationEmployee() {
        try {
            ArrayList<Employee> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-personal-information` p left join `Employee-Physical-Information` e on p.employeeID = e.employeeID  left join `Employee-Safeguard-Information` s on p.employeeID = s.employeeID where year(curdate()) = year(s.contractEnd) and month(curdate())+1 = month(s.contractEnd);";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Employee personalInfo = new Employee();
                int employeeID = rs.getInt("employeeID");
                Blob picture = rs.getBlob("picture");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String nickname = rs.getString("nickname");
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");
                int height = rs.getInt("height");
                int weight = rs.getInt("weight");
                String bodyBuild = rs.getString("bodyBuild");
                String skinColor = rs.getString("skinColor");
                String stateOfHealth = rs.getString("stateOfHealth");
                String license = rs.getString("license");

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

                personalInfo.setHeight(height);
                personalInfo.setWeight(weight);
                personalInfo.setBodyBuild(bodyBuild);
                personalInfo.setSkinColor(skinColor);
                personalInfo.setStateOfHealth(stateOfHealth);

                personalInfo.setLicense(license);
                personalList.add(personalInfo);
            }
            conn.close();
            return personalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Employee> getNearExpirationEmployeeLicense() {
         try {
            ArrayList<Employee> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select *, datediff(eji.licenseExpDate,curdate()) as `Days Remaining`\n" +
"from `employee-job-information` eji join`employee-personal-information` epi on eji.employeeID = epi.employeeID\n" +
"										 join `employee-safeguard-information` esi on epi.employeeID = esi.employeeID \n" +
"										 join `allocation` a on esi.employeeID = a.employeeID\n" +
"                                         join `Client` c on a.clientID = c.clientID\n" +
"where year(curdate()) = year(eji.licenseExpDate) and month(curdate())+4 = month(eji.licenseExpDate);";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Employee personalInfo = new Employee();
                int employeeID = rs.getInt("employeeID");
                Blob picture = rs.getBlob("picture");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String nickname = rs.getString("nickname");
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");
                String assignedTo = rs.getString("clientName");
                String license = rs.getString("license");
                Date contractEnd = rs.getDate("licenseExpDate");
                int daysRemaining = rs.getInt("Days Remaining");

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
                personalInfo.setLicenseExpDate((java.sql.Date) contractEnd);
                personalInfo.setLicense(license);
                personalInfo.setAssignedTo(assignedTo);
                personalInfo.setNumberOfDays(daysRemaining);
                personalList.add(personalInfo);

            }
            conn.close();
            return personalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ArrayList<Employee> getAllEmployeeLicense() {
        try {
            ArrayList<Employee> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select *, datediff(eji.licenseExpDate,curdate()) as `Days Remaining`\n" +
"from `employee-job-information` eji join`employee-personal-information` epi on eji.employeeID = epi.employeeID\n" +
"										 join `employee-safeguard-information` esi on epi.employeeID = esi.employeeID \n" +
"										 join `allocation` a on esi.employeeID = a.employeeID\n" +
"                                         join `Client` c on a.clientID = c.clientID;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Employee personalInfo = new Employee();
                int employeeID = rs.getInt("employeeID");
                Blob picture = rs.getBlob("picture");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String nickname = rs.getString("nickname");
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");
                String assignedTo = rs.getString("clientName");
                String license = rs.getString("license");
                Date contractEnd = rs.getDate("licenseExpDate");
                int daysRemaining = rs.getInt("Days Remaining");

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
                personalInfo.setLicenseExpDate((java.sql.Date) contractEnd);
                personalInfo.setLicense(license);
                personalInfo.setAssignedTo(assignedTo);
                personalInfo.setNumberOfDays(daysRemaining);
                personalList.add(personalInfo);

            }
            conn.close();
            return personalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ArrayList<Employee> getExpiredEmployeeLicense() {
         try {
            ArrayList<Employee> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select *, datediff(eji.licenseExpDate,curdate()) as `Days Remaining`\n" +
"from `employee-job-information` eji join`employee-personal-information` epi on eji.employeeID = epi.employeeID\n" +
"										 join `employee-safeguard-information` esi on epi.employeeID = esi.employeeID \n" +
"										 join `allocation` a on esi.employeeID = a.employeeID\n" +
"                                         join `Client` c on a.clientID = c.clientID\n" +
" where curDate() > eji.licenseExpDate;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Employee personalInfo = new Employee();
                int employeeID = rs.getInt("employeeID");
                Blob picture = rs.getBlob("picture");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String nickname = rs.getString("nickname");
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");
                String assignedTo = rs.getString("clientName");
                String license = rs.getString("license");
                Date contractEnd = rs.getDate("licenseExpDate");
                int daysRemaining = rs.getInt("Days Remaining");

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
                personalInfo.setLicenseExpDate((java.sql.Date) contractEnd);
                personalInfo.setLicense(license);
                personalInfo.setAssignedTo(assignedTo);
                personalInfo.setNumberOfDays(daysRemaining);
                personalList.add(personalInfo);

            }
            conn.close();
            return personalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Employee> getExpiredEmployee() {
        try {
            ArrayList<Employee> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-personal-information` p left join `Employee-Physical-Information` e on p.employeeID = e.employeeID  left join `Employee-Safeguard-Information` s on p.employeeID = s.employeeID where curdate() > s.contractEnd;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Employee personalInfo = new Employee();
                int employeeID = rs.getInt("employeeID");
                Blob picture = rs.getBlob("picture");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String nickname = rs.getString("nickname");
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");
                int height = rs.getInt("height");
                int weight = rs.getInt("weight");
                String bodyBuild = rs.getString("bodyBuild");
                String skinColor = rs.getString("skinColor");
                String stateOfHealth = rs.getString("stateOfHealth");
                String license = rs.getString("license");

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

                personalInfo.setHeight(height);
                personalInfo.setWeight(weight);
                personalInfo.setBodyBuild(bodyBuild);
                personalInfo.setSkinColor(skinColor);
                personalInfo.setStateOfHealth(stateOfHealth);

                personalInfo.setLicense(license);
                personalList.add(personalInfo);
            }
            conn.close();
            return personalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Employee> getAllAllocated() {
        try {
            ArrayList<Employee> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select *\n" +
"from `employee-physical-information` pi  left join `employee-job-information` eji on pi.employeeID = eji.employeeID\n" +
"										 left join`employee-personal-information` epi on eji.employeeID = epi.employeeID\n" +
"										 left join `employee-safeguard-information` esi on epi.employeeID = esi.employeeID \n" +
"										 left join `allocation` a on esi.employeeID = a.employeeID\n" +
"                                         left join `Client` c on a.clientID = c.clientID\n" +
"where esi.status=\"Active\";";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Employee personalInfo = new Employee();
                int employeeID = rs.getInt("employeeID");
                Blob picture = rs.getBlob("picture");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String nickname = rs.getString("nickname");
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");
                int height = rs.getInt("height");
                int weight = rs.getInt("weight");
                String bodyBuild = rs.getString("bodyBuild");
                String skinColor = rs.getString("skinColor");
                String stateOfHealth = rs.getString("stateOfHealth");
                String license = rs.getString("license");
                Date contractStart = rs.getDate("contractStart");
                Date contractEnd = rs.getDate("contractEnd");
                String assignedTo = rs.getString("clientName");
                

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
                personalInfo.setHeight(height);
                personalInfo.setWeight(weight);
                personalInfo.setBodyBuild(bodyBuild);
                personalInfo.setSkinColor(skinColor);
                personalInfo.setStateOfHealth(stateOfHealth);
                personalInfo.setLicense(license);
                personalInfo.setAssignedTo(assignedTo);
//                personalInfo.getContractStart();
                //              personalInfo.getContractEnd();
                personalList.add(personalInfo);

            }
            conn.close();
            return personalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

     public ArrayList<Employee> getAllAllocatedByClientID(int clientName) {
        try {
            ArrayList<Employee> personalList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select *\n" +
"from `employee-physical-information` pi  left join `employee-job-information` eji on pi.employeeID = eji.employeeID\n" +
"										 left join`employee-personal-information` epi on eji.employeeID = epi.employeeID\n" +
"										 left join `employee-safeguard-information` esi on epi.employeeID = esi.employeeID \n" +
"										 left join `allocation` a on esi.employeeID = a.employeeID\n" +
"                                         left join `Client` c on a.clientID = c.clientID\n" +
"where c.clientID = ? AND esi.status=\"Active\";";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, clientName);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Employee personalInfo = new Employee();
                int employeeID = rs.getInt("employeeID");
                Blob picture = rs.getBlob("picture");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String nickname = rs.getString("nickname");
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");
                String marriageStatus = rs.getString("marriageStatus");
                String status = rs.getString("status");
                int height = rs.getInt("height");
                int weight = rs.getInt("weight");
                String bodyBuild = rs.getString("bodyBuild");
                String skinColor = rs.getString("skinColor");
                String stateOfHealth = rs.getString("stateOfHealth");
                String license = rs.getString("license");
                Date contractStart = rs.getDate("contractStart");
                Date contractEnd = rs.getDate("contractEnd");
                String assignedTo = rs.getString("clientName");
                

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
                personalInfo.setHeight(height);
                personalInfo.setWeight(weight);
                personalInfo.setBodyBuild(bodyBuild);
                personalInfo.setSkinColor(skinColor);
                personalInfo.setStateOfHealth(stateOfHealth);
                personalInfo.setLicense(license);
                personalInfo.setAssignedTo(assignedTo);
//                personalInfo.getContractStart();
                //              personalInfo.getContractEnd();
                personalList.add(personalInfo);

            }
            conn.close();
            return personalList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    /*
     This function inputs the Applicants Job Info
     */
    public boolean inputAllocation(Allocation allocation) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into `allocation`(allocationID, clientID, status, employeeID, license) values (?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, allocation.getAllocationID());
            pstmt.setInt(2, allocation.getClientID());
            pstmt.setString(3, allocation.getStatus());
            pstmt.setInt(4, allocation.getEmployeeID());
            pstmt.setString(5, allocation.getLicense());

            changeAllocationStatus(allocation.getStatus(), allocation.getEmployeeID());

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Allocation> getAllAllocation() {
        try {
            ArrayList<Allocation> allocationList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `allocation`";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            Allocation allocationInfo = null;
            while (rs.next()) {
                allocationInfo = new Allocation();
                int allocationID = rs.getInt("allocationID");
                int clientID = rs.getInt("clientID");
                String status = rs.getString("status");
                int employeeID = rs.getInt("employeeID");
                String license = rs.getString("license");
                Date contractStart = rs.getDate("contractStart");
                Date contractEnd = rs.getDate("contractEnd");
                allocationInfo.setAllocationID(allocationID);
                allocationInfo.setClientID(clientID);
                allocationInfo.setStatus(status);
                allocationInfo.setEmployeeID(employeeID);
                allocationInfo.setLicense(license);
                allocationInfo.setContractStart(contractStart);
                allocationInfo.setContractEnd(contractEnd);
                allocationList.add(allocationInfo);
            }
            conn.close();
            return allocationList;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
      public int getEmployeeID() {
        int employeeID = 0;
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "Select max(employeeID) from `Employee-Personal-Information`;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                employeeID = rs.getInt("max(employeeID)");
            }
            conn.close();
            return employeeID;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employeeID;
    }

    public int getAllocationID() {
        int allocation = 0;
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "Select max(allocationID) from allocation;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                allocation = rs.getInt("max(allocationID)");
            }
            conn.close();
            return allocation;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return allocation;
    }

    public boolean changeAllocationStatus(String status, int employeeID) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "update`employee-safeguard-information`set status = ? where employeeID = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, status);
            pstmt.setInt(2, employeeID);
            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

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

    public ArrayList<PerformanceReviewScores> getPerformanceGradeByEmployeeID(int empID, int year) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT *, MONTHNAME(STR_TO_DATE(Month(dateAnswered), '%m')) as 'month', AVG(score) as `avg`, YEAR(dateAnswered) as 'year', week(dateAnswered) as 'week' from `performance-review-scores` where employeeID =? AND YEAR(dateAnswered) = ? group by YEAR(dateAnswered), Month(dateAnswered) order by dateAnswered;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, empID);
            pstmt.setInt(2, year);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<PerformanceReviewScores> prT = null;
            PerformanceReviewScores prs;
            if (rs.next()) {
                prT = new ArrayList();
                do {
                    prs = new PerformanceReviewScores();
                    prs.setEmployeeID(rs.getInt("employeeID"));
                    prs.setScoreID(rs.getInt("scoreID"));
                    prs.setScore(rs.getInt("avg"));
                    prs.setDateAnswered(rs.getDate("dateAnswered"));
                    prs.setEmployeeName(GetUserName(rs.getInt("employeeID")));
                    prs.setMonth(rs.getString("Month"));
                    prs.setWeek(rs.getString("week"));
                    prs.setYear(rs.getString("year"));
                    

                    prT.add(prs);
                } while (rs.next());

                System.out.println(empID);
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
   

    public ArrayList<PerformanceReviewScores> getPerformanceGradeByYear(int year) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT *, MONTHNAME(STR_TO_DATE(Month(dateAnswered), '%m')) as `Month`, AVG(score) as `avg` from `performance-review-scores` where year(dateAnswered) =? group by year(dateAnswered),`Month`,employeeID order by dateAnswered ;";
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
                    prs.setScore(rs.getInt("avg"));
                    prs.setDateAnswered(rs.getDate("dateAnswered"));
                    prs.setEmployeeName(GetUserName(rs.getInt("employeeID")));
                    prs.setMonth(rs.getString("Month"));

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

    public ArrayList<PerformanceReviewScores> getPerformanceGradeByYearDrilldown(int year, int month) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "Select *, MONTHNAME(STR_TO_DATE(Month(dateAnswered), '%m')) as `Month`, AVG(score) as `avg` from `performance-review-scores` where year(dateAnswered) =? AND  MONTHNAME(STR_TO_DATE(Month(dateAnswered), '%m')) = ? group by year(dateAnswered);";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, year);
            pstmt.setInt(2, month);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<PerformanceReviewScores> prT = null;
            PerformanceReviewScores prs;
            if (rs.next()) {
                prT = new ArrayList();
                do {
                    prs = new PerformanceReviewScores();
                    prs.setEmployeeID(rs.getInt("employeeID"));
                    prs.setScoreID(rs.getInt("scoreID"));
                    prs.setScore(rs.getInt("avg"));
                    prs.setDateAnswered(rs.getDate("dateAnswered"));
                    prs.setEmployeeName(GetUserName(rs.getInt("employeeID")));
                    prs.setMonth(rs.getString("Month"));

                    prT.add(prs);
                } while (rs.next());

                System.out.println(month);
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

    public String GetUserName(int employeeID) {

        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        String user = null;
        try (Connection conn = myFactory.getConnection()) {

            String query = "SELECT CONCAT(u.firstName, \" \" ,u.lastName) AS `name` FROM `employee-personal-information` u WHERE employeeID = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, employeeID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                user = rs.getString("name");
            }
            pstmt.close();
            rs.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public EmployeePersonalInfo getSingleTempPersonalInfo(int id) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-personal-information` where status = 'Temporary' && employeeID = ? ";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            EmployeePersonalInfo applicantPersonalInfo = null;

            if (rs.next()) {
                applicantPersonalInfo = new EmployeePersonalInfo();

                int employeeID = rs.getInt("employeeID");
                Blob picture = rs.getBlob("picture");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String nickname = rs.getString("nickname");
                Date birthday = rs.getDate("birthday");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String religion = rs.getString("religion");
                String cellphoneNo = rs.getString("cellphoneNo");
                String telephoneNo = rs.getString("telephoneNo");
                String education = rs.getString("education");
                String city = rs.getString("city");

                String status = rs.getString("status");

                applicantPersonalInfo.setEmployeeID(employeeID);
                applicantPersonalInfo.setPicture(picture);
                applicantPersonalInfo.setLastName(lastName);
                applicantPersonalInfo.setFirstName(firstName);
                applicantPersonalInfo.setMiddleName(middleName);
                applicantPersonalInfo.setNickname(nickname);
                applicantPersonalInfo.setBirthday((java.sql.Date) birthday);
                applicantPersonalInfo.setAge(age);
                applicantPersonalInfo.setSex(sex);
                applicantPersonalInfo.setReligion(religion);
                applicantPersonalInfo.setCellphoneNo(cellphoneNo);
                applicantPersonalInfo.setTelephoneNo(telephoneNo);
                applicantPersonalInfo.setEducation(education);
                applicantPersonalInfo.setCity(city);

                applicantPersonalInfo.setStatus(status);

            }
            conn.close();
            return applicantPersonalInfo;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public EmployeeJobInfo getSingleTempJobInfo(int id) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-job-information` j join `employee-personal-information` p on j.employeeID = p.employeeID where p.status = 'Temporary' && j.employeeID=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            EmployeeJobInfo tempJobInfo = null;
            if (rs.next()) {
                tempJobInfo = new EmployeeJobInfo();

                int employeeID = rs.getInt("employeeID");
                String driversLicense = rs.getString("driversLicense");
                Date driversLicenseExpDate = rs.getDate("driversLicenseExpDate");
                String license = rs.getString("license");
                Date licenseExpDate = rs.getDate("licenseExpDate");
                String trainingAttended = rs.getString("trainingAttended");
                String formerEmployer = rs.getString("formerEmployer");
                String inclusiveDate = rs.getString("inclusiveDate");
                String formerJob = rs.getString("formerJob");
                String reasonForLeaving = rs.getString("reasonForLeaving");

                tempJobInfo.setEmployeeID(employeeID);
                tempJobInfo.setDriversLicense(driversLicense);
                tempJobInfo.setDriversLicenseExpDate((java.sql.Date) driversLicenseExpDate);
                tempJobInfo.setLicense(license);
                tempJobInfo.setLicenseExpDate((java.sql.Date) licenseExpDate);
                tempJobInfo.setTrainingAttended(trainingAttended);
                tempJobInfo.setFormerEmployer(formerEmployer);
                tempJobInfo.setInclusiveDate(inclusiveDate);
                tempJobInfo.setFormerJob(formerJob);
                tempJobInfo.setReasonForLeaving(reasonForLeaving);
            }
            conn.close();
            return tempJobInfo;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public EmployeePhysicalInfo getSingleTempPhysicalInfo(int id) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from `employee-physical-information` j join `employee-personal-information` p on j.employeeID = p.employeeID where p.status = 'Temporary' && j.employeeID=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            EmployeePhysicalInfo tempPhysicalInfo = null;

            if (rs.next()) {
                tempPhysicalInfo = new EmployeePhysicalInfo();

                int employeeID = rs.getInt("employeeID");
                int height = rs.getInt("height");
                int weight = rs.getInt("weight");
                String sears = rs.getString("sears");
                String physicalDefects = rs.getString("physicalDefects");
                String illnesses = rs.getString("illnesses");
                String bodyBuild = rs.getString("bodyBuild");
                String skinColor = rs.getString("skinColor");
                String stateOfHealth = rs.getString("stateOfHealth");

                tempPhysicalInfo.setEmployeeID(employeeID);
                tempPhysicalInfo.setHeight(height);
                tempPhysicalInfo.setWeight(weight);
                tempPhysicalInfo.setSears(sears);
                tempPhysicalInfo.setPhysicalDefects(physicalDefects);
                tempPhysicalInfo.setIllnesses(illnesses);
                tempPhysicalInfo.setBodyBuild(bodyBuild);
                tempPhysicalInfo.setSkinColor(skinColor);
                tempPhysicalInfo.setStateOfHealth(stateOfHealth);

            }
            conn.close();
            return tempPhysicalInfo;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Employee> getAllEmpInfo(int id) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "SELECT epim.employeeID, epim.lastName, epim.firstName, epim.age, epim.sex, epim.city, epi.height, epi.bodyBuild, epi.skinColor, "
                    + "epi.weight, esi.license, c.clientName FROM `employee-personal-information` epim join `employee-physical-information` "
                    + "epi on epim.employeeID = epi.employeeID join `employee-job-information` eji on epim.employeeID = eji.employeeID join `"
                    + "employee-safeguard-information` esi on epim.employeeID = esi.employeeID join `allocation` a on esi.employeeID = a.employeeID "
                    + "join `client` c on a.clientID = c.clientID where c.clientID=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            Employee employeeInfo = null;
            ArrayList<Employee> employeelist = new ArrayList();

            while (rs.next()) {
                employeeInfo = new Employee();

                int employeeID = rs.getInt("employeeID");
                int height = rs.getInt("height");
                int weight = rs.getInt("weight");
                String bodyBuild = rs.getString("bodyBuild");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                String city = rs.getString("city");
                String license = rs.getString("license");
                String clientName = rs.getString("clientName");
                String skinColor = rs.getString("skinColor");

                employeeInfo.setEmployeeID(employeeID);
                employeeInfo.setHeight(height);
                employeeInfo.setWeight(weight);
                employeeInfo.setLastName(lastName);
                employeeInfo.setFirstName(firstName);
                employeeInfo.setLicense(license);
                employeeInfo.setCity(city);
                employeeInfo.setBodyBuild(bodyBuild);
                employeeInfo.setSkinColor(skinColor);
                employeeInfo.setCurrentClient(clientName);
                employeelist.add(employeeInfo);
            }
            conn.close();
            return employeelist;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
     public ArrayList<PerformanceReviewScores> getClientEmployeeGrade(int id) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select prs.employeeID, avg(prs.score) as 'score' from client c join allocation a on c.clientID = a.clientID join `performance-review-scores` prs on a.employeeID=prs.employeeID where c.clientID = ? group by prs.employeeID;";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            ArrayList <Charts> chartsList = null;
            Charts chart;
            
            ArrayList<PerformanceReviewScores> prT = null;
            PerformanceReviewScores prs;
            if (rs.next()) {
                prT = new ArrayList();
                do{
                    prs= new PerformanceReviewScores();
                    prs.setEmployeeID(rs.getInt("prs.employeeID"));
                    prs.setScore(rs.getInt("score"));
                    
                    
                    prT.add(prs);
                } while(rs.next());

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
     
      /*
     This function accepts the Applicant
     */
     public boolean Qualified(int employeeID) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "update`employee-personal-information`set status = 'Qualified' where employeeID = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, employeeID);

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean createContract(EmployeeSafeguardInfo employeeSafeguardInfo) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into `employee-safeguard-information` (employeeID, license, contractStart, contractEnd, numberOfYears, status) values (?,?,?,?,?,?);";
            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, employeeSafeguardInfo.getEmployeeID());
            pstmt.setString(2, employeeSafeguardInfo.getLicense());
            pstmt.setDate(3, employeeSafeguardInfo.getContractStart());
            pstmt.setDate(4, employeeSafeguardInfo.getContractEnd());
            pstmt.setInt(5,employeeSafeguardInfo.getNumberOfYears());
            pstmt.setString(6, employeeSafeguardInfo.getStatus());

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
        
}
//hi