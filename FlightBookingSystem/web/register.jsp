<%@page import="Users.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="style.css">
        <title>Register</title>

    <div class="header">
        <img src="logo.png" alt =logo"></img>
        <h1>Flight101</h1>
    </div>
        <% User user = (User) session.getAttribute("user"); %> 
    <div id="navbar">
        <ul>
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
        
        <h2>Register</h2>

        <table>

            <form action="registeraction.jsp" method="POST">

                <tr>
                    <td>Full name</td>
                    <td><input type="text" name = "firstName"></td>
                </tr>
                <tr>

                <tr>
                    <td>Email: </td>
                    <td><input type="email" name = "email"></td>
                </tr>
                <tr>
                    <td>DOB: </td>
                    <td><input type="text" name = "DOB" ></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="password" name = "password" ></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="Submit" name="Submit"></td>
                </tr>
            </form>

        </table>

    </body>
</html>