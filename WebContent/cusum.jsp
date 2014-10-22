<%-- 
    Document   : cusum
    Created on : Aug 4, 2014, 4:59:45 PM
    Author     : VenkataSrinivas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CuSum</title>
    </head>
    <body>
        <form action="CuSumServlet" method="POST">
            Data:<input type="text" name="data"><br>
            Reference mean:<input type="text" name="mean"><br>
            Reference SD:<input type="text" name="sd"><br>
            Delta:<input type="text" name="delta"><br>
            <input type="submit" value="calculate" /></br>
            <center><a href="index.html">Home</a></center>
            </form>
    </body>
</html>
