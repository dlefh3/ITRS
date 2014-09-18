<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITRS - Main Screen (TEMP)</title>
    </head>
    <body>
        ${m}
        <h1>Welcome to the Acme Athletics' Ticket Request System</h1>
        <p>This system is still under development. Currently the the admin functions
            are the only section built.</p>
        <p>To utilize the admin screens you must be an approved admin user.</p>
       
        <c:if test="${emp.admin}">
            <form name="admin" action="Admin.jsp">
                <input type="submit" value="Admin Screen" name="admin" />
            </form>
        </c:if>
        <c:if test="${emp.TP}">
            <form name="tp" action="PurchaseMain">
                <input type="submit" value="Ticket Purchaser Screen" name="tp" />
            </form>
        </c:if>
        <c:if test="${emp.vpoa}">
            <form name="main" action="ApprovalMain">
                <input type="submit" value="Request Approval Screen" name="main" />
            </form>
        </c:if>
        <form name="main" action="NewComp.jsp">
            <input type="submit" value="Make New Comp Request" name="main" />
        </form>
        <form name="main" action="NewPaid.jsp">
            <input type="submit" value="Make New Paid Request" name="main" />
        </form><br />
        <form name="out" action="LogOut">
            <input type="submit" value="Log Out" name="logout" />
        </form>


        <hr />

        <table border="0" width="100%" style="border-style: none;">
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
                </td>
                <td VALIGN="top">
                   <table border="1" width="100%">
                    <tr>
                        <th>Request Number</th>
                        <th>Requestor Name</th>
                        <th>Game Date</th>
                        <th>Department</th>
                        <th>Status</th>
                    </tr>
                    <c:forEach var="p" items="${paid}">
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
                    </c:forEach>
                    </table>
                </td>
            </tr>
        </table>
        <br /><br /><br/>
    </body>
</html>
