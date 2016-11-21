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
import org.json.JSONObject;
import org.json.JSONException;

/**
 *
 * @author see_h
 */
public class viewPerformanceD extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            
            ArrayList<Charts> charts;
            ArrayList<Charts> charts2;
            
            ChartsDAO chartsDAO = new ChartsDAO();
            
            String year = request.getParameter("yearSelected");
            System.out.print(year + "the year");
            charts = chartsDAO.getSafeguardScorePerY(Integer.parseInt(year));
            
            charts2 = chartsDAO.getSafeguardScorePerW(Integer.parseInt(year));
            
            JSONArray jarrayChartsDAO = new JSONArray();
            JSONArray drilldown = new JSONArray();
            JSONObject ObjectAll = new JSONObject();
            
            for(int i = 0; i < charts.size(); i++){
                JSONObject objChartsDAO = new JSONObject();
                
                objChartsDAO.put("month", charts.get(i).getSserMonth());
                objChartsDAO.put("y", charts.get(i).getSserScore());
                System.out.println(charts.get(i).getSserMonth()+ " " + charts.get(i).getSserScore()+ "viewPerformanceD");
                jarrayChartsDAO.put(objChartsDAO);
            }
            
            for(int i = 0; i < charts2.size(); i++){
                JSONObject drillDAO = new JSONObject();
                
                drillDAO.put("month", charts2.get(i).getSserMonth());
                drillDAO.put("y", charts2.get(i).getSserScore());
                drillDAO.put("weeks", charts2.get(i).getSserWeek());
                System.out.println(charts2.get(i).getSserMonth() + " " + charts2.get(i).getSserScore() + "viewPerformanceD drilldown");
                drilldown.put(drillDAO);
            }
            
            ObjectAll.put("series", jarrayChartsDAO);
            ObjectAll.put("drilldown", drilldown);
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
            Logger.getLogger(viewPerformanceD.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(viewPerformanceD.class.getName()).log(Level.SEVERE, null, ex);
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
