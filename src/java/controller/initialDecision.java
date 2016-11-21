/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.EmployeeDAO;
import dao.ScheduleDAO;
import entity.Schedule;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author John San Agustin
 */
public class initialDecision extends HttpServlet {

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
            throws ServletException, IOException {
        
   
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
        processRequest(request, response);
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
        PrintWriter out = response.getWriter();
        
        
        if (request.getParameter("first") != null) {
        
            EmployeeDAO employeeDAO = new EmployeeDAO();
            System.out.println(request.getParameter("applicantID"));
            System.out.println(request.getParameter("applicantReason"));
            
            boolean successful = employeeDAO.notQualified(Integer.parseInt(request.getParameter("applicantID")),request.getParameter("applicantReason"));
        
        
            if (successful == true){
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/dashboard.jsp");
                rd.forward(request, response);
                System.out.println("successful");
            }else{
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/ApplicantList.jsp");
                rd.forward(request, response);
            }
                out.close();
           }
        else if (request.getParameter("second") != null) {
            
            try {
    
                ScheduleDAO scheduleDAO = new ScheduleDAO();
                Schedule schedule = new Schedule();
                schedule.setEmployeeID(Integer.parseInt(request.getParameter("applicantID")));
                
                DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                String schedDate = request.getParameter("applicantSchedDate");
                
                
                Date date;
                date = format.parse(schedDate);
                java.sql.Date sql = new java.sql.Date(date.getTime());
                schedule.setScheduledDate(sql);
                schedule.setScheduledTime(request.getParameter("applicantSchedTime"));
                
                boolean successful = scheduleDAO.inputSchedule(schedule);
                
                EmployeeDAO employeeDAO = new EmployeeDAO();
                
                boolean successful2 = employeeDAO.InterviewScheduled(Integer.parseInt(request.getParameter("applicantID")));
                
                
                
                
                if (successful == true && successful2 == true){
                    ServletContext context= getServletContext();
                    RequestDispatcher rd= context.getRequestDispatcher("/dashboard.jsp");
                    rd.forward(request, response);
                    System.out.println("successful");
                }else{
                    ServletContext context= getServletContext();
                    RequestDispatcher rd= context.getRequestDispatcher("/ApplicantList.jsp");
                    rd.forward(request, response);
                }
                out.close();
            } catch (ParseException ex) {
                Logger.getLogger(initialDecision.class.getName()).log(Level.SEVERE, null, ex);
            }
                    }
        
        else if (request.getParameter("third") != null) {
            
           
            EmployeeDAO employeeDAO = new EmployeeDAO();
            boolean successful = employeeDAO.Waitlisted(Integer.parseInt(request.getParameter("applicantID")));
            if (successful == true){
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/dashboard.jsp");
                rd.forward(request, response);
                System.out.println("successful");
            }else{
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/ApplicantList.jsp");
                rd.forward(request, response);
            }
            out.close();
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
