/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ChartsServlet;

import dao.ClientDAO;
import entity.Client;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author see_h
 */
public class viewClientPerformanceDashboard extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ClientDAO cdb = new ClientDAO(); //kng ano talaga ung dao for the scores
            Client prs = new Client(); // kng san ung employee scores na entity
            ArrayList <Client> clientTrends = new ArrayList<Client>();
            String name = request.getParameter("id");
            clientTrends = cdb.getPerformanceByClientName(name);
            
            JSONObject score = new JSONObject();
            JSONObject clientName = new JSONObject();
            
            JSONArray list = new JSONArray();
            JSONArray prod = new JSONArray();

            System.out.print(name);
            if (clientTrends != null) {
            for (int i = 0; i < clientTrends.size(); i++) {
                ArrayList<Integer> sc = new ArrayList<Integer>();
                ArrayList<String> cName = new ArrayList<String>();
                
                sc.add(clientTrends.get(i).getSSERscore());
                cName.add(clientTrends.get(i).getClientName());
                
                list.add(sc);
                prod.add(cName);

                }
                score.put("score", list);
                clientName.put("clientName", prod);
                
            System.out.print(score);
            System.out.print(clientName);
                response.setContentType("applications/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write("[");
                response.getWriter().write(score.toString());
                response.getWriter().write(",");
                response.getWriter().write(clientName.toString());
                response.getWriter().write("]");
            }
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
