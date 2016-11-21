/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import dao.EvaluationScoreDAO;
import entity.KPI;
import dao.KpiDAO;
import entity.tempQuestion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jaayy
 */
public class results extends HttpServlet {

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
        try {
            String url = "";
            ArrayList<tempQuestion> questionList = new ArrayList<tempQuestion>();
            
            for (int y = 0; y < 3; y++) {
            System.out.println(Integer.parseInt(request.getParameter("radios" + y)));
            tempQuestion tempQuestion = new tempQuestion();
            System.out.println(request.getParameter("question"+ y));
            tempQuestion.setQuestionID(request.getParameter("question"+ y));
            System.out.println(request.getParameter("measure"+ y));
            tempQuestion.setMeasure(request.getParameter("measure"+ y));
            tempQuestion.setScore(Integer.parseInt(request.getParameter("radios" + y)));
            System.out.print("Score: "+ tempQuestion.getScore());
            questionList.add(tempQuestion);
            }
            
            EvaluationScoreDAO score = new EvaluationScoreDAO();
            KpiDAO kpiDAO = new KpiDAO();
            ArrayList<KPI> kpiList = kpiDAO.getAllKpiByClient("Alabang Town Center");
            
            System.out.println(score.getScore(kpiList, questionList));
            
            
            boolean successful = true;

            if (successful == true) {
//                HttpSession session = request.getSession();
//                session.setAttribute("", radios);
//                url = "/dashboard.jsp";
                System.out.println("successful");
            } else {
//                url = "/addKPI.jsp";
                                System.out.println("not");
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
        processRequest(request, response);
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
