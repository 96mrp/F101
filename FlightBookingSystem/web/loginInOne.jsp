<%@page import="Users.Users"%>
<%@page import="Users.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style.css">
<% String filePath = application.getRealPath("WEB-INF/users.xml");%>
<jsp:useBean id="loginApp" class="Main.MainU" scope="application">
    <jsp:setProperty name="loginApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>       

    <div class="header">
        <img src="logo.png" alt =logo"></img>
        <h1>Flight101</h1>
    </div>

</head>
<body>
    <% User user = (User) session.getAttribute("user"); %> 
    <% if (user != null) {%> 

    <div id="navbar">
        <ul>
            <li><a href="bookings.jsp">Bookings</a></li>         
            <li id = "logout"><a href="logout.jsp">Logout (<%= user.getName()%>)</a></li>
        </ul>
    </div>


    <% } else { %>

    <div id="navbar">
        <ul>
            <li><a href="register.jsp">Register</a></li>
            <li id = "login"><a href="login.jsp">Login</a></li>
        </ul>
    </div>

    <% }%>

    <%

        // Retrieve the value (if any) of the form field called 'submitted'
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        String submitted = request.getParameter("submitted");// submitted variable 

        // If the Java variable 'submitted' is not null AND 'submitted' equals "yes"
        if (submitted != null && submitted == "yes") {

            Users users = loginApp.getUsers();
            User loggedIn = users.login(name, password);//checks if user has loggged in
            session.setAttribute("user", loggedIn);
    %>

    <p>Registered</p>


    <% } else {  %>

    <form action="login.jsp" method="POST">

        <table>
            <tr><td>Full name</td><td><input type="text" name="name"></td></tr>            
            <tr><td>Password</td><td><input type="password" name="password"></td></tr>
            <tr><td><input type="hidden" name="submitted" value="yes"></td></tr>
            <tr><td></td><td><input type="submit" value="Login"></td></tr>
        </table>

    </form>
    <%
        }
    %>

</body>
</html>