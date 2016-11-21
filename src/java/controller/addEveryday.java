/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.EverydayDAO;
import entity.Everyday;
import entity.Score;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JohnMichael
 */
@WebServlet(name = "addEveryday", urlPatterns = {"/addEveryday"})
public class addEveryday extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        java.io.PrintWriter out = response.getWriter();

        try {
            String url = "";
            boolean successful2 = false;
            boolean successful3 = false;
            Everyday everydayinfo = new Everyday();
            Score scoreinfo = new Score();

            String[] employeeID = request.getParameterValues("guardID");
            String[] attendance = request.getParameterValues("attendance");
            
            
            
            Double weight = 5.0;
            Double activity = 0.0;
            Double attendancescore = 0.0;
            Double violationscore = 5.0;
            Double score = 0.0;

            EverydayDAO everydayDAO = new EverydayDAO();

            for (int i = 0; i < employeeID.length; i++) {
                
                if(attendance[i].equalsIgnoreCase("on time")){
                    attendancescore = 5.0;
                }
                
                if(attendance[i].equalsIgnoreCase("late")){
                    attendancescore = 4.0;
                }
                
                if(attendance[i].equalsIgnoreCase("absent")){
                    attendancescore = 3.0;
                }
                
                everydayinfo.setEmployeeID(Integer.parseInt(employeeID[i]));
                scoreinfo.setEmployeeID(Integer.parseInt(employeeID[i]));
                //System.out.println(employeeID[i]);
                everydayinfo.setAttendance(attendance[i]);

                java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
                everydayinfo.setDate(date);
                scoreinfo.setDateAnswered(date);

                String[] violations = request.getParameterValues("violation" + employeeID[i]);
                String[] activityLog = request.getParameterValues("log" + employeeID[i]);

                boolean successful1 = everydayDAO.createNewEveryday(everydayinfo);

                if (!(request.getParameterValues("violation" + employeeID[i]) == null)){
                for (String violation : violations) {
                    everydayinfo.setEverydayID(everydayDAO.getLastEveryday().get(0).getEmployeeID());
                    //System.out.println(violation);
                    everydayinfo.setViolations(violation);
                    successful2 = everydayDAO.createNewEveryday1(everydayinfo);
                    violationscore =- 1.0;
                }
                }
                if (!(request.getParameterValues("log" + employeeID[i]) == null)){
                for (String activityLog1 : activityLog) {
                    everydayinfo.setEverydayID(everydayDAO.getLastEveryday().get(0).getEmployeeID());
                    everydayinfo.setActivityLog(activityLog1);
                    successful3 = everydayDAO.createNewEveryday2(everydayinfo);
                    activity =+ 1.0;
                }
                }
                
                
                if(!(attendance[i].equalsIgnoreCase("leave")) || !(attendance[i].equalsIgnoreCase("day-off"))){
                  score = (((attendancescore + violationscore + activity)/ 3)/ weight);
                  scoreinfo.setScore(score);
                  System.out.println(score);
                  boolean successful4 = everydayDAO.addScore(scoreinfo);
                }

                if (successful1 || successful2 || successful3 == true) {
                    HttpSession session = request.getSession();
                    session.setAttribute("", everydayinfo);
                    url = "/dashboard.jsp";
                    System.out.println("successful");
                } else {
                    url = "/addKPI.jsp";
                }
            }

            ServletContext context = getServletContext();
            RequestDispatcher rd = context.getRequestDispatcher(url);
            rd.forward(request, response);

        } finally {
            out.close();
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
        } catch (ParseException ex) {
            Logger.getLogger(addEveryday.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(addEveryday.class.getName()).log(Level.SEVERE, null, ex);
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
