<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>adminEdit</title>
    </head>
    <body>

        <%
            //if hidden value 1= null then enter
                    
            
            if (request.getParameter("") != null) {
                String bookingId = request.getParameter("BookingId");
                String flightId = request.getParameter("flightId");
                String name = request.getParameter("name");      
                //booking.setName(name);
              
        %>
        <p>Details updated.</p>
        <%
            }
        %>

        <h1>Bookings</h1>

        <form action="edit_user.jsp" method="POST">

            <table> //display this table through a parser
                <tr><td>Booking ID</td><td><%= //booking.BookingId()%></td></tr>
                //hidden value to be,
                <tr><td></td><td><input type="submit" value="Save"></td></tr>
            </table>

            <p>Return to the <a href="main.jsp">main page</a>.</p>

        </form>

    </body>
</html>