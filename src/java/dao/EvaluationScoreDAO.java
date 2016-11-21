/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.KPI;

import entity.tempQuestion;
import java.util.ArrayList;

/**
 *
 * @author John San Agustin
 */
public class EvaluationScoreDAO {
    
//    public double getScore(ArrayList<tempMeasure> measureList,ArrayList<tempQuestion> questionList){
//       
//     double finalScore = 0.00;
//        double tempScore = 0.00;
//        double measureScore= 0.00;
//        double itemCounter = 0.00;
//        int j = 0;
//        
//         
//        for(int i = 0; i < measureList.size(); i++){
//            for( j = 0; j < questionList.size(); j++){
//               
//                if(measureList.get(i).getId().equalsIgnoreCase(questionList.get(j).getMeasure())){
//                    
//                    tempScore += questionList.get(j).getScore()/5;
//
//                    itemCounter++;
//                }
//               
//                if(j == questionList.size()-1){
//                    
//                    measureScore+=((tempScore/itemCounter)*(measureList.get(i).getWeight()/100));
//
//                    System.out.println("Measure Score Total "+measureList.get(i).getId()+" "+measureScore);
//                    
//                    finalScore+=measureScore;
//                    
//                    measureScore = 0.00;
//                    tempScore = 0.00;
//                    itemCounter = 0.00;
//                    
//                    
//                   
//                    
//                 }
//         }
//            
//        }
//        
//        //System.out.println(Math.round(finalScore*100));
//            
//        
//        return finalScore*100;
//    }
    
    public double getScore(ArrayList<KPI> measureList,ArrayList<tempQuestion> questionList){
       
     double finalScore = 0.00;
        double tempScore = 0.00;
        double measureScore= 0.00;
        double itemCounter = 0.00;
        int j = 0;
        
         
        for(int i = 0; i < measureList.size(); i++){
            for( j = 0; j < questionList.size(); j++){
               
                if(measureList.get(i).getPerformanceMeasure().equalsIgnoreCase(questionList.get(j).getMeasure())){
                    
                    tempScore += questionList.get(j).getScore()/5;
                    
                    System.out.println(questionList.get(j).getScore());

                    itemCounter++;
                }
               
                if(j == questionList.size()-1){
                    
                    measureScore+=((tempScore/itemCounter)*(measureList.get(i).getWeight()/100));

                    System.out.println("Measure Score Total "+measureList.get(i).getPerformanceMeasure()+" "+measureScore);
                    
                    finalScore+=measureScore;
                    
                    measureScore = 0.00;
                    tempScore = 0.00;
                    itemCounter = 0.00;
                    
                    
                   
                    
                 }
         }
            
        }
        
        //System.out.println(Math.round(finalScore*100));
            
        
        return finalScore*100;
    }
    
}
