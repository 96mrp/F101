<%@page import="Users.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<% String filePath = application.getRealPath("WEB-INF/users.xml");%>
<jsp:useBean id="registerApp" class="Main.MainU" scope="application">
    <jsp:setProperty name="registerApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="style.css">
        <title>Booked</title>

    </head>
    <body>
        <div class="header">
            <img src="elogo.PNG" alt =logo"></img>
            <h1>Flight101</h1>
        </div>


        <% User user = (User) session.getAttribute("user"); %> 
        <% if (user != null) {%> 


        <%}%>

        <%
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String DOB = request.getParameter("DOB");
            String admin = "No";


            if (registerApp.getUsers() != null) {
                registerApp.addUser(new User(fullName, email,password, DOB, admin));
                registerApp.saveUsers();%>

        <p> Welcome to flight101 <a href="index.jsp">return to the main menu</a></p>
            
        
        <%  } else { %>

        <p> You are not registered in the system. Please click <a href="register.jsp"> here </a> to try again. 
            If issue continues contact support at 0424479116.</p>

        <%}%>
    </body>
</html>