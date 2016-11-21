/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author see_h
 */
public class PerformanceReviewScores {
    
    private int scoreID;
    private int prtID;
    private int score;
    private int oicID;
    private int employeeID;
    private Date dateAnswered;
    private String employeeName;
    private String Month;
    private String week;
    private String year;

    /**
     * @return the scoreID
     */
    public int getScoreID() {
        return scoreID;
    }

    /**
     * @param scoreID the scoreID to set
     */
    public void setScoreID(int scoreID) {
        this.scoreID = scoreID;
    }

    /**
     * @return the prtID
     */
    public int getPrtID() {
        return prtID;
    }

    /**
     * @param prtID the prtID to set
     */
    public void setPrtID(int prtID) {
        this.prtID = prtID;
    }

    /**
     * @return the score
     */
    public int getScore() {
        return score;
    }

    /**
     * @param score the score to set
     */
    public void setScore(int score) {
        this.score = score;
    }

    /**
     * @return the oicID
     */
    public int getOicID() {
        return oicID;
    }

    /**
     * @param oicID the oicID to set
     */
    public void setOicID(int oicID) {
        this.oicID = oicID;
    }

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
     * @return the dateAnswered
     */
    public Date getDateAnswered() {
        return dateAnswered;
    }

    /**
     * @param dateAnswered the dateAnswered to set
     */
    public void setDateAnswered(Date dateAnswered) {
        this.dateAnswered = dateAnswered;
    }

    /**
     * @return the employeeName
     */
    public String getEmployeeName() {
        return employeeName;
    }

    /**
     * @param employeeName the employeeName to set
     */
    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    /**
     * @return the Month
     */
    public String getMonth() {
        return Month;
    }

    /**
     * @param Month the Month to set
     */
    public void setMonth(String Month) {
        this.Month = Month;
    }

    /**
     * @return the week
     */
    public String getWeek() {
        return week;
    }

    /**
     * @param week the week to set
     */
    public void setWeek(String week) {
        this.week = week;
    }

    /**
     * @return the year
     */
    public String getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(String year) {
        this.year = year;
    }

    
}
