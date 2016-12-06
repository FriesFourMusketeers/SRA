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
public class Criteria {
    
    private int minAge;
    private int maxAge;
    private int minHeight;
    private int maxWeight;
    private int minWeight;
    private String bodybuild;
    private String trainingAttended;

    public int getMinAge() {
        return minAge;
    }

    public void setMinAge(int minAge) {
        this.minAge = minAge;
    }

    public int getMaxAge() {
        return maxAge;
    }

    public void setMaxAge(int maxAge) {
        this.maxAge = maxAge;
    }

    public int getMinHeight() {
        return minHeight;
    }

    public void setMinHeight(int minHeight) {
        this.minHeight = minHeight;
    }

    public int getMaxWeight() {
        return maxWeight;
    }

    public void setMaxWeight(int maxWeight) {
        this.maxWeight = maxWeight;
    }

    public int getMinWeight() {
        return minWeight;
    }

    public void setMinWeight(int minWeight) {
        this.minWeight = minWeight;
    }

    public String getBodybuild() {
        return bodybuild;
    }

    public void setBodybuild(String bodybuild) {
        this.bodybuild = bodybuild;
    }

    public String getTrainingAttended() {
        return trainingAttended;
    }

    public void setTrainingAttended(String trainingAttended) {
        this.trainingAttended = trainingAttended;
    }

    public Criteria() {
    }
    
    
}
