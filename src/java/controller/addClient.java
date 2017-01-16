/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ClientDAO;
import entity.Client;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
public class addClient extends HttpServlet {

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
        
            ClientDAO clientDAO = new ClientDAO();
            
            Client client = new Client();
            
           
            client.setClientName(request.getParameter("clientName"));
            client.setContactPerson(request.getParameter("contactPerson"));
            client.setContactNumber(request.getParameter("contactNumber"));
            client.setEmail(request.getParameter("clientEmail"));
            client.setAddress(request.getParameter("clientAddress"));
            client.setCity(request.getParameter("clientCity"));
            client.setNumberOfGuards(Integer.parseInt(request.getParameter("numberOfGuards")));
            client.setType(request.getParameter("clientType"));
            
          
            
     
            boolean successful = clientDAO.inputClient(client);
        
        
            if (successful == true){
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/dashboard.jsp");
                rd.forward(request, response);
                System.out.println("successful");
            }else{
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/add-client.jsp");
                rd.forward(request, response);
            }

                out.close();
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

  



