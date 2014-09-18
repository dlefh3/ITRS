<%-- 
    Document   : test
    Created on : Dec 18, 2009, 12:34:31 PM
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css" media="print">
.printbutton {
  visibility: hidden;
  display: none;
}
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Succeeded</title>
    </head>
    <body>
        <h1>Tickets Request</h1>
        <p>Your request for ${type} tickets was succsesfull.</p>
        <p>Your confirmation number: ${type}#${reqNumber};</p>
        ${emp}
        <table border="1">
            <tr>
                <td>Game:</td>
                <td>${request.game}</td>
            </tr>
            <tr>
                <td>Opponent:</td>
                <td>${request.opponent}</td>
            </tr>
            <tr>
                <td>Section:</td>
                <td>${request.section}</td>
            </tr>
            <tr>
                <td>Requested Seats:</td>
                <td>${request.reqSeats}</td>
            </tr>
            <tr>
                <td>Estimated Price:</td>
                <td>$${estPrice}</td>
            </tr>
            <tr>
                <td>
                    <script>
                        document.write("<input type='button' " +
                            "onClick='window.print()' " +
                            "class='printbutton' " +
                            "value='Print'/>");
                    </script></td>
                <td>
                    <form name="main" action="loadMain">
                        <input type="submit" value="Back to Main" name="main" />
                    </form>
                </td>
            </tr>

        </table>

        
    </body>
</html>
