/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author JohnMichael
 */
public class Allocation {
    
    private int allocationID;
    private int clientID;
    private String status;
    private int employeeID;
    private String license;
    private Date contractStart;
    private Date contractEnd;

    /**
     * @return the allocationID
     */
    public int getAllocationID() {
        return allocationID;
    }

    /**
     * @param allocationID the allocationID to set
     */
    public void setAllocationID(int allocationID) {
        this.allocationID = allocationID;
    }

    /**
     * @return the client
     */
    public int getClientID() {
        return clientID;
    }

    /**
     * @param clientID
     */
    public void setClientID(int clientID) {
        this.clientID = clientID;
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
}
