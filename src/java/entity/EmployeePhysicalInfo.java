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
public class EmployeePhysicalInfo extends EmployeePersonalInfo{
    
    private int height;
    private int weight;
    private String sears;
    private String physicalDefects;
    private String illnesses;
    private String bodyBuild;
    private String skinColor;
    private String stateOfHealth;

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getSears() {
        return sears;
    }

    public void setSears(String sears) {
        this.sears = sears;
    }

    public String getPhysicalDefects() {
        return physicalDefects;
    }

    public void setPhysicalDefects(String physicalDefects) {
        this.physicalDefects = physicalDefects;
    }

    public String getIllnesses() {
        return illnesses;
    }

    public void setIllnesses(String illnesses) {
        this.illnesses = illnesses;
    }

    public String getBodyBuild() {
        return bodyBuild;
    }

    public void setBodyBuild(String bodyBuild) {
        this.bodyBuild = bodyBuild;
    }

    public String getSkinColor() {
        return skinColor;
    }

    public void setSkinColor(String skinColor) {
        this.skinColor = skinColor;
    }

    public String getStateOfHealth() {
        return stateOfHealth;
    }

    public void setStateOfHealth(String stateOfHealth) {
        this.stateOfHealth = stateOfHealth;
    }

    public EmployeePhysicalInfo() {
    }
    
    
}
