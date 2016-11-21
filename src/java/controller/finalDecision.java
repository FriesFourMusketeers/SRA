/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.EmployeeDAO;
import dao.ScheduleDAO;
import entity.EmployeeSafeguardInfo;
import entity.Schedule;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
public class finalDecision extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
     
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
        
        System.out.println(request.getParameter("employeeID"));
         
       if (request.getParameter("first") != null) {
        
            EmployeeDAO employeeDAO = new EmployeeDAO();
            System.out.println(request.getParameter("employeeID"));
            boolean successful = employeeDAO.Qualified(Integer.parseInt(request.getParameter("employeeID")));
            
            EmployeeSafeguardInfo safeguardInfo = new EmployeeSafeguardInfo();
            safeguardInfo.setEmployeeID(Integer.parseInt(request.getParameter("employeeID")));
            safeguardInfo.setLicense("Basic Security");
            safeguardInfo.setNumberOfYears(0);
            safeguardInfo.setStatus("Unallocated");
            
            
            Calendar date = Calendar.getInstance();
            
            String contractStart = date.get(Calendar.YEAR) +"-"+(date.get(Calendar.MONTH)+1) + "-" + date.get(Calendar.DATE);
            Date sqlDate;
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            try {
                sqlDate = format.parse(contractStart);
                java.sql.Date sql = new java.sql.Date(sqlDate.getTime());
                safeguardInfo.setContractStart(sql);
            } catch (ParseException ex) {
                Logger.getLogger(finalDecision.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            date.add(Calendar.YEAR,3);
            
            contractStart = date.get(Calendar.YEAR) +"-"+(date.get(Calendar.MONTH)+1) + "-" + date.get(Calendar.DATE);
            
            try {
                sqlDate = format.parse(contractStart);
                java.sql.Date sql = new java.sql.Date(sqlDate.getTime());
                safeguardInfo.setContractEnd(sql);
            } catch (ParseException ex) {
                Logger.getLogger(finalDecision.class.getName()).log(Level.SEVERE, null, ex);
            }
            
     
            boolean successful2 = employeeDAO.createContract(safeguardInfo);
        
        
            if (successful == true && successful2 == true){
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/dashboard.jsp");
                rd.forward(request, response);
                System.out.println("successful");
            }else{
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/applicant-schedule.jsp");
                rd.forward(request, response);
            }
                out.close();
           }
        else if (request.getParameter("second") != null) {
            
              EmployeeDAO employeeDAO = new EmployeeDAO();
            System.out.println(request.getParameter("ap-id"));
            boolean successful = employeeDAO.notQualified(Integer.parseInt(request.getParameter("employeeID")),request.getParameter("applicantReason"));
        
        
            if (successful == true){
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/dashboard.jsp");
                rd.forward(request, response);
                System.out.println("successful");
            }else{
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/applicant-schedule.jsp");
                rd.forward(request, response);
            }
                out.close();
          
                    }
        else if (request.getParameter("third") != null) {
        
            EmployeeDAO employeeDAO = new EmployeeDAO();
            System.out.println(request.getParameter("employeeID"));
            boolean successful = employeeDAO.Waitlisted(Integer.parseInt(request.getParameter("employeeID")));
        
        
            if (successful == true){
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/dashboard.jsp");
                rd.forward(request, response);
                System.out.println("successful");
            }else{
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/applicant-schedule.jsp");
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
