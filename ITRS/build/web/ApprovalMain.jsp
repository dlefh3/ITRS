<%-- 
    Document   : ApprovalMain
    Created on : Dec 18, 2009, 5:30:59 PM
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comp Request Approval - ITRS</title>
    </head>
    <body>
        <h1>Comp Request Approval System</h1>
        <p>These ticket comp requests are awaiting approval.</p>
        <p>Click on the ticket requests number to access approval page and request details.</p>
        <form name="main" action="loadMain" method="POST">
            <input type="submit" value="Return to Main" name="main" onClick="loadMain"/>
        </form>
        
        <table border="1" width="100%">
                <tr>
                    <th>Request Number</th>
                    <th>Requestor Name</th>
                    <th>Game Date</th>
                    <th>Department</th>
                </tr>
            <c:forEach var="c" items="${comp}">
                    <tr>
                    <td><a href="ApprovalDetail?comp_num=${c.compNum}">${c.compNum}</a></td>
                    <td>${c.FName}&nbsp;${c.LName}</td>
                    <td>${c.game}</td>
                    <td>${c.department}</td>
                    </tr>

            </c:forEach>
        </table>
    </body>
</html>
