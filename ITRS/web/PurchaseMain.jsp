
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITRS- Ticket Purchaser Screen</title>
    </head>
    <body>
        <h1>ITRS - Ticket Purchaser Screen</h1>
        <form name="main" action="loadMain">
            <input type="submit" value="Back to Main Screen" name="main" />
        </form>
        <table border="1" width="100%">
            <thead>
                <tr>
                    <th>Comp Requests</th>
                    <th>Paid Requests</th>
                </tr>
            </thead>
            <tr>
                <td VALIGN="top">
                    <table border="1" width="100%">
                    <tr>
                        <th>Request Number</th>
                        <th>Requestor Name</th>
                        <th>Game Date</th>
                        <th>Department</th>
                    </tr>
                    <c:forEach var="c" items="${comp}">
                    <tr>
                        <td><a href="PurchaseDetail?comp_num=${c.compNum}&type=comp">${c.compNum}</a></td>
                        <td>${c.FName}&nbsp;${c.LName}</td>
                        <td>${c.game}</td>
                        <td>${c.department}</td>
                    </tr>
                    </c:forEach>
                    </table>
                </td>
                <td VALIGN="top">
                   <table border="1" width="100%">
                    <tr>
                        <th>Request Number</th>
                        <th>Requestor Name</th>
                        <th>Game Date</th>
                        <th>Department</th>
                    </tr>
                    <c:forEach var="p" items="${paid}">
                        <tr>
                        <td><a href="PurchaseDetail?paid_num=${p.paidNum}&type=paid">${p.paidNum}</a></td>
                        <td>${p.FName}&nbsp;${p.LName}</td>
                        <td>${p.game}</td>
                        <td>${p.department}</td>
                    </tr>
                    </c:forEach>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>
