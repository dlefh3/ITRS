 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITRS - Administration</title>
    </head>
    <body>
        <h1>Administration</h1>
        <p>In this are you may see a view of the requests that are currently in
            the ITRS system. </p>
        
        <hr />
        
        <table>
            <tr>
                <td>
                    <form name="main" action="Admin">
                        <input type="hidden" name="type" value="comprequest" />
                        <input type="submit" value="View Comp Requests" name="main" />
                    </form>
                </td>
                <td>
                    <form name="main" action="Admin">
                        <input type="hidden" name="type" value="paidrequest" />
                        <input type="submit" value="View Paid Requests" name="main" />
                    </form>
                </td>
                <td>
                    <form name="main" action="loadMain">
                        <input type="submit" value="Return to Main" name="main" />
                    </form>
                </td>
            </tr>
        </table>
        
    </body>
</html>
