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
public class Ticket {
     private int ticketID;
    private int guardInvolved;
    private Date complaintDate;
    private String subject;
    private String status;
    private String complaintDetails;
    private int establishment;
    private String severity;

    /**
     * @return the ticketID
     */
    public int getTicketID() {
        return ticketID;
    }

    /**
     * @param ticketID the ticketID to set
     */
    public void setTicketID(int ticketID) {
        this.ticketID = ticketID;
    }

    /**
     * @return the guardInvolved
     */
    public int getGuardInvolved() {
        return guardInvolved;
    }

    /**
     * @param guardInvolved the guardInvolved to set
     */
    public void setGuardInvolved(int guardInvolved) {
        this.guardInvolved = guardInvolved;
    }

    /**
     * @return the subject
     */
    public String getSubject() {
        return subject;
    }

    /**
     * @param subject the subject to set
     */
    public void setSubject(String subject) {
        this.subject = subject;
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
     * @return the complaintDetails
     */
    public String getComplaintDetails() {
        return complaintDetails;
    }

    /**
     * @param complaintDetails the complaintDetails to set
     */
    public void setComplaintDetails(String complaintDetails) {
        this.complaintDetails = complaintDetails;
    }

    /**
     * @return the establishment
     */
    public int getEstablishment() {
        return establishment;
    }

    /**
     * @param establishment the establishment to set
     */
    public void setEstablishment(int establishment) {
        this.establishment = establishment;
    }

    /**
     * @return the complaintDate
     */
    public Date getComplaintDate() {
        return complaintDate;
    }

    /**
     * @param complaintDate the complaintDate to set
     */
    public void setComplaintDate(Date complaintDate) {
        this.complaintDate = complaintDate;
    }

    /**
     * @return the severity
     */
    public String getSeverity() {
        return severity;
    }

    /**
     * @param severity the severity to set
     */
    public void setSeverity(String severity) {
        this.severity = severity;
    }

}
