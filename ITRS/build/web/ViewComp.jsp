
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITRS - View Comp Requests</title>
    </head>
    <body>
        <h1>All Comp Requests in ITRS</h1>
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
        <table border="1" width="100%">    
                <tr>
                    <th>Request Number</th>
                    <th>Requestor Name</th>
                    <th>Game Date</th>
                    <th>Department</th>
                    <th>Status</th>
                </tr>      
            <c:forEach var="c" items="${comp}">                 
                    <tr>
                    <td><a href="CompDetail?comp_num=${c.compNum}">${c.compNum}</a></td>
                    <td>${c.FName}&nbsp;${c.LName}</td>
                    <td>${c.game}</td>
                    <td>${c.department}</td>
                    <td>
                        <c:choose>
                            <c:when test="${c.status == 0}">
                                Waiting for Approval
                            </c:when>
                            <c:when test="${c.status == 1}">
                                Approval Denied
                            </c:when>
                            <c:when test="${c.status == 2}">
                                Waiting for Purchase
                            </c:when>
                            <c:when test="${c.status == 3}">
                                Purchase Denied
                            </c:when>
                            <c:when test="${c.status == 4}">
                                Purchased
                            </c:when>
                            <c:when test="${c.status == 5}">
                                Canceled by Requestor
                            </c:when>
                            <c:when test="${c.status == 6}">
                                Complete
                            </c:when>
                        </c:choose>
                    </td>
                    </tr>
                    
            </c:forEach>
        </table>
    </body>
</html>
