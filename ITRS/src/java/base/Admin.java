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
public class Admin extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        ArrayList<CompRequest> comp = new ArrayList<CompRequest>();
        ArrayList<PaidRequest> paid = new ArrayList<PaidRequest>();

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Employee emp = (Employee) request.getSession().getAttribute("emp");
        String type = request.getParameter("type");
        

        String url="/Main.jsp";
        String message = "";
        String dbURL = "jdbc:mysql://localhost:3306/itrs";
        String username = "root";
        String dbpassword = "sesame";
        if(!(emp.getLoggedIn() && emp.getAdmin()))
        {
            url="/index.jsp";
        }
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e){}
        
        try
        {
            
            
            if(type.equalsIgnoreCase("comprequest"))
            {
                url = "/ViewComp.jsp";
                Connection conn = DriverManager.getConnection(dbURL,username,dbpassword);
                Statement s = conn.createStatement();
                String qry = "SELECT * FROM " + type + " NATURAL JOIN department" +
                    " NATURAL JOIN games NATURAL JOIN seating NATURAL JOIN employee ORDER BY dep_name";
                ResultSet r = s.executeQuery(qry);
            
                while (r.next())
                {
                    CompRequest c = new CompRequest();
                    c.setRequest(r);
                    comp.add(c);
                } 
            
                
                r.close();
                r = null;
                s.close();
                s = null;
            }
            else
            {
                url = "/ViewPaid.jsp";
                Connection conn = DriverManager.getConnection(dbURL,username,dbpassword);
                Statement s = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
                String qry = "SELECT * FROM " + type + " NATURAL JOIN department" +
                    " NATURAL JOIN games NATURAL JOIN seating NATURAL JOIN employee ORDER BY dep_name";
                
                ResultSet r = s.executeQuery(qry);
                while (r.next())
                {
                    PaidRequest p = new PaidRequest();
                    p.setRequest(r);
                    paid.add(p);
                }
                
            }
            
        } 
        catch (SQLException e)
        {
            message = "SQL Error: " + e.getMessage();
        }
        request.getSession().setAttribute("paid", paid);
        request.getSession().setAttribute("comp", comp);
        request.setAttribute("message", message);
        request.setAttribute("emp", emp);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
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
