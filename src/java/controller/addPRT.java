/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.KpiDAO;
import dao.PerformanceReviewDAO;
import dao.TicketDAO;
import entity.KPI;
import entity.KPIAlignment;
import entity.PerformanceRevTemplate;
import entity.Ticket;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JohnMichael
 */
public class addPRT extends HttpServlet {

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
            KPIAlignment kpiAlign = new KPIAlignment();
            PerformanceReviewDAO perfDAO = new PerformanceReviewDAO();

            String url = "";

            String clientName = request.getParameter("clientName");

            String[] question = request.getParameterValues("question");
            String[] questionType = request.getParameterValues("assessmentformQuestionType");
            String[] kpiID = request.getParameterValues("assessmentformSelectKPI");
            String[] performancemeasure = request.getParameterValues("assessmentformSelectPM");

            for (int i = 0; i < question.length; i++) {

                kpiAlign.setKpiID(Integer.parseInt(kpiID[i]));

                kpiAlign.setClientID(clientName);

                kpiAlign.setPerformanceMeasure(performancemeasure[i]);

                kpiAlign.setQuestion(question[i]);

                kpiAlign.setQuestionType(questionType[i]);

                boolean successful = perfDAO.createNewPRT1(kpiAlign);

                kpiAlign.setQuestionID(perfDAO.getLastCustomQuestion().get(0).getQuestionID());
                
                boolean successful1 = perfDAO.createNewPRT(kpiAlign);
                
                if (successful && successful1 == true) {
                    HttpSession session = request.getSession();
                    session.setAttribute("", kpiAlign);
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
            Logger.getLogger(addApplicant.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(addApplicant.class.getName()).log(Level.SEVERE, null, ex);
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
