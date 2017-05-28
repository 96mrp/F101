
<%@page import="Users.User"%>
<%@page import="Users.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<% String filePath = application.getRealPath("WEB-INF/users.xml");%>
<jsp:useBean id="loginApp" class="Main.MainU" scope="application">
    <jsp:setProperty name="loginApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

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
            <li id = "login"><a href="login.jsp">Login</a></li> 
                 </ul> <% }%>
        </ul>
    </div>
</head>
    <body>

        <%
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            
            Users users = loginApp.getUsers();
            User loggedIn = users.login(name, password);//checks if user has loggged in
            session.setAttribute("user", loggedIn);

            if (loggedIn != null) {%> 

            <p>Welcome back <%= loggedIn.getName()%><a href="index.jsp"> return to main page</a></p>
            
             
            <% if ( session.getAttribute("searched") != null &&  session.getAttribute("searched").equals("Yes")) { %>
                
            <p>View your previous search <a href="result.jsp">here</a>
                 
           <% } %>
            
        <% } else { %>

        <p> Password or username incorrect Click<a href="login.jsp"> here</a> to try again. 
            If issue continues contact support at 0424479116.</p>

        <% }%>
    </body>
</html>