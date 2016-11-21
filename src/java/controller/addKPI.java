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
            KPI kpiinfo = new KPI();
            KPI defaultinfo = new KPI();
            FinalKPI defaultkpi = new FinalKPI();
            KpiDAO kpiDAO = new KpiDAO();

            String assessmentformTypeOG = request.getParameter("assessmentformTypeOG");
            System.out.println(assessmentformTypeOG);

            if (assessmentformTypeOG.equals("Default")) {
                String[] defaultname = request.getParameterValues("defaultname");
                System.out.println(defaultname.length);
                String[] defaulttarget = request.getParameterValues("defaultmeasure");
                String[] defaultoperator = request.getParameterValues("defaultoperator");
                String[] defaultweight = request.getParameterValues("defaultweight");

                for (int i = 0; i < defaultname.length; i++) {
                    defaultinfo.setPerformanceMeasure(defaultname[i]);
                    defaultinfo.setOperator(defaultoperator[i]);
                    defaultinfo.setTarget(defaulttarget[i]);
                    boolean successful3 = kpiDAO.createNewKPI1(defaultinfo);

                    defaultkpi.setClientID(Integer.parseInt(request.getParameter("clientName")));
                    defaultkpi.setKpiID(1);
                    defaultkpi.setMeasureID(kpiDAO.getLastMeasure().get(0).getMeasureID());
                    defaultkpi.setWeight(Double.parseDouble(defaultweight[i]));
                    defaultkpi.setComputeFor("Everyday");
                    boolean successful4 = kpiDAO.createNewKPI3(defaultkpi);

                    if (successful3 && successful4 == true) {
                        HttpSession session = request.getSession();
                        session.setAttribute("", kpiinfo);
                        url = "/dashboard.jsp";
                        System.out.println("successful");
                    } else {
                        url = "/addKPI.jsp";
                    }
                }
            }

            if (assessmentformTypeOG.equals("Custom")) {

                String[] kpiname = request.getParameterValues("kpiname");
                String[] measurename = request.getParameterValues("name");
                String[] operator = request.getParameterValues("target");
                String[] measuretarget = request.getParameterValues("target");
                String[] measureweight = request.getParameterValues("weight");
                String[] measurecount = request.getParameterValues("measurecount");

                for (int i = 0; i < kpiname.length; i++) {
                    kpiinfo.setClientKPI(Integer.parseInt(request.getParameter("clientName")));
                    System.out.println(request.getParameter("clientName"));
                    kpiinfo.setPerformanceArea(kpiname[i]);
                    System.out.println(kpiname[i]);

                    boolean successful1 = kpiDAO.createNewKPI(kpiinfo);

                    for (int j = 0; j < Integer.parseInt(measurecount[i]); j++) {
                        kpiinfo.setPerformanceMeasure(measurename[j]);
                        kpiinfo.setOperator(operator[j]);
                        kpiinfo.setTarget(measuretarget[j]);
                        System.out.println(measurename[j]);
                        System.out.println(measuretarget[j]);
                        System.out.println(measureweight[j]);

                        boolean successful = kpiDAO.createNewKPI1(kpiinfo);

                        FinalKPI kpi1 = new FinalKPI();
                        kpi1.setKpiID(kpiDAO.getLastCustomKpi().get(0).getKpiID());
                        kpi1.setClientID(kpiDAO.getLastCustomKpi().get(0).getClientID());
                        kpi1.setMeasureID(kpiDAO.getLastMeasure().get(0).getMeasureID());
                        kpi1.setWeight(Double.parseDouble(measureweight[j]));
                        kpi1.setComputeFor("PRT");

                        boolean successful2 = kpiDAO.createNewKPI3(kpi1);

                        if (successful && successful1 && successful2 == true) {
                            HttpSession session = request.getSession();
                            session.setAttribute("", kpiinfo);
                            url = "/dashboard.jsp";
                            System.out.println("successful");
                        } else {
                            url = "/addKPI.jsp";
                        }
                    }
                }
            }

            if (assessmentformTypeOG.equals("Default + custom")) {

                boolean successful = false;
                boolean successful1 = false;
                boolean successful2 = false;
                boolean successful3 = false;
                boolean successful4 = false;
                
                String[] defaultname = request.getParameterValues("defaultname");
                String[] defaulttarget = request.getParameterValues("defaultmeasure");
                String[] defaultoperator = request.getParameterValues("defaultoperator");
                String[] defaultweight = request.getParameterValues("defaultweight");

                for (int i = 0; i < defaultname.length; i++) {
                    defaultinfo.setPerformanceMeasure(defaultname[i]);
                    defaultinfo.setOperator(defaultoperator[i]);
                    defaultinfo.setTarget(defaulttarget[i]);
                    successful3 = kpiDAO.createNewKPI1(defaultinfo);

                    defaultkpi.setClientID(Integer.parseInt(request.getParameter("clientName")));
                    defaultkpi.setKpiID(1);
                    defaultkpi.setMeasureID(kpiDAO.getLastMeasure().get(0).getMeasureID());
                    defaultkpi.setWeight(Double.parseDouble(defaultweight[i]));
                    defaultkpi.setComputeFor("Everyday");
                    successful4 = kpiDAO.createNewKPI3(defaultkpi);
                }
                
                String[] kpiname = request.getParameterValues("kpiname");
                String[] measurename = request.getParameterValues("name");
                String[] operator = request.getParameterValues("target");
                String[] measuretarget = request.getParameterValues("target");
                String[] measureweight = request.getParameterValues("weight");
                String[] measurecount = request.getParameterValues("measurecount");

                for (int i = 0; i < kpiname.length; i++) {
                    kpiinfo.setClientKPI(Integer.parseInt(request.getParameter("clientName")));
                    System.out.println(request.getParameter("clientName"));
                    kpiinfo.setPerformanceArea(kpiname[i]);
                    System.out.println(kpiname[i]);

                    successful1 = kpiDAO.createNewKPI(kpiinfo);

                    for (int j = 0; j < Integer.parseInt(measurecount[i]); j++) {
                        kpiinfo.setPerformanceMeasure(measurename[j]);
                        kpiinfo.setOperator(operator[j]);
                        kpiinfo.setTarget(measuretarget[j]);
                        System.out.println(measurename[j]);
                        System.out.println(measuretarget[j]);
                        System.out.println(measureweight[j]);

                        successful = kpiDAO.createNewKPI1(kpiinfo);

                        FinalKPI kpi1 = new FinalKPI();
                        kpi1.setKpiID(kpiDAO.getLastCustomKpi().get(0).getKpiID());
                        kpi1.setClientID(kpiDAO.getLastCustomKpi().get(0).getClientID());
                        kpi1.setMeasureID(kpiDAO.getLastMeasure().get(0).getMeasureID());
                        kpi1.setWeight(Double.parseDouble(measureweight[j]));
                        kpi1.setComputeFor("PRT");

                        successful2 = kpiDAO.createNewKPI3(kpi1);

                        
                    }
                }
                if (successful && successful1 && successful2 && successful3 && successful4 == true) {
                            HttpSession session = request.getSession();
                            session.setAttribute("", kpiinfo);
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
