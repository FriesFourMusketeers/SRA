/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;
import java.util.Objects;

/**
 *
 * @author John San Agustin
 */
public class Charts {
    
    
    private int ticketPerM;
    private String ticketMonth;
    private int ticketPerY;
    private String ticketYear;
    private String ticketSeverity;
    private int severityCount;
    private String ticketStatus;
    private int statusCount;
    
    private int sserAverage;
    private double sserScore;
    private double sserEmployeeScore;
    private String sserYear;
    private String sserMonth;
    private String sserWeek;
    private int clientID;
    private String clientName;
    private int employeeID;
    private String employeeName;
    private String employeeMonth;
    private String employeeYear;
    private int employeePerM;
    private int employeePerY;
    
    private int qualifiedGuards;
    private int activeGuards;
    
    private int applicantCount;
    private String applicantMonth;
    private String applicantYear;
    
    private int licenseCount;
    private String licenseType;
    
    private Date dateInputted;
    private String dateInputtedMonth;
    private String dateInputtedYear;
    private String status;
    private int count;
    private String city;
    
    private String clientType;
    private String weekNo;

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 17 * hash + Objects.hashCode(this.sserYear);
        hash = 17 * hash + Objects.hashCode(this.sserMonth);
        hash = 17 * hash + Objects.hashCode(this.sserScore);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Charts other = (Charts) obj;
        if (!Objects.equals(this.sserYear, other.sserYear) && !Objects.equals(this.sserMonth, other.sserMonth) && !Objects.equals(this.sserScore, other.sserScore)) {
            return false;
        }
        
        return true;
    }

    public String getSserWeek() {
        return sserWeek;
    }

    public void setSserWeek(String sserWeek) {
        this.sserWeek = sserWeek;
    }

    public double getSserEmployeeScore() {
        return sserEmployeeScore;
    }

    public void setSserEmployeeScore(double sserEmployeeScore) {
        this.sserEmployeeScore = sserEmployeeScore;
    }
    
    public int getClientID() {
        return clientID;
    }

    public void setClientID(int clientID) {
        this.clientID = clientID;
    }
    
    public double getSserScore() {
        return sserScore;
    }

    public void setSserScore(double sserScore) {
        this.sserScore = sserScore;
    }

    public String getSserYear() {
        return sserYear;
    }

    public void setSserYear(String sserYear) {
        this.sserYear = sserYear;
    }

    public String getSserMonth() {
        return sserMonth;
    }

    public void setSserMonth(String sserMonth) {
        this.sserMonth = sserMonth;
    }

    public int getTicketPerM() {
        return ticketPerM;
    }

    public void setTicketPerM(int ticketPerM) {
        this.ticketPerM = ticketPerM;
    }

    public String getTicketMonth() {
        return ticketMonth;
    }

    public void setTicketMonth(String ticketMonth) {
        this.ticketMonth = ticketMonth;
    }

    public int getTicketPerY() {
        return ticketPerY;
    }

    public void setTicketPerY(int ticketPerY) {
        this.ticketPerY = ticketPerY;
    }

    public String getTicketYear() {
        return ticketYear;
    }

    public void setTicketYear(String ticketYear) {
        this.ticketYear = ticketYear;
    }

    public String getTicketSeverity() {
        return ticketSeverity;
    }

    public void setTicketSeverity(String ticketSeverity) {
        this.ticketSeverity = ticketSeverity;
    }

    public int getSeverityCount() {
        return severityCount;
    }

    public void setSeverityCount(int severityCount) {
        this.severityCount = severityCount;
    }

    public String getTicketStatus() {
        return ticketStatus;
    }

    public void setTicketStatus(String ticketStatus) {
        this.ticketStatus = ticketStatus;
    }

    public int getStatusCount() {
        return statusCount;
    }

    public void setStatusCount(int statusCount) {
        this.statusCount = statusCount;
    }

    public int getSserAverage() {
        return sserAverage;
    }

    public void setSserAverage(int sserAverage) {
        this.sserAverage = sserAverage;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeMonth() {
        return employeeMonth;
    }

    public void setEmployeeMonth(String employeeMonth) {
        this.employeeMonth = employeeMonth;
    }

    public String getEmployeeYear() {
        return employeeYear;
    }

    public void setEmployeeYear(String employeeYear) {
        this.employeeYear = employeeYear;
    }

    public int getEmployeePerM() {
        return employeePerM;
    }

    public void setEmployeePerM(int employeePerM) {
        this.employeePerM = employeePerM;
    }

    public int getEmployeePerY() {
        return employeePerY;
    }

    public void setEmployeePerY(int employeePerY) {
        this.employeePerY = employeePerY;
    }

    public int getQualifiedGuards() {
        return qualifiedGuards;
    }

    public void setQualifiedGuards(int qualifiedGuards) {
        this.qualifiedGuards = qualifiedGuards;
    }

    public int getActiveGuards() {
        return activeGuards;
    }

    public void setActiveGuards(int activeGuards) {
        this.activeGuards = activeGuards;
    }

    public int getApplicantCount() {
        return applicantCount;
    }

    public void setApplicantCount(int applicantCount) {
        this.applicantCount = applicantCount;
    }

    public String getApplicantMonth() {
        return applicantMonth;
    }

    public void setApplicantMonth(String applicantMonth) {
        this.applicantMonth = applicantMonth;
    }

    public String getApplicantYear() {
        return applicantYear;
    }

    public void setApplicantYear(String applicantYear) {
        this.applicantYear = applicantYear;
    }

    

    public Charts() {
    }

    /**
     * @return the licenseCount
     */
    public int getLicenseCount() {
        return licenseCount;
    }

    /**
     * @param licenseCount the licenseCount to set
     */
    public void setLicenseCount(int licenseCount) {
        this.licenseCount = licenseCount;
    }

    /**
     * @return the licenseType
     */
    public String getLicenseType() {
        return licenseType;
    }

    /**
     * @param licenseType the licenseType to set
     */
    public void setLicenseType(String licenseType) {
        this.licenseType = licenseType;
    }

    /**
     * @return the dateInputted
     */
    public Date getDateInputted() {
        return dateInputted;
    }

    /**
     * @param dateInputted the dateInputted to set
     */
    public void setDateInputted(Date dateInputted) {
        this.dateInputted = dateInputted;
    }

    /**
     * @return the dateInputtedMonth
     */
    public String getDateInputtedMonth() {
        return dateInputtedMonth;
    }

    /**
     * @param dateInputtedMonth the dateInputtedMonth to set
     */
    public void setDateInputtedMonth(String dateInputtedMonth) {
        this.dateInputtedMonth = dateInputtedMonth;
    }

    /**
     * @return the dateInputtedYear
     */
    public String getDateInputtedYear() {
        return dateInputtedYear;
    }

    /**
     * @param dateInputtedYear the dateInputtedYear to set
     */
    public void setDateInputtedYear(String dateInputtedYear) {
        this.dateInputtedYear = dateInputtedYear;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the count
     */
    public int getCount() {
        return count;
    }

    /**
     * @param count the count to set
     */
    public void setCount(int count) {
        this.count = count;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the clientType
     */
    public String getClientType() {
        return clientType;
    }

    /**
     * @param clientType the clientType to set
     */
    public void setClientType(String clientType) {
        this.clientType = clientType;
    }

    /**
     * @return the weekNo
     */
    public String getWeekNo() {
        return weekNo;
    }

    /**
     * @param weekNo the weekNo to set
     */
    public void setWeekNo(String weekNo) {
        this.weekNo = weekNo;
    }

    
    
    
    
    
}
