/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;



/**
 *
 * @author see_h
 */
public class EmployeeSafeguardInfo {

    private transient int employeeID;
    private transient String license;
    private Date contractStart;
    private Date contractEnd;
    private int numberOfYears;
    private String currentClient;
    private transient String status;
    private int numberOfDays;
    private String assignedTo;

    /**
     * @return the height
     */
    public int getEmployeeID() {
        return employeeID;
    }

    /**
     * @param height the height to set
     */
    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    /**
     * @return the license
     */
    public String getLicense() {
        return license;
    }

    /**
     * @param license the license to set
     */
    public void setLicense(String license) {
        this.license = license;
    }

    /**
     * @return the contractStart
     */
    public Date getContractStart() {
        return contractStart;
    }

    /**
     * @param contractStart the contractStart to set
     */
    public void setContractStart(Date contractStart) {
        this.contractStart = contractStart;
    }

    /**
     * @return the contractEnd
     */
    public Date getContractEnd() {
        return contractEnd;
    }

    /**
     * @param contractEnd the contractEnd to set
     */
    public void setContractEnd(Date contractEnd) {
        this.contractEnd = contractEnd;
    }

    /**
     * @return the numberOfYears
     */
    public int getNumberOfYears() {
        return numberOfYears;
    }

    /**
     * @param numberOfYears the numberOfYears to set
     */
    public void setNumberOfYears(int numberOfYears) {
        this.numberOfYears = numberOfYears;
    }

    /**
     * @return the currentClient
     */
    public String getCurrentClient() {
        return currentClient;
    }

    /**
     * @param currentClient the currentClient to set
     */
    public void setCurrentClient(String currentClient) {
        this.currentClient = currentClient;
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
     * @return the numberOfDays
     */
    public int getNumberOfDays() {
        return numberOfDays;
    }

    /**
     * @param numberOfDays the numberOfDays to set
     */
    public void setNumberOfDays(int numberOfDays) {
        this.numberOfDays = numberOfDays;
    }

    /**
     * @return the assignedTo
     */
    public String getAssignedTo() {
        return assignedTo;
    }

    /**
     * @param assignedTo the assignedTo to set
     */
    public void setAssignedTo(String assignedTo) {
        this.assignedTo = assignedTo;
    }
    
}
