<%-- 
    Document   : results
    Created on : 16/05/2017, 7:56:48 PM
    Author     : Alexander
--%>
<%@page import="Bookings.Bookings"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="Flights.Flights" import="Users.User"%>
<!DOCTYPE html>
<link rel="stylesheet" href="style.css">
<% String filePath = application.getRealPath("WEB-INF/bookings.xml");%>
<jsp:useBean id="bookingApp" class="Main.MainB" scope="application">
    <jsp:setProperty name="bookingApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results</title>
    </head>
    <body>
        <h1>Flight101</h1>
        <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>Flight  List</title>
        </head>
        <body>
            <%
                Bookings bookings = bookingApp.getBookings(); //load bookings
                User user = (User) session.getAttribute("user"); //load user

                if (user != null) {%> 

            <div id="navbar">
                <ul>
                    <li><a href="index.jsp">Home</a></li>        
                    <li id = "logout"><a href="logout.jsp">Logout (<%= user.getName()%>)</a></li>
                </ul>
            </div>

            <%if (bookings != null) {

                    DOM.Parser.bookingsP.print(filePath, out);//clickable list of flights 
                }
            }
            %>      
            <p>To edit bookings select <a href="adminEdit.jsp">here</a></p>
        </body>
    </html>
</body>
</html>
