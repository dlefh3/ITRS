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
import javax.servlet.http.Cookie;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
/**
 *
 * @author Daniel
 */
public class loadMain extends HttpServlet {
   
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
            ArrayList<CompRequest> comp = new ArrayList<CompRequest>();
            ArrayList<PaidRequest> paid = new ArrayList<PaidRequest>();
            ArrayList<Game> games = new ArrayList<Game>();
            ArrayList<Section> section = new ArrayList<Section>();
            Employee emp = (Employee) request.getSession().getAttribute("emp");
            request.getSession().invalidate();
            request.getSession().setAttribute("emp", emp);
            String message, url = "/index.jsp";
            String dbURL = "jdbc:mysql://localhost:3306/itrs";
            String username = "root";
            String dbpassword = "sesame";
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
            }
            try {
                Connection conn = DriverManager.getConnection(dbURL, username, dbpassword);
                Statement s = conn.createStatement();
                ResultSet r = s.executeQuery("SELECT * FROM employee NATURAL JOIN department WHERE emp_acctnum ='" + emp.getAcctNum() + "'");
                if (r.next()) {
                    emp = new Employee();
                    emp.setEmployee(r);
                    emp.setLoggedIn(emp.getPassword());
                    message = "Employee found: " + emp.getFName() + " " + emp.getLName();
                    r.close();
                    r = null;
                    s.close();
                    s = null;
                    if (emp.getLoggedIn()) {

                        url = "/Main.jsp";
                        s = conn.createStatement();
                        r = s.executeQuery("SELECT * FROM comprequest NATURAL JOIN department NATURAL JOIN games " +
                                "NATURAL JOIN seating NATURAL JOIN employee " +
                                "WHERE emp_acctnum =" + emp.getAcctNum());
                        while (r.next()) {
                            CompRequest c = new CompRequest();
                            c.setRequest(r);
                            comp.add(c);
                        }
                        r.close();
                        r = null;
                        s.close();
                        s = null;
                        s = conn.createStatement();
                        r = s.executeQuery("SELECT * FROM paidrequest NATURAL JOIN department NATURAL JOIN games " +
                                "NATURAL JOIN seating NATURAL JOIN employee " +
                                "WHERE emp_acctnum =" + emp.getAcctNum());
                        while (r.next()) {
                            PaidRequest p = new PaidRequest();
                            p.setRequest(r);
                            paid.add(p);
                        }
                        r.close();
                        r = null;
                        s.close();
                        s = null;
                        s = conn.createStatement();
                        r = s.executeQuery("SELECT * FROM games ORDER BY game_date");
                        Date date = new Date();
                        while (r.next()) {
                            Game g = new Game();
                            g.setGame(r);
                            if (date.compareTo(g.getGameDay()) >= 0) {
                                g.setSoldOut(true);
                            }
                            games.add(g);
                        }
                        r.close();
                        r = null;
                        s.close();
                        s = null;

                        s = conn.createStatement();
                        r = s.executeQuery("SELECT * FROM seating ORDER BY sec_num");
                        while (r.next()) {
                            Section x = new Section();
                            x.setSection(r);
                            section.add(x);
                        }
                        request.getSession().setAttribute("games", games);
                        request.getSession().setAttribute("sections", section);
                        request.getSession().setAttribute("comp", comp);
                        request.getSession().setAttribute("paid", paid);

                    } else {
                        message = "Invalid Password " + emp.getPassword() + " " + emp.getLoggedIn();
                    }

                } else {
                    message = "Unknown user: " + emp.getAcctNum() + ". UserID not found.";
                }
            } catch (SQLException e) {
                message = "SQL Error: " + e.getMessage();
            }


            request.setAttribute("message", message);
            request.getSession().setAttribute("emp", emp);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
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
