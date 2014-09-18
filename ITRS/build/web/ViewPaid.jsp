

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITRS - View Paid Requests</title>
    </head>
    <body>
        <h1>All Paid Requests in ITRS</h1>
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
        <table border="1" width="75%">
            <thead>
                <tr>
                    <th>Request Number</th>
                    <th>Requestor Name</th>
                    <th>Game Date</th>
                    <th>Department</th>
                    <th>Status</th>
                </tr>
            </thead>

            <c:forEach var="p" items="${paid}">
                <tbody>
                    <tr>
                    <td><a href="PaidDetail?paid_num=${p.paidNum}">${p.paidNum}</a></td>
                    <td>${p.FName}&nbsp;${p.LName}</td>
                    <td>${p.game}</td>     
                    <td>${p.department}</td>
                    <td>
                        <c:choose>
                            <c:when test="${p.status == 0}">
                                Waiting for Purchase
                            </c:when>
                            <c:when test="${p.status == 1}">
                                Purchased
                            </c:when>
                            <c:when test="${p.status == 2}">
                                Purchase Denied
                            </c:when>
                            <c:when test="${p.status == 3}">
                                Canceled by Requestor
                            </c:when>
                            <c:when test="${p.status == 4}">
                                Completed
                            </c:when>

                        </c:choose>
                    </td>
                    </tr>
                </tbody>
            </c:forEach>
        </table>
    </body>
</html>
