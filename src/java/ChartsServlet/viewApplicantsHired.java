/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ChartsServlet;

import dao.ChartsDAO;
import dao.EmployeeDAO;
import entity.Charts;
import entity.PerformanceReviewScores;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author see_h
 */
public class viewApplicantsHired extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JSONException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ArrayList<Charts> charts;
            ArrayList<Charts> chartsQualified;
            
            ChartsDAO chartsDAO = new ChartsDAO();
            
            String year = request.getParameter("yearSelected");
            
            charts = chartsDAO.getNumberOfQualifiedApplicants(Integer.parseInt(year));
            chartsQualified = chartsDAO.getNumberOfApplicants(Integer.parseInt(year));
            
            JSONArray jarrayChartsDAO = new JSONArray();
            JSONArray jarrayChartsDAO2 = new JSONArray();
            JSONObject ObjectAll = new JSONObject();
            
            for(int i = 0; i < charts.size(); i++){
                JSONObject objChartsDAO = new JSONObject();
                
                objChartsDAO.put("month", charts.get(i).getDateInputtedMonth());
                objChartsDAO.put("year", charts.get(i).getDateInputtedYear());
                objChartsDAO.put("count", charts.get(i).getApplicantCount());
                System.out.println(charts.get(i).getDateInputtedMonth() + " " + charts.get(i).getApplicantCount() + "viewPerformanceD");
                jarrayChartsDAO.put(objChartsDAO);
            }
            
            for(int i = 0; i < chartsQualified.size(); i++){
                JSONObject objChartsDAO2 = new JSONObject();
                
                objChartsDAO2.put("month", chartsQualified.get(i).getDateInputtedMonth());
                objChartsDAO2.put("year", chartsQualified.get(i).getDateInputtedYear());
                objChartsDAO2.put("count", chartsQualified.get(i).getApplicantCount());
                System.out.println(chartsQualified.get(i).getDateInputtedMonth() + " " + chartsQualified.get(i).getApplicantCount() + "viewPerformanceD2");
                jarrayChartsDAO2.put(objChartsDAO2);
            }
            
            ObjectAll.put("series", jarrayChartsDAO);
            ObjectAll.put("series2", jarrayChartsDAO2);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write("["+ObjectAll.toString()+"]");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(viewApplicantsHired.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(viewApplicantsHired.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
