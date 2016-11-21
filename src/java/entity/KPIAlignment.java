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
public class KPIAlignment {
    
    private int kpiID;
    private String clientID;
    private String performanceMeasure;
    private String questionID;
    private String question;
    private String questionType;

    public int getKpiID() {
        return kpiID;
    }

    public void setKpiID(int kpiID) {
        this.kpiID = kpiID;
    }

    public String getPerformanceMeasure() {
        return performanceMeasure;
    }

    public void setPerformanceMeasure(String performanceMeasure) {
        this.performanceMeasure = performanceMeasure;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public KPIAlignment() {
    }

    /**
     * @return the clientID
     */
    public String getClientID() {
        return clientID;
    }

    /**
     * @param clientID the clientID to set
     */
    public void setClientID(String clientID) {
        this.clientID = clientID;
    }

    /**
     * @return the questionID
     */
    public String getQuestionID() {
        return questionID;
    }

    /**
     * @param questionID the questionID to set
     */
    public void setQuestionID(String questionID) {
        this.questionID = questionID;
    }
    
    
    
}
