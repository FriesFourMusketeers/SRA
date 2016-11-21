/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import dao.TicketDAO;
import entity.Ticket;
import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author John San Agustin
 */
public class addTicket extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {

            String[] guards = request.getParameterValues("GuardInvolved");

            Ticket ticketinfo = new Ticket();

            String url = "";

            for (String guard : guards) {

                java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
                ticketinfo.setComplaintDate(date);

                ticketinfo.setTicketID(Integer.parseInt(request.getParameter("TicketID")));
                System.out.println(Integer.parseInt(request.getParameter("TicketID")));
                ticketinfo.setGuardInvolved(Integer.parseInt(guard));
                System.out.println(Integer.parseInt(guard));
                ticketinfo.setStatus(request.getParameter("TicketStatus"));
                System.out.println(request.getParameter("TicketStatus"));
                ticketinfo.setSubject(request.getParameter("TicketSubject"));
                System.out.println(request.getParameter("TicketSubject"));
                ticketinfo.setEstablishment(Integer.parseInt(request.getParameter("Establishment")));
                System.out.println(request.getParameter("Establishment"));
                ticketinfo.setComplaintDetails(request.getParameter("NewTicketDetails"));
                System.out.println(request.getParameter("NewTicketDetails"));
                ticketinfo.setSeverity("Low");

                TicketDAO ticketDAO = new TicketDAO();

                boolean successful = ticketDAO.createNewTicket(ticketinfo);

                if (successful == true) {
                    HttpSession session = request.getSession();
                    session.setAttribute("", ticketinfo);
                    url = "/dashboard.jsp";
                    System.out.println("successful");
                } else {
                    url = "/addTicket.jsp";
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
