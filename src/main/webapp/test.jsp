<%@ page import="java.sql.*"  import="java.lang.*"%>


<%--
  Created by IntelliJ IDEA.
  User: ali
  Date: 11/23/22
  Time: 10:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    try {
        String Driver="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://127.0.0.1:3306/J2EE";
        String nameDB="root";
        String pass="50211159Ali";
        Class.forName(Driver);
        Connection conx= DriverManager.getConnection(url,nameDB,pass);
        out.println("DataBase connected !!!!");
    } catch (Exception e) {
        out.println(e);
    }
%>


<br>

</body>
</html>
