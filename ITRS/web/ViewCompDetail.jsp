<%-- 
    Document   : CompDetail
    Created on : Oct 30, 2009, 3:42:56 PM
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITRS - Comp Request Detail</title>
    </head>
    <body>
        <h1>ITRS - Comp Request Detail</h1>
        <br />
        <A HREF="javascript:javascript:history.go(-1)">Back to previous page</A>
        <hr />
        <h3>Comp Request #: ${comp.compNum}</h3>
        <table border="1">
            <tbody>
                <tr style="font-weight: bold;" >
                    <td>Account Number</td>
                    <td>Requestor Name</td>
                    <td>Department</td>
                    <td>Game Date</td>
                </tr>
                <tr>
                    <td>${comp.acctNum}</td>
                    <td>${comp.FName}&nbsp;${comp.LName}</td>
                    <td>${comp.department}</td>
                    <td>${comp.game}</td>
                </tr>
                <tr style="font-weight: bold;">
                    <td>Section</td>
                    <td>Requested Seats</td>
                    <td>Actual Seats</td>
                    <td>Opponent</td>
                </tr>
                <tr>
                    <td>${comp.section}</td>
                    <td>${comp.reqSeats}</td>
                    <td>${comp.actSeats}&nbsp</td>
                    <td>${comp.opponent}</td>
                </tr>
                <tr style="font-weight: bold;">
                    <td>Recipient</td>
                    <td colspan="3">Purpose</td>
                    
                </tr>
                <tr>
                    <td>${comp.recipient}</td>
                    <td colspan="3">${comp.purpose}&nbsp</td>
                    
                </tr>
                <tr style="font-weight: bold;">
                    <td>Ticket Office Instruction</td>
                    <td>Location Not Available?</td>
                    <td colspan="2">Request Status</td>
                    
                </tr>
                <tr>
                    <td>
                        <c:choose>
                            <c:when test="${comp.toi == true}">
                                Leave at Will-Call
                            </c:when>
                             <c:when test="${comp.toi == false}">
                                Return to Requestor
                            </c:when>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${comp.locNA == true}">
                                Cancel Request
                            </c:when>
                             <c:when test="${comp.locNA == false}">
                                Next Best Seats
                            </c:when>
                        </c:choose>
                    </td>
                    <td colspan="2">
                        <c:choose>
                            <c:when test="${comp.status == 0}">
                                Waiting for approval
                            </c:when>
                             <c:when test="${comp.status == 1}">
                                Waiting for purchase
                            </c:when>
                            <c:when test="${comp.status == 2}">
                               Purchased
                            </c:when>
                            <c:when test="${comp.status == 3}">
                                Approval Denied
                            </c:when>
                            <c:when test="${comp.status == 4}">
                                Purchase Denied
                            </c:when>
                            <c:when test="${comp.status == 5}">
                                Canceled, employee request
                            </c:when>
                            <c:when test="${comp.status == 6}">
                                Completed
                            </c:when>
                        </c:choose>
                    </td>
                    
                </tr>
                <tr style="font-weight: bold;">
                    <td>Submit Date</td>
                    <td>Approval/Deny Date</td>
                    <td colspan="2">Purchase Date</td>
                    
                </tr>
                <tr>
                    <td>${comp.subDate}&nbsp</td>
                    <td>${comp.apprDate}&nbsp</td>
                    <td colspan="2">${comp.purchDate}&nbsp</td>
                    
                </tr>
                <tr style="font-weight: bold;">
                    <td colspan="4">Deny Reason</td>
                    
                </tr>
                <tr>
                    <td colspan="4">${comp.denyReason}&nbsp</td>

                </tr>
            </tbody>
        </table>



    </body>
</html>
