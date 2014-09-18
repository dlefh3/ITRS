

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acme Athletics - Ticket Request System</title>
    </head>
    <body>
        <h1>Ticket Request System - Login</h1>
        <h3>${message}</h3>
        <p>Enter your Employee Account Number and password to log in.</p>

        <form id="login_form" action="Login" method="post" >

        <p>Account Number <input type ="text" name="acct_num" value="${emp.acctNum}"></p>
        <p>Password <input type="password" name="pass" ></p>
        <input type="submit" value="Log In">

        </form>
    </body>
</html>
