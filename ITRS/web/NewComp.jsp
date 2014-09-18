<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITRS - New Complimentary Ticket Request</title>
    </head>
    <body>
        <h1>Complimentary Ticket Request Form</h1>
        <p>Please fill out this form to submit a request for complimentary tickets. </p>
        <p>Only home games played at home may be selected</p>
        <p style="color:red;">${m}</p>
       
        <hr />
        <c:set var="empName" value="${empName}"></c:set>
        <form name="newComp" action="Validate" method="POST">
            <input type="hidden" name="type" value ="comp">
            
            <table>
                <tr>
                    <td>Employee Name: </td>
                    <td><input type="text" name="name" value="${emp.FName} ${emp.LName}" size="25" readonly="readonly" /><br /></td>
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
                            <c:if test="${newComp != null}">
                            <option value="${newComp.gameNum},${newComp.game},${newComp.opponent}" selected="selected">${newComp.game} | ${newComp.opponent}</option>
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
                    <td><input type="text" name="num_seats" value="${empty newComp.reqSeats ? 1 : newComp.reqSeats}" size="2" /></td>
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
                    <td>Recipient:</td>
                    <td><input type="text" name="recipient" value="${empty newComp.recipient ? '' : newComp.recipient}" size="25" /></td>
                </tr>
                <tr>
                    <td>Business Purpose: </td>
                    <td><textarea name="purpose" rows="4" cols="20">${newComp.purpose}</textarea></td>
                </tr>
                <tr>
                    <td>If location not available:</td>
                    <td>
                        <input type="radio" name="locna" value="false" <c:if test="${newComp.locNA == false || newComp.locNA == null}">checked="checked"</c:if> />Next Best Available <br />
                        <input type="radio" name="locna" value="true" <c:if test="${newComp.locNA == true}">checked="checked"</c:if> />Cancel Request <br />
                    </td>
                </tr>
                <tr>
                    <td>Ticket Office Instructions:</td>
                    <td>
                        <input type="radio" name="toi" value="false" <c:if test="${newComp.toi == false || newComp.toi == null}">checked="checked"</c:if> />Return to me <br />
                        <input type="radio" name="toi" value="true"  <c:if test="${newComp.toi == true}">checked="checked"</c:if> />Leave at will-call window <br />
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
