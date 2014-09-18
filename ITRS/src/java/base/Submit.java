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
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author Daniel
 */
public class Submit extends HttpServlet {
   
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
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date d = new Date();
        String date = dateFormat.format(d);

        try {

            String message, url = "/index.jsp";
            String dbURL = "jdbc:mysql://localhost:3306/itrs";
            String username = "root";
            String dbpassword = "sesame";
            try
            {
                Class.forName("com.mysql.jdbc.Driver");

            }
            catch (ClassNotFoundException e)
            {}


            String type = request.getParameter("type");
            PaidRequest paid = new PaidRequest();
            CompRequest comp = new CompRequest();

            if (type.equalsIgnoreCase("comp"))
            {
                url = "/RequestConfirmation.jsp";
                comp = (CompRequest) request.getSession().getAttribute("newComp");
                out.println(comp);
                try
                {
                    Connection conn = DriverManager.getConnection(dbURL, username, dbpassword);
                    
                    
                    String command = "INSERT INTO comprequest VALUE(NULL," + comp.getAcctNum() + "," +
                            comp.getDepNum() + "," + comp.getGameNum() + "," + comp.getSecNum() + "," +
                            comp.getReqSeats() + ",?,?," +
                            "null," + comp.getLocNA() + "," + comp.getToi() + ",0,CURDATE(),null,null,null)";
                    request.getSession().setAttribute("comm", command);
                    PreparedStatement s = conn.prepareStatement(command);
                    s.setString(1, comp.getRecipient());
                    s.setString(2, comp.getPurpose());

                    s.executeUpdate();
                    
                   
                    
                    request.getSession().setAttribute("warning", s.getWarnings());
                    ResultSet r = s.executeQuery("SELECT LAST_INSERT_ID()");
                    int reqNumber = -1;
                    if(r.next())
                    {
                        reqNumber = r.getInt(1);
                    }
                    r.close();
                    request.getSession().setAttribute("reqNumber", reqNumber);
                    request.getSession().setAttribute("request", comp);


                }
                catch (SQLException sqle)
                {

                }

            }
            if (type.equalsIgnoreCase("paid"))
            {
                url = "/RequestConfirmation.jsp";
                paid = (PaidRequest) request.getSession().getAttribute("newPaid");
                out.println(paid);
                try
                {
                    Connection conn = DriverManager.getConnection(dbURL, username, dbpassword);


                    String command = "INSERT INTO paidrequest VALUE(NULL," + paid.getAcctNum() + "," +
                            paid.getDepNum() + "," + paid.getGameNum() + "," + paid.getSecNum() + "," +
                            paid.getReqSeats() + ",null,0," + paid.getLocNA() + "," + paid.getToi() + "," +
                            "?,?,?,?,?,0,CURDATE(),null,null)";
                    request.getSession().setAttribute("comm", command);
                    PreparedStatement s = conn.prepareStatement(command);
                    s.setString(1, paid.getCardType());
                    s.setString(2, paid.getCardNum());
                    s.setString(3, paid.getCardSecNum());
                    s.setString(4, paid.getCardExpir());
                    s.setString(5, paid.getRecipient());
                   
                    s.executeUpdate();



                    request.getSession().setAttribute("warning", s.getWarnings());
                    ResultSet r = s.executeQuery("SELECT LAST_INSERT_ID()");
                    int reqNumber = -1;
                    if(r.next())
                    {
                        reqNumber = r.getInt(1);
                    }
                    r.close();
                    request.getSession().setAttribute("reqNumber", reqNumber);
                    request.getSession().setAttribute("request", paid);


                }
                catch (SQLException sqle)
                {

                }

            }
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
           
        } 
        finally
        {
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
