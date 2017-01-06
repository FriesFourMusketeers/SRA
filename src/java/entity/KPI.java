/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author JohnMichael
 */
public class KPI {

    private int clientID;
    private int kpiID;
    private int measureID;
    private Double weight;
    private int greenTarget;
    private int yellowTarget;
    private int redTarget;

    /**
     * @return the clientID
     */
    public int getClientID() {
        return clientID;
    }

    /**
     * @param clientID the clientID to set
     */
    public void setClientID(int clientID) {
        this.clientID = clientID;
    }

    /**
     * @return the kpiID
     */
    public int getKpiID() {
        return kpiID;
    }

    /**
     * @param kpiID the kpiID to set
     */
    public void setKpiID(int kpiID) {
        this.kpiID = kpiID;
    }

    /**
     * @return the measureID
     */
    public int getMeasureID() {
        return measureID;
    }

    /**
     * @param measureID the measureID to set
     */
    public void setMeasureID(int measureID) {
        this.measureID = measureID;
    }

    /**
     * @return the weight
     */
    public Double getWeight() {
        return weight;
    }

    /**
     * @param weight the weight to set
     */
    public void setWeight(Double weight) {
        this.weight = weight;
    }

    /**
     * @return the greenTarget
     */
    public int getGreenTarget() {
        return greenTarget;
    }

    /**
     * @param greenTarget the greenTarget to set
     */
    public void setGreenTarget(int greenTarget) {
        this.greenTarget = greenTarget;
    }

    /**
     * @return the yellowTarget
     */
    public int getYellowTarget() {
        return yellowTarget;
    }

    /**
     * @param yellowTarget the yellowTarget to set
     */
    public void setYellowTarget(int yellowTarget) {
        this.yellowTarget = yellowTarget;
    }

    /**
     * @return the redTarget
     */
    public int getRedTarget() {
        return redTarget;
    }

    /**
     * @param redTarget the redTarget to set
     */
    public void setRedTarget(int redTarget) {
        this.redTarget = redTarget;
    }

}