<%-- 
    Document   : results
    Created on : 16/05/2017, 7:56:48 PM
    Author     : Alexander
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="Flights.Flights" import="Users.User"%>
<!DOCTYPE html>
<link rel="stylesheet" href="style.css">
<% String filePath = application.getRealPath("WEB-INF/flights.xml");%>
<jsp:useBean id="flightApp" class="Main.MainF" scope="application">
    <jsp:setProperty name="flightApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="style.css">
        <title>Flight101</title>

    <div class="header">
        <img src="logo.png" alt =logo"></img>
        <h1>Flight101</h1>
    </div>
    <% User user = (User) session.getAttribute("user"); %> 
    <div id="navbar">
        <ul>
            <li><a href="index.jsp">Home</a></li> 
            <li><a href="bookings.jsp">Bookings</a></li> 
                <%   if (user != null && user.getAdmin().equals("Yes")) { %> 
            <li><a href="admin.jsp">Administration</a></li>    
                <%  }%>
                <% if (user != null) {%> 
            <li id = "logout"><a href="logout.jsp">Logout (<%= user.getName()%>)</a></li>   
                <% } else { %>
            <li><a href="register.jsp">Register</a></li> 
            <li><a href="login.jsp">Login</a></li> 
        </ul> <% }%>
    </ul>
</div>
</head>

<body>

    <% Flights flights = flightApp.getflights();
        if (flights != null) {

            DOM.Parser.flightsP.print(filePath, out);// list of flights // need to edit
        }%>

</body>
</html>
