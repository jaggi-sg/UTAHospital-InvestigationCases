<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
    <head>
        <title>Association</title>
    </head>
    <body>

        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/project1"
                           user="root"  password="Jaggi@830"/>

        <form action="WebServlet" method="POST">
            <input type="checkbox" name="abc" value="age"/> Age </br>
            <input type="checkbox" name="abc"  value="sex"/> Sex </br>
            <input type="checkbox" name="abc"  value="race"/> Race </br>
            <input type="checkbox" name="abc" value="discharge_status"/> Discharge_status </br>
            <input type="checkbox" name="abc"  value="stay_indicator"/> Stay_indicator </br>
            <input type="checkbox" name="abc"  value="drg_code"/> DRG_code </br>
            <input type="checkbox" name="abc" value="length_of_stay"/> Length_of_stay </br>
            <input type="checkbox" name="abc"  value="drg_price"/> DRG_price </br>
            <input type="checkbox" name="abc"  value="total_charges"/> Total_charges </br>
            <input type="checkbox" name="abc" value="covered_charges"/> Covered_charges </br>
            <input type="checkbox" name="abc"  value="poa_diagnosis_indicator_1"/> POA_diagnosis_indicator_1 </br>
            <input type="checkbox" name="abc"  value="poa_diagnosis_indicator_2"/> POA_diagnosis_indicator_2 </br>
            <input type="checkbox" name="abc"  value="diagnosis_code_1"/> diagnosis_code_1 </br>
            <input type="checkbox" name="abc"  value="diagnosis_code_2"/> diagnosis_code_2 </br>
            <input type="checkbox" name="abc"  value="procedure_code_1"/> procedure_code_1 </br>
            <input type="checkbox" name="abc"  value="procedure_code_2"/> procedure_code_2 </br>
            <input type="checkbox" name="abc"  value="discharge_destination"/> discharge_destination </br>
            <input type="checkbox" name="abc"  value="source_of_admission"/> source_of_admission </br>
            <input type="checkbox" name="abc"  value="type_of_admission"/> type_of_admission </br>
            <input type="checkbox" name="abc"  value="admitting_diagnosis_code"/> admitting_diagnosis_code </br>
            Minimum Support:<input type="text" name="mins"><br>
            Minimum Confidence:<input type="text" name="minc"><br>
            <input type="submit" value="Select" /></br>
            <center><a href="index.html">Home</a></center>
        </form>
    </body>
</html>