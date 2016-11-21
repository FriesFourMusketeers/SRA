/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author John San Agustin
 */
public class Everyday {
    
    private int employeeID;
    private String attendance;
    private Date date;
    private int everydayID;
    private String violations;
    private String activityLog;

    /**
     * @return the employeeID
     */
    public int getEmployeeID() {
        return employeeID;
    }

    /**
     * @param employeeID the employeeID to set
     */
    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    /**
     * @return the attendance
     */
    public String getAttendance() {
        return attendance;
    }

    /**
     * @param attendance the attendance to set
     */
    public void setAttendance(String attendance) {
        this.attendance = attendance;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * @return the everydayID
     */
    public int getEverydayID() {
        return everydayID;
    }

    /**
     * @param everydayID the everydayID to set
     */
    public void setEverydayID(int everydayID) {
        this.everydayID = everydayID;
    }

    /**
     * @return the violations
     */
    public String getViolations() {
        return violations;
    }

    /**
     * @param violations the violations to set
     */
    public void setViolations(String violations) {
        this.violations = violations;
    }

    /**
     * @return the activityLog
     */
    public String getActivityLog() {
        return activityLog;
    }

    /**
     * @param activityLog the activityLog to set
     */
    public void setActivityLog(String activityLog) {
        this.activityLog = activityLog;
    }


    
    
}
