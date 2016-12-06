/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author John San Agustin
 */
public class EmployeeJobInfo extends EmployeePhysicalInfo{
    
    private String driversLicense;
    private Date driversLicenseExpDate;
    private String licenseNo;
    private Date licenseExpDate;
    private String trainingAttended;
    private String formerEmployer;
    private String inclusiveDate;
    private String formerJob;
    private String reasonForLeaving;
    private String TINno;
    private Date TINdate;
    private String licenseType;

    public String getLicenseNo() {
        return licenseNo;
    }

    public void setLicenseNo(String licenseNo) {
        this.licenseNo = licenseNo;
    }

    public String getLicenseType() {
        return licenseType;
    }

    public void setLicenseType(String licenseType) {
        this.licenseType = licenseType;
    }

    public String getDriversLicense() {
        return driversLicense;
    }

    public void setDriversLicense(String driversLicense) {
        this.driversLicense = driversLicense;
    }

    public Date getDriversLicenseExpDate() {
        return driversLicenseExpDate;
    }

    public void setDriversLicenseExpDate(Date driversLicenseExpDate) {
        this.driversLicenseExpDate = driversLicenseExpDate;
    }

    public Date getLicenseExpDate() {
        return licenseExpDate;
    }

    public void setLicenseExpDate(Date licenseExpDate) {
        this.licenseExpDate = licenseExpDate;
    }

   
    public String getTrainingAttended() {
        return trainingAttended;
    }

    public void setTrainingAttended(String trainingAttended) {
        this.trainingAttended = trainingAttended;
    }

    public String getFormerEmployer() {
        return formerEmployer;
    }

    public void setFormerEmployer(String formerEmployer) {
        this.formerEmployer = formerEmployer;
    }

    public String getInclusiveDate() {
        return inclusiveDate;
    }

    public void setInclusiveDate(String inclusiveDate) {
        this.inclusiveDate = inclusiveDate;
    }

    public String getFormerJob() {
        return formerJob;
    }

    public void setFormerJob(String formerJob) {
        this.formerJob = formerJob;
    }

    public String getReasonForLeaving() {
        return reasonForLeaving;
    }

    public void setReasonForLeaving(String reasonForLeaving) {
        this.reasonForLeaving = reasonForLeaving;
    }
    
    

  
    public EmployeeJobInfo() {
    }

    /**
     * @return the TINno
     */
    public String getTINno() {
        return TINno;
    }

    /**
     * @param TINno the TINno to set
     */
    public void setTINno(String TINno) {
        this.TINno = TINno;
    }

    /**
     * @return the TINdate
     */
    public Date getTINdate() {
        return TINdate;
    }

    /**
     * @param TINdate the TINdate to set
     */
    public void setTINdate(Date TINdate) {
        this.TINdate = TINdate;
    }
    
}
