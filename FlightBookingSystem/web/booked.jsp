<%@page import="Users.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"import="Bookings.Booking" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- Get booking into the application scope-->
<% String filePath = application.getRealPath("WEB-INF/bookings.xml");%>
<jsp:useBean id="bookingApp" class="Main.MainB" scope="application">
    <jsp:setProperty name="bookingApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="style.css">
        <title>Booked</title>

    </head>
    <body>
        <div class="header">
            <img src="logo.png" alt =logo"></img>
            <h1>Flight101</h1>
        </div>


        <%  String booker = request.getParameter("booker");
            User user = (User) session.getAttribute("user"); %> 
        <% if (user != null) {

                booker = user.getName();//sets the booker as the current user

        %> 

  <div id="navbar">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="bookings.jsp">Bookings</a></li>         
                <li id = "logout"><a href="logout.jsp">Logout (<%= user.getName()%>)</a></li>
            </ul>
        </div>

        <% } else { %>

        <div id="navbar">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="register.jsp">Register</a></li>
                <li id = "login"><a href="login.jsp">Login</a></li>
            </ul>
        </div>
        <% booker = "Unassigned";

            }%>

        <%
            String time = request.getParameter("time");
            String date = request.getParameter("datepicker");
            String name = request.getParameter("name");
            String contact = request.getParameter("contact");
            String email = request.getParameter("email");
            String description = request.getParameter("description");

            if (bookingApp.getBookings() != null) {
                bookingApp.addBooking(new Booking(time, date, name, contact, email, description, booker));
                bookingApp.saveBookings();
        %>

        <p> Booking Successful check <a href="bookings.jsp"> bookings </a></p>
        <%  } else { %>

        <p> Booking failed select <a href="book.jsp"> here </a> to try again. 
            If issue continues contact support at 0424479116.</p>

        <%}%>
    </body>
</html>