<%-- 
    Document   : Verify
    Created on : Nov 6, 2009, 5:54:42 PM
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITRS - Confirm Request</title>
    </head>
    <body>
        <h1>Confirm Ticket Request</h1>
        <p>Please confirm the details of your request</p>
        
        <hr />
        <c:if test="${type == 'comp'}">
        <table border="1">
            <tbody>
                <tr style="font-weight: bold;" >
                    <td>Account Number</td>
                    <td>Requestor Name</td>
                    <td>Department</td>
                    <td>Game Date</td>
                </tr>
                <tr>
                    <td>${newComp.acctNum}</td>
                    <td>${newComp.FName}&nbsp;${newComp.LName}</td>
                    <td>${newComp.department}</td>
                    <td>${newComp.game}</td>
                </tr>
                <tr style="font-weight: bold;">
                    <td>Section</td>
                    <td>Requested Seats</td>

                    <td>Opponent</td>
                </tr>

                <tr>
                    <td>${newComp.section}</td>
                    <td>${newComp.reqSeats}</td>

                    <td>${newComp.opponent}</td>
                </tr>

                <tr style="font-weight: bold;">
                    <td>Recipient</td>
                    <td colspan="3">Purpose</td>
                </tr>

                <tr>
                    <td>${newComp.recipient}</td>
                    <td colspan="3">${newComp.purpose}&nbsp</td>

                </tr>

                <tr style="font-weight: bold;">
                    <td>Ticket Office Instruction</td>
                    <td>Location Not Available?</td>
                </tr>

                <tr>
                    <td>
                        <c:choose>
                            <c:when test="${newComp.toi == true}">
                                Leave at Will-Call
                            </c:when>
                             <c:when test="${newComp.toi == false}">
                                Return to Requestor
                            </c:when>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${newComp.locNA == true}">
                                Cancel Request
                            </c:when>
                             <c:when test="${newComp.locNA == false}">
                                Next Best Seats
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </tbody>
        </table>
        </c:if>

        <c:if test="${type == 'paid'}">
        <table border="1">
            <tbody>
                <tr style="font-weight: bold;" >
                    <td>Account Number</td>
                    <td>Requestor Name</td>
                    <td>Department</td>
                    <td>Game Date</td>
                </tr>
                <tr>
                    <td>${newPaid.acctNum}</td>
                    <td>${newPaid.FName}&nbsp;${newPaid.LName}</td>
                    <td>${newPaid.department}</td>
                    <td>${newPaid.game}</td>
                </tr>
                <tr style="font-weight: bold;">
                    <td>Section</td>
                    <td>Requested Seats</td>

                    <td>Opponent</td>
                </tr>

                <tr>
                    <td>${newPaid.section}</td>
                    <td>${newPaid.reqSeats}</td>

                    <td>${newPaid.opponent}</td>
                </tr>

                <tr style="font-weight: bold;">
                    <td>Recipient</td>
                    <td colspan="3"></td>
                </tr>

                <tr>
                    <td>${newPaid.recipient}&nbsp;</td>
                    <td colspan="3"></td>

                </tr>
                <tr>
                    <td>Credit Card Number:</td>
                    <td>Credit Card Security Number:</td>
                    <td>Credit Card Type:</td>
                    <td>Credit Card Expiration:</td>
                </tr>
                <tr>
                    <td>${newPaid.cardNumProt}</td>
                    <td>${newPaid.cardSecNum}</td>
                    <td>${newPaid.cardType}</td>
                    <td>${newPaid.cardExpir}</td>
                </tr>
                <tr style="font-weight: bold;">
                    <td>Ticket Office Instruction</td>
                    <td>Location Not Available?</td>
                </tr>

                <tr>
                    <td>
                        <c:choose>
                            <c:when test="${newPaid.toi == true}">
                                Leave at Will-Call
                            </c:when>
                             <c:when test="${newPaid.toi == false}">
                                Return to Requestor
                            </c:when>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${newPaid.locNA == true}">
                                Cancel Request
                            </c:when>
                             <c:when test="${newPaid.locNA == false}">
                                Next Best Seats
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </tbody>
        </table>

        
        </c:if>
        <p>Estimated price is $${estPrice}</p>
        <table border="0" cellspacing="3">
                        <tr>
                            <td>
                                <form name="confirm" action="Submit" method="POST">
                                    <c:choose>
                                        <c:when test="${type == 'comp'}">
                                            <input type="hidden" name="type" value ="comp">
                                            <input type="submit" value="Confirm" name="confirm" />
                                        </c:when>
                                        <c:when test="${type == 'paid'}">
                                            <input type="hidden" name="type" value ="paid">
                                            <input type="submit" value="Confirm" name="confirm" />
                                        </c:when>

                                    </c:choose>

                                </form>
                            </td>
                            <td>
                                <form name="cancel" action="Main.jsp" method="POST">
                                    <input type="submit" value="Cancel" name="cancel" />
                                </form>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${type == 'comp'}">
                                        <form name="edit" action="NewComp.jsp" method="POST">
                                            <input type="submit" value="Edit" name="edit" />
                                        </form>
                                    </c:when>
                                    <c:when test="${type == 'paid'}">
                                        <form name="edit" action="NewPaid.jsp" method="POST">
                                            <input type="submit" value="Edit" name="edit" />
                                        </form>
                                    </c:when>
                                </c:choose>

                            </td>
                        </tr>

                    </table>
    </body>
</html>
