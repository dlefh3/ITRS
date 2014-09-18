<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITRS - New Paid Ticket Request</title>
    </head>
    <body>
        <h1>Paid Ticket Request Form</h1>
        <p>Please fill out this form to submit a request for paid tickets. </p>
        <p>Only games played at home may be selected.</p>
        <p style="color:red;">${m}</p>

        <hr />
        <c:set var="empName" value="${emp.FName} ${emp.LName}"></c:set>
        <form name="newPaid" action="Validate" method="POST">
            <input type="hidden" name="type" value ="paid">
            <input type="hidden" name="stage" value ="verify">
            <table>
                <tr>
                    <td>Employee Name: </td>
                    <td><input type="text" name="name" value="${empName}" size="25" readonly="readonly" /><br /></td>
                </tr>
                <tr>
                    <td>Employee Account Number: </td>
                    <td><input type="text" name="acct_num" value="${emp.acctNum}" size="6" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td>Department: </td>
                    <td><input type="text" name="department" value="${emp.depName}" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td>Game: </td>
                    <td><select name="game">
                            <c:if test="${newPaid != null}">
                            <option value="${newPaid.gameNum},${newPaid.game},${newPaid.opponent}" selected="selected">${newPaid.game} | ${newPaid.opponent}</option>
                            </c:if>
                            <c:forEach var="g" items="${games}">
                                <option value="${g.gameNum},${g.gameDay},${g.opponent}"
                                        <c:if test="${g.soldOut == true}"> disabled="disabled"</c:if>>
                                    ${g.gameDay} | ${g.opponent}
                                </option>

                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Number of Seats: </td>
                    <td><input type="text" name="num_seats" value="${empty newPaid.reqSeats ? 1 : newPaid.reqSeats}" size="2" /></td>
                </tr>
                <tr>
                    <td>Section:</td>
                    <td><select name="section">
                            <c:forEach var="s" items="${sections}">
                                <option value="${s.secNum},${s.name},${s.priceReg},${s.pricePrem}">${s.name} | $${s.priceReg} ($${s.pricePrem})</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Card Type:</td>
                    <td><select name="ccType">
                            <c:if test="${newPaid != null}">
                            <option value="${newPaid.cardType}" selected="selected">${newPaid.cardType}</option>
                            </c:if>
                            <option value="American Express">American Express</option>
                            <option value="Discover">Discover</option>
                            <option value="Master Card">Master Card</option>
                            <option value="Visa">Visa</option>
                        </select></td>
                </tr>
                <tr>
                    <td>Card Number: <p style="font-size:10px">No spaces or dashes, numbers only</p> </td>
                    <td><input type="text" name="ccNumber" maxlength="16" size="16"value="${empty newPaid.cardNum ? '' : newPaid.cardNum}" /></td>
                </tr>
                <tr>
                    <td>Card Expiration Date: <p style="font-size:10px">MMYY format, no '/' or '-'</p> </td>
                    <td><input type="text" name="ccExpir" maxlength="4" size="4" value="${empty newPaid.cardExpir ? '' : newPaid.cardExpir}"/></td>
                </tr>
                <tr>
                    <td>Card Security Number: <p style="font-size:10px">Last 3 digits on back of card (4 for AmEx)</p></td>
                    <td><input type="text" name="ccSec" maxlength="4" size="4" value="${empty newPaid.cardSecNum ? '' : newPaid.cardSecNum}" /></td>
                </tr>
                <tr>
                    <td>Recipient: </td>
                    <td><input type="text" name="recipient" value="${empty newPaid.recipient ? empName : newPaid.recipient}" size="25" /><br /></td>
                </tr>
                <tr>
                    <td>If location not available:</td>
                    <td>
                        <input type="radio" name="locna" value="false" <c:if test="${newPaid.locNA == false || newPaid.locNA == null}">checked="checked"</c:if> />Next Best Available <br />
                        <input type="radio" name="locna" value="true" <c:if test="${newPaid.locNA == true}">checked="checked"</c:if> />Cancel Request <br />
                    </td>
                </tr>
                <tr>
                    <td>Ticket Office Instructions:</td>
                    <td>
                        <input type="radio" name="toi" value="false" <c:if test="${newPaid.toi == false || newPaid.toi == null}">checked="checked"</c:if> />Return to me <br />
                        <input type="radio" name="toi" value="true"  <c:if test="${newPaid.toi == true}">checked="checked"</c:if> />Leave at will-call window <br />
                    </td>

                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit Request" name="submit" /></td>

                </tr>
            </table>
        </form>
        <form name="main" action="loadMain">
            <input type="submit" value="Cancel" name="main" />
        </form>
    </body>
</html>
