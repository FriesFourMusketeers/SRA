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
public class viewClientEmployeeGrade extends HttpServlet {

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
            ArrayList<PerformanceReviewScores> scores;
            
            EmployeeDAO employeeDAO = new EmployeeDAO();
            
            String year = request.getParameter("yearSelected");
            scores = employeeDAO.getClientEmployeeGrade(Integer.parseInt(year));
            
//            scores2 = employeeDAO.get;
            
            JSONArray jarrayChartsDAO = new JSONArray();
            JSONObject ObjectAll = new JSONObject();
            
            for(int i = 0; i < scores.size(); i++){
                JSONObject objChartsDAO = new JSONObject();
                
                objChartsDAO.put("empID", scores.get(i).getEmployeeID());
                objChartsDAO.put("score", scores.get(i).getScore());
                jarrayChartsDAO.put(objChartsDAO);
            }
            
            ObjectAll.put("series", jarrayChartsDAO);
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
            Logger.getLogger(viewClientEmployeeGrade.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(viewClientEmployeeGrade.class.getName()).log(Level.SEVERE, null, ex);
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
