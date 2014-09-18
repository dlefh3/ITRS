<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITRS - Purchase Approval Detail</title>


    </head>
    <body>
        <h1>ITRS - Purchase Approval Detail</h1>
        <br />
        <A HREF="javascript:javascript:history.go(-1)">Back to previous page</A>
        <hr />
        <h3>Request: ${type}#${reqNum}</h3>
        ${message}
        <table border="1">
            <thead>
                <tr>
                    <th>Game Date</th>
                    <th>Opponent</th>
                    <th>Section</th>
                    <th>Requested Seats</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${request.game}</td>
                    <td>${request.opponent}</td>
                    <td>${request.section}</td>
                    <td>${request.reqSeats}</td>
                </tr>
                <tr style="font-weight: bold;">
                    <td colspan="2">Ticket Office Instruction:</td>
                    <td colspan="2">Locaction Not Available:</td>
                    
                </tr>
                <tr>
                    <td colspan="2">
                        <c:choose>
                            <c:when test="${request.toi == true}">
                                Leave at Will-Call
                            </c:when>
                             <c:when test="${request.toi == false}">
                                Return to Requestor
                            </c:when>
                        </c:choose>
                    </td>
                    <td  colspan="2">
                        <c:choose>
                            <c:when test="${request.locNA == true}">
                                Cancel Request
                            </c:when>
                             <c:when test="${request.locNA == false}">
                                Next Best Seats
                            </c:when>
                        </c:choose>
                    </td>
                    
                </tr>
            </tbody>
        </table>
        <c:if test="${type == 'paid'}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Card Type</th>
                        <th>Card Number</th>
                        <th>Card Expiration</th>
                        <th>Security Number</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${request.cardType}</td>
                        <td>${request.cardNum}</td>
                        <td>${request.cardExpir}</td>
                        <td>${request.cardSecNum}</td>
                    </tr>
                </tbody>
            </table>

        </c:if>

        <table style="border-style: none;">
            <tr>
                <td colspan="3">Purchase Denial Reason:</td>


            </tr>

            <tr>
                <td colspan="3">
                    <form name="request_deny" action="Purchase" method="POST">

                        <textarea name="deny_reason" rows="4" cols="25"></textarea>
                        <input type="hidden" name="actSeats" value="${request.reqSeats}" />
                        <input type="hidden" name="reqNumber" value="${reqNum}" />
                        <input type="hidden" name="appr" value="false" />
                        <input type="hidden" name="type" value="${type}" />
                </td>
            </tr>

            <tr>
                <td><input type="submit" value="Deny" name="deny" /></form></td>
                <td><form name="request_approve" action="Purchase" method="POST">
                        <input type="hidden" name="reqNumber" value="${reqNum}" />
                        <input type="hidden" name="appr" value="true" />
                        <input type="hidden" name="type" value="${type}" />
                        <input type="hidden" name="actSeats" value="${request.reqSeats}" />
                        <input type="submit" value="Approve" name="approve" />
                    </form></td>
                <td><form name="main" action="PurchaseMain">
                        <input type="submit" value="Back to Purchaser Screen" name="main" />
                    </form></td>
            </tr>
        </table>



    </body>
</html>
