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
import java.util.StringTokenizer;
import java.sql.Date;

/**
 *
 * @author Daniel
 */
public class Validate extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String url = "/Main.jsp";
        String message = "";
        boolean error = false;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try 
        {
            String type = request.getParameter("type");
            
            Employee emp = (Employee) request.getSession().getAttribute("emp");
            request.getSession().setAttribute("emp", emp);
            CompRequest comp = new CompRequest();
            PaidRequest paid = new PaidRequest();
            StringTokenizer st;
            if (type.compareToIgnoreCase("comp") == 0)
            {
                url = "/NewComp.jsp";

                comp.setAcctNum(emp.getAcctNum());
                comp.setFName(emp.getFName());
                comp.setLName(emp.getLName());
                comp.setDepNum(emp.getDepNum());
                comp.setDepartment(emp.getDepName());

                String game = request.getParameter("game");
                st = new StringTokenizer(game, ",");
                comp.setGameNum(Integer.parseInt(st.nextToken()));
                comp.setGame(Date.valueOf(st.nextToken()));
                comp.setOpponent(st.nextToken());


                String section = request.getParameter("section");
                st = new StringTokenizer(section, ",");
                comp.setSecNum(Integer.parseInt(st.nextToken()));
                comp.setSection(st.nextToken());
                int reg = Integer.parseInt(st.nextToken());
                int prem = Integer.parseInt(st.nextToken());
                out.println(prem);
                comp.setReqSeats(Integer.parseInt(request.getParameter("num_seats")));

                if (comp.getReqSeats() < 1) {
                    message += "<br />You must request atleast 1 ticket!";
                    error = true;
                }
                comp.setRecipient(request.getParameter("recipient"));
                if (comp.getRecipient().isEmpty()) {
                    message += "<br />You must specify a recipient!";
                    error = true;
                }

                comp.setPurpose(request.getParameter("purpose"));
                if (comp.getPurpose().isEmpty()) {
                    message += "<br />You must specify a business reason for request!";
                    error = true;
                }
                comp.setLocNA(Boolean.parseBoolean(request.getParameter("locna")));
                comp.setToi(Boolean.parseBoolean(request.getParameter("toi")));
                

                request.getSession().setAttribute("newComp", comp);
                request.getSession().setAttribute("reg", reg);
                request.getSession().setAttribute("prem", prem);
               

            }
            if (type.compareToIgnoreCase("paid") == 0)
            {
                url = "/NewPaid.jsp";
                paid.setAcctNum(emp.getAcctNum());
                paid.setFName(emp.getFName());
                paid.setLName(emp.getLName());
                paid.setDepNum(emp.getDepNum());
                paid.setDepartment(emp.getDepName());

                String game = request.getParameter("game");
                st = new StringTokenizer(game, ",");
                paid.setGameNum(Integer.parseInt(st.nextToken()));
                paid.setGame(Date.valueOf(st.nextToken()));
                paid.setOpponent(st.nextToken());


                String section = request.getParameter("section");
                st = new StringTokenizer(section, ",");
                paid.setSecNum(Integer.parseInt(st.nextToken()));
                paid.setSection(st.nextToken());
                int reg = Integer.parseInt(st.nextToken());
                int prem = Integer.parseInt(st.nextToken());
                int seats = 0;
                try
                {
                    seats = Integer.parseInt(request.getParameter("num_seats"));
                }
                catch(NumberFormatException nfe)
                {
                    error = true;
                    message += "<br />Not a valid number!";
                }
                paid.setReqSeats(seats);

                if (paid.getReqSeats() < 1) {
                    message += "<br />You must request atleast 1 ticket!";
                    error = true;
                }

                String ccType = request.getParameter("ccType");
                String ccNum = request.getParameter("ccNumber");
                if(ccNum.length() != 16 )
                {
                    if (ccNum.length() == 15 && ccType.equalsIgnoreCase("American Express"))
                    {

                    }
                   else {
                        error = true;
                        message += "<br />Credit Card Number is not valid number!";
                        message += "<br />ccNum.lenght() = " + ccNum.length();
                        message += "<br />ccType = " + ccType;

                    }
                }
                
                try
                {
                    long ccLong = new Long("0");
                    ccLong = Long.parseLong(ccNum);
                    //15 digit for AmEx
                    if (ccNum.length() != 15 && ccType.equalsIgnoreCase("American Express"))
                    {
                        error = true;
                        message += "<br />Credit Card Number is not valid. Must be 15 digits for American Express cards";

                    }
                    //16Digit for not-AmEx
                    if (ccNum.length() != 16 && !ccType.equalsIgnoreCase("American Express"))
                    {
                            if( !ccType.equalsIgnoreCase("American Express"))
                    {
                        error = true;
                        message += "<br />Credit Card Number is not valid. Must be 16 digits for " + ccType + " cards!";
                    }
                    }
                }
                catch(NumberFormatException nfe)
                {
                    error = true;
                    message += "<br />Not a valid credit card number!";
                }
                
                catch(NullPointerException npe)
                {
                    error = true;
                    message += "<br />NullPointerException!";
                    
                }
 
                String ccExpir = request.getParameter("ccExpir");
                int expir = 0;
                try
                {
                     expir = Integer.parseInt(ccExpir);

                }
                catch(NumberFormatException nfe)
                {
                   error = true;
                }

                if (ccExpir.length() < 4 || (expir < 1209 || expir > 1299))
                {
                    error = true;
                    message += "<br />Not a valid expiration date";
                }
                String secNum = request.getParameter("ccSec");
                int secLength = secNum.length();
                if ( (secLength == 3 && ccType.equalsIgnoreCase("American Express"))
                        || (secLength == 4 && !ccType.equalsIgnoreCase("American Express"))
                        || secLength < 3 )
                {
                    error = true;
                    message +="<br />Not a valid security number for this card type: " + ccType;
                }


                try
                {
                    int sec = Integer.parseInt(secNum);
                }
                catch(NumberFormatException nfe)
                {
                    error =true;
                    message += "<br />Not a valid security number";
                }

                paid.setCardExpir(ccExpir);
                paid.setCardType(ccType);
                paid.setCardNum(ccNum);
                paid.setCardSecNum(secNum);
                String recipient = request.getParameter("recipient");
                paid.setRecipient(recipient);



                paid.setLocNA(Boolean.parseBoolean(request.getParameter("locna")));
                paid.setToi(Boolean.parseBoolean(request.getParameter("toi")));
                int estPrice = 0;
                if ((paid.getGame().getMonth() >= 5 && paid.getGame().getMonth() <= 10) &&
                        (paid.getGame().getDay() == 5 || paid.getGame().getDay() == 6 
                        || paid.getGame().getDay() == 0))
                {
                    estPrice = prem * paid.getReqSeats();
                } 
                else
                {
                    estPrice = reg * paid.getReqSeats();
                }

                request.getSession().setAttribute("newPaid", paid);
                request.getSession().setAttribute("reg", reg);
                request.getSession().setAttribute("prem", prem);
                request.getSession().setAttribute("estPrice", estPrice);


            }
            request.getSession().setAttribute("type", type);
            if (!error)
            {
                url = "/Verify.jsp";
            }
            request.getSession().setAttribute("newComp", comp);
            request.setAttribute("m", message);
            request.getSession().setAttribute("emp", emp);
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
