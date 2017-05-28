<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"import="Users.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <table>

            <form action="results.jsp" method="POST">

                <tr>
                    <td>Departure:</td>
                    <td><input type="date" name="departureDate"></td>
                </tr>
                <tr>
                    <td>Return: </td>
                    <td><input type="date" name="departureDate"></td>
                </tr>
                <tr>
                    <td>Origin: </td>
                    <td><input list="origin" name = "origin" ></td>
                <datalist id="origin">
                    <option value="Adelaide">
                    <option value="Brisbane">
                    <option value="Cairns">
                    <option value="Darwin">
                    <option value="Gold Coast">
                    <option value="Melbourne">
                    <option value="Perth">
                    <option value="Sydney">
                </datalist></td>
                </tr>
                <tr>
                    <td>Destination: </td>
                    <td><input list="destination" name = "destination" ></td>
                <datalist id="destination">
                    <option value="Adelaide">
                    <option value="Brisbane">
                    <option value="Cairns">
                    <option value="Darwin">
                    <option value="Gold Coast">
                    <option value="Melbourne">
                    <option value="Perth">
                    <option value="Sydney">
                </datalist></td>
                </tr>
                <tr>
                    <td>Type: </td>
                    <td>  <input type="radio" name="type" value="Economy">Economy<br>
                        <input type="radio" name="type" value="Business">Business<br>
                    </td>
                </tr>
                <tr>
                    <td></td>
                <tr><td><input type="hidden" name="searched" value="yes"></td></tr>
                <td><input type="Submit" name="Search"></td>
                </tr>
            </form>

        </table>    
</body>

</html>