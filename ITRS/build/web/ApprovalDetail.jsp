
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITRS - Comp Request Approval Detail</title>


    </head>
    <body>
        <h1>ITRS - Comp Request Approval Detail</h1>
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
                    <td colspan="2">Waiting for approval</td>

                </tr>

                <tr style="font-weight: bold;">
                    <td colspan="4">Submit Date</td>
                </tr>

                <tr>
                    <td colspan="4">${comp.subDate}</td>
                </tr>        
            </tbody>
        </table>

            <table style="border-style: none;">
                <tr>
                    <td colspan="3">Request Denial Reason:</td>

                </tr>

                <tr>
                    <td colspan="3">
                        <form name="request_deny" action="Approve" method="POST">

                        <textarea name="deny_reason" rows="4" cols="25"></textarea>
                        <input type="hidden" name="reqNumber" value="${comp.compNum}" />
                        <input type="hidden" name="appr" value="false" />
                    </td>
                </tr>

                <tr>
                    <td><input type="submit" value="Deny" name="deny" /></form></td>
                    <td><form name="request_approve" action="Approve" method="POST">
                            <input type="hidden" name="reqNumber" value="${comp.compNum}" />
                            <input type="hidden" name="appr" value="true" />
                            <input type="submit" value="Approve" name="approve" />
                        </form></td>
                    <td><form name="main" action="ApprovalMain">
                        <input type="submit" value="Back to Main" name="main" />
                    </form></td>
                </tr>
            </table>



    </body>
</html>
