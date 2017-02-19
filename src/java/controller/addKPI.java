/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.KpiDAO;
import dao.TicketDAO;
import entity.FinalKPI;
import entity.KPI;
import entity.Ticket;
import java.io.IOException;
import java.text.ParseException;
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
public class addKPI extends HttpServlet {

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
            KPI defaultinfo = new KPI();

            int length = 0;

            String[] green = request.getParameterValues("weeklytarget");
            String[] yellow = request.getParameterValues("belowtarget");
            String[] red = request.getParameterValues("wellbelowtarget");
            String[] weight = request.getParameterValues("defaultweight");
            
            String[] customgreen = request.getParameterValues("customtarget");
            String[] customyellow = request.getParameterValues("custombelowtarget");
            String[] customred = request.getParameterValues("customwellbelowtarget");
            String[] customweight = request.getParameterValues("customweight");
            
            String[] kpi1 = request.getParameterValues("kpi1");
            String[] kpi2 = request.getParameterValues("kpi2");
            String[] kpi3 = request.getParameterValues("kpi3");
            String[] kpi4 = request.getParameterValues("kpi4");
            String[] kpi5 = request.getParameterValues("kpi5");
            
            String[] customkpi = request.getParameterValues("kpiname");
            String[] pmcount = request.getParameterValues("pmcount");


            
            
            
            
            
            
            
            
            
            
            
            
            for (int i = 0; i < kpimeasurenumber.length; i++) {
                int measurenumber = Integer.parseInt(kpimeasurenumber[i]);

                defaultinfo.setKpiID(i);
                for (int j = 0; j < measurenumber; j++) {
                    defaultinfo.setMeasureID(length + 1);
                    defaultinfo.setGreenTarget(Integer.parseInt(green[length]));
                    defaultinfo.setYellowTarget(Integer.parseInt(yellow[length]));
                    defaultinfo.setRedTarget(Integer.parseInt(red[length]));
                    defaultinfo.setWeight(Double.parseDouble(weight[length]));
                    length++;
                }
            }

            KpiDAO kpiDAO = new KpiDAO();

            boolean successful = kpiDAO.createNewKPI(defaultinfo);

            if (successful == true) {
                HttpSession session = request.getSession();
                session.setAttribute("", defaultinfo);
                url = "/dashboard.jsp";
                System.out.println("successful");
            } else {
                url = "/addKPI.jsp";
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
