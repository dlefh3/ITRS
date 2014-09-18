/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package base;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Daniel
 */
public class ApprovalMain extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            String message, url = "/ApprovalMain.jsp";
            String dbURL = "jdbc:mysql://localhost:3306/itrs";
            String username = "root";
            String dbpassword = "sesame";
            ArrayList<CompRequest> comp = new ArrayList<CompRequest>();
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
            }

            try{
                Connection conn = DriverManager.getConnection(dbURL,username,dbpassword);
                Statement s = conn.createStatement();
                ResultSet r = s.executeQuery("SELECT * FROM comprequest NATURAL JOIN department NATURAL JOIN games " +
                            "NATURAL JOIN seating NATURAL JOIN employee " +
                            "WHERE comp_status = 0 ORDER BY games.GAME_DATE");
                while(r.next())
                {
                    CompRequest c = new CompRequest();
                    c.setRequest(r);
                    comp.add(c);
                }
                r.close();
                r = null;
                s.close();
                s = null;
                request.getSession().setAttribute("comp", comp);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);

            }
            catch(SQLException e)
            {

            }


        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
