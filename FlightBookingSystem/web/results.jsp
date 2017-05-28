<%-- 
    Document   : results
    Created on : 16/05/2017, 7:56:48 PM
    Author     : Alexander
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="Flights.Flights" import="Listings.Listings"import="Users.User"%>
<!DOCTYPE html>
<link rel="stylesheet" href="style.css">
<% String loadFilePath = application.getRealPath("WEB-INF/flights.xml");%>
<jsp:useBean id="flightApp" class="Main.MainF" scope="application">
    <jsp:setProperty name="flightApp" property="filePath" value="<%=loadFilePath%>"/>
</jsp:useBean>

<% String saveFilePath = application.getRealPath("WEB-INF/listings.xml");%>
<jsp:useBean id="listingApp" class="Main.MainL" scope="application">
    <jsp:setProperty name="listingApp" property="filePath" value="<%=saveFilePath%>"/>
</jsp:useBean>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results</title>
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
            <li><a href="logout.jsp">Logout (<%= user.getName()%>)</a></li>   
                <% } else { %>
            <li><a href="register.jsp">Register</a></li> 
            <li><a href="login.jsp">Login</a></li> 
        </ul> <% }%>
    </ul>
</div>  
</head>
<body>
    <%
        String searched = request.getParameter("searched");
        session.setAttribute("searched", searched); //user has searched

        String departureDate = request.getParameter("departureDate");
        String arrivalDate = request.getParameter("arrivalDate");
        String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        String type = request.getParameter("type");

        Flights flights = flightApp.getflights();// get flights and compare to lisiting, feed listing into DOM parser
        Listings listings = listingApp.getListings();

        if (user != null) {

            if (listings != null) {

                DOM.Parser.listingP.print(saveFilePath, out);//clickable list of flights 
            }

        } else if (listings != null) {

            DOM.Parser.listingP.print(saveFilePath, out);// list of flightsd 
        }
    %>
</body>
</html>
