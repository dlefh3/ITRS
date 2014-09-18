<%-- 
    Document   : ViewPaidDetail
    Created on : Oct 30, 2009, 5:23:17 PM
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITRS - paid Request Detail</title>
    </head>
    <body>
        <h1>ITRS - paid Request Detail</h1>
        <br />
        <A HREF="javascript:javascript:history.go(-1)">Back to previous page</A>
        <hr />
        <h3>paid Request #: ${paid.paidNum}</h3>
        <table border="1">
            <tbody>
                <tr style="font-weight: bold;" >
                    <td>Account Number</td>
                    <td>Requestor Name</td>
                    <td>Department</td>
                    <td>Game Date / Opponent</td>
                </tr>
                <tr>
                    <td>${paid.acctNum}</td>
                    <td>${paid.FName}&nbsp;${paid.LName}</td>
                    <td>${paid.department}</td>
                    <td>${paid.game} / ${paid.opponent} </td>
                </tr>
                <tr style="font-weight: bold;">
                    <td>Section</td>
                    <td>Requested Seats</td>
                    <td>Actual Seats</td>
                    <td>Amount Due</td>
                </tr>
                <tr>
                    <td>${paid.section}</td>
                    <td>${paid.reqSeats}</td>
                    <td>${paid.actSeats}&nbsp</td>
                    <td>${paid.amtDue}&nbsp</td>
                </tr>

                <tr style="font-weight: bold;">
                    <td>Ticket Office Instruction</td>
                    <td>Location Not Available?</td>
                    <td colspan="2">Request Status</td>

                </tr>
                <tr>
                    <td>
                        <c:choose>
                            <c:when test="${paid.toi == true}">
                                Leave at Will-Call
                            </c:when>
                            <c:when test="${paid.toi == false}">
                                Return to Requestor
                            </c:when>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${paid.locNA == true}">
                                Cancel Request
                            </c:when>
                            <c:when test="${paid.locNA == false}">
                                Next Best Seats
                            </c:when>
                        </c:choose>
                    </td>
                    <td colspan="2">
                        <c:choose>
                            <c:when test="${paid.status == 0}">
                                Submitted, Waiting for purchase
                            </c:when>
                            <c:when test="${paid.status == 1}">
                                Purchased
                            </c:when>
                            <c:when test="${paid.status == 2}">
                                Purchase Denied
                            </c:when>
                            <c:when test="${paid.status == 3}">
                                Canceled, Employee Request
                            </c:when>
                            <c:when test="${paid.status == 4}">
                                Completed
                            </c:when>

                        </c:choose>
                    </td>

                </tr>
                <tr style="font-weight: bold;">
                    <td colspan="2">Submit Date</td>
                    <td colspan="2">Purchase Date</td>

                </tr>
                <tr>
                    <td colspan="2">${paid.subDate}&nbsp</td>
                    <td colspan="2">${paid.purchDate}&nbsp</td>

                </tr>
                <tr style="font-weight: bold;">
                    <td colspan="4">Deny Reason</td>

                </tr>
                <tr>
                    <td colspan="4">${paid.denyReason}&nbsp</td>

                </tr>
                <tr>
                    <td>CC Type</td>
                    <td>CC Number</td>
                    <td>Sec. Number</td>
                    <td>CC Expiration</td>
                </tr>
                <tr>
                    <td>${paid.cardType}</td>
                    <td>${paid.cardNumProt}</td>
                    <td>${paid.cardSecNum}</td>
                    <td>${paid.cardExpir}</td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
