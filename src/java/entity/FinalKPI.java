/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author John San Agustin
 */
public class FinalKPI {
    
    private int kpiID;
    private int clientID;
    private int measureID;
    private Double weight;

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

    
    
    
    
}
