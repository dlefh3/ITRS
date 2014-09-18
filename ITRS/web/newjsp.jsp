<%-- 
    Document   : newjsp
    Created on : Dec 16, 2009, 3:51:51 PM
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
        </head>
        <body>
            <h1><h:outputText value="Hello World!"/></h1>
            <h:form>
                <h1><h:outputText value="List"/></h1>
                <h:dataTable value="#{sectionss}" var="item">
                    <f:facet name="header">
                        <h:outputText value="This is 'dataTable' demo" />
                    </f:facet>

                <h:column>
                    <f:facet name="header">
                        <h:outputText value="gameDay" />
                    </f:facet>
                    <h:outputText value="#{item.name}"></h:outputText>
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:outputText value="opponent" />
                    </f:facet>
                    <h:outputText value="#{item.secNum}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="soldout" />
                    </f:facet>
                    <h:outputText value="#{item.priceReg}"></h:outputText>
                </h:column>
                </h:dataTable>
            </h:form>

        </body>
    </html>
</f:view>
