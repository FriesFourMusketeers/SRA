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

    private int clientKPI;
    private int customKPI;
    private int customMeasure;
    private String performanceArea;
    private String performanceMeasure;
    private String operator;
    private String target;

    /**
     * @return the performanceArea
     */
    public String getPerformanceArea() {
        return performanceArea;
    }

    /**
     * @param performanceArea the performanceArea to set
     */
    public void setPerformanceArea(String performanceArea) {
        this.performanceArea = performanceArea;
    }

    /**
     * @return the performanceMeasure
     */
    public String getPerformanceMeasure() {
        return performanceMeasure;
    }

    /**
     * @param performanceMeasure the performanceMeasure to set
     */
    public void setPerformanceMeasure(String performanceMeasure) {
        this.performanceMeasure = performanceMeasure;
    }

    /**
     * @return the target
     */
    public String getTarget() {
        return target;
    }

    /**
     * @param target the target to set
     */
    public void setTarget(String target) {
        this.target = target;
    }

    /**
     * @return the clientKPI
     */
    public int getClientKPI() {
        return clientKPI;
    }

    /**
     * @param clientKPI the clientKPI to set
     */
    public void setClientKPI(int clientKPI) {
        this.clientKPI = clientKPI;
    }

    /**
     * @return the operator
     */
    public String getOperator() {
        return operator;
    }

    /**
     * @param operator the operator to set
     */
    public void setOperator(String operator) {
        this.operator = operator;
    }

    /**
     * @return the customKPI
     */
    public int getCustomKPI() {
        return customKPI;
    }

    /**
     * @param customKPI the customKPI to set
     */
    public void setCustomKPI(int customKPI) {
        this.customKPI = customKPI;
    }

    /**
     * @return the customMeasure
     */
    public int getCustomMeasure() {
        return customMeasure;
    }

    /**
     * @param customMeasure the customMeasure to set
     */
    public void setCustomMeasure(int customMeasure) {
        this.customMeasure = customMeasure;
    }
}
