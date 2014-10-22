<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
    <head>
        <title>Analysis</title>
    </head>
    <body>

        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/project2"
                           user="root"  password="Jaggi@830"/>

        <sql:query dataSource="${snapshot}" var="result1">
            SELECT distinct age from maindata order by age asc;
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result2">
            SELECT distinct sex from maindata order by sex asc;
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result3">
            SELECT distinct admitting_diagnosis_code from maindata order by admitting_diagnosis_code asc;
        </sql:query>


        <form action="analysis.jsp">
            <table align="center" border="0" color ="blue"  cellpadding="5" cellspacing="1" style="height:15%;width:60%">
                <tbody>
                <th bgcolor="#04B45F">
                    <font color="white"> Please select the below options to proceed </font> 
                </th>

                <tr bgcolor="#81F79F" width="500px">
                    <td bgcolor="#81F79F" width="500px">

                <center>
                    <h3>
                        <font color="green">Age group of patient&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <select name="age_group">
                            <option value="">Select</option>
                            <c:forEach var="row" items="${result1.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                </c:forEach>
                            </c:forEach>
                        </select>
                        </font>
                    </h3>  
                </center>
                </td>
                </tr>
                <tr bgcolor="#81F79F" width="500px">
                    <td bgcolor="#81F79F" width="500px">
                <center>
                    <h3>
                        <font color="green">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sex&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <select name="sex">
                            <option value="">Select</option>
                            <c:forEach var="row" items="${result2.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                </c:forEach>
                            </c:forEach>
                        </select>
                        </font>
                    </h3>  
                </center>
                </td>
                </tr>
                <tr bgcolor="#81F79F" width="500px">
                    <td bgcolor="#81F79F" width="500px">
                <center>
                    <h3>
                        <font color="green">Admitting diagnosis code
                        <select name="diagnosis">
                            <option value="">Select</option>
                            <c:forEach var="row" items="${result3.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                </c:forEach>
                            </c:forEach>
                        </select>
                        </font>
                    </h3>  
                </center>
                </td>
                </tr>
            </table>
            <center><input type="submit" value="Submit" name="SUBMIT" /></center>
            <center><a href="index.html">Home</a></center>
            </br>
            
        </form>
        <% if (request.getParameter("SUBMIT") != null) { %>
        <sql:query dataSource="${snapshot}" var="result4">
            select avg(length_of_stay)as length_of_stay,avg(total_charges) as total_charges,
            (select count(*) from maindata 
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            and   admitting_diagnosis_code   = ? <sql:param value="${param.diagnosis}"/>
            AND discharge_status='a')/(select count(*) from maindata
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            and   admitting_diagnosis_code   = ? <sql:param value="${param.diagnosis}"/>) AS DS
            from maindata
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            and   admitting_diagnosis_code   = ? <sql:param value="${param.diagnosis}"/>
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result5">
            select avg(length_of_stay)as length_of_stay,avg(total_charges) as total_charges,
            (select count(*) from maindata 
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            AND discharge_status='a')/(select count(*) from maindata
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            ) AS DS
            from maindata
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result6">
            select admitting_diagnosis_code,avg(length_of_stay) as length_of_stay
            from maindata
            group by admitting_diagnosis_code
            order by length_of_stay desc limit 10
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result7">
            select admitting_diagnosis_code,avg(total_charges) as total_charges
            from maindata
            group by admitting_diagnosis_code
            order by total_charges desc limit 10
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result8">
            select admitting_diagnosis_code,count(*) as number_of_deaths
            from maindata
            where discharge_status='B'
            group by admitting_diagnosis_code
            order by number_of_deaths desc limit 10
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result9">
            select a.length_of_stay-b.length_of_stay as los,a.total_charges-b.total_charges as tc,a.ds-b.ds as dsr
            from (select avg(length_of_stay)as length_of_stay,avg(total_charges) as total_charges,
            (select count(*) from maindata 
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            and   admitting_diagnosis_code   = ? <sql:param value="${param.diagnosis}"/>
            AND discharge_status='a')/(select count(*) from maindata
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            and   admitting_diagnosis_code   = ? <sql:param value="${param.diagnosis}"/>) AS DS
            from maindata
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            and   admitting_diagnosis_code   = ? <sql:param value="${param.diagnosis}"/>
            ) a,
            (select avg(length_of_stay)as length_of_stay,avg(total_charges) as total_charges,
            (select count(*) from maindata 
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            AND discharge_status='a')/(select count(*) from maindata
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            ) AS DS
            from maindata
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>) b
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result10">
            select abs(1-(a.length_of_stay/b.length_of_stay)) as los,
            abs(1-(a.total_charges/b.total_charges)) as tc,abs(1-(a.ds/b.ds)) as dsr
            from (select avg(length_of_stay)as length_of_stay,avg(total_charges) as total_charges,
            (select count(*) from maindata 
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            and   admitting_diagnosis_code   = ? <sql:param value="${param.diagnosis}"/>
            AND discharge_status='a')/(select count(*) from maindata
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            and   admitting_diagnosis_code   = ? <sql:param value="${param.diagnosis}"/>) AS DS
            from maindata
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            and   admitting_diagnosis_code   = ? <sql:param value="${param.diagnosis}"/>
            ) a,
            (select avg(length_of_stay)as length_of_stay,avg(total_charges) as total_charges,
            (select count(*) from maindata 
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            AND discharge_status='a')/(select count(*) from maindata
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>
            ) AS DS
            from maindata
            where age= ? <sql:param value="${param.age_group}"/>
            and   sex   = ? <sql:param value="${param.sex}"/>) b
        </sql:query>
        <table style="background:lightgreen;margin-right:20px;padding-top:15px;padding-left:20px;padding-right:20px;padding-bottom:20px;font-size:20px;" width="80%" border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th align='center' colspan='5' style='padding-top: 20px;padding-bottom: 20px;'>With admitting diagnosis code</th>
            </tr>
            <tr>
                <th align="center">AVG_LENGTH_OF_STAY</th>
                <th align="center">AVG_TOTAL_CHARGES</th>
                <th align="center">DISCHARGE_STATUS_RATIO</th>
            </tr>
            <c:forEach var="row1" items="${result4.rows}">
                <tr>
                    <td align="center"><c:out value="${row1.length_of_stay}"/></td>
                    <td align="center"><c:out value="${row1.total_charges}"/></td>
                    <td align="center"><c:out value="${row1.DS}"/></td>
                </tr>   
            </c:forEach>          

        </table>
        </br>
        </br>
        <table style="background:lightgreen;margin-right:20px;padding-top:15px;padding-left:20px;padding-right:20px;padding-bottom:20px;font-size:20px;" width="80%" border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th align='center' colspan='5' style='padding-top: 20px;padding-bottom: 20px;'>Without admitting diagnosis code</th>
            </tr>
            <tr>
                <th align="center">AVG_LENGTH_OF_STAY</th>
                <th align="center">AVG_TOTAL_CHARGES</th>
                <th align="center">DISCHARGE_STATUS_RATIO</th>
            </tr>
            <c:forEach var="row" items="${result5.rows}">
                <tr>

                    <td align="center"><c:out value="${row.length_of_stay}"/></td>
                    <td align="center"><c:out value="${row.total_charges}"/></td>
                    <td align="center"><c:out value="${row.DS}"/></td>
                </tr>   
            </c:forEach>          

        </table>
        </br>
        </br>
        <table style="background:lightgreen;display: inline-block;margin-right:10px;padding-top:10px;padding-left:10px;padding-right:10px;padding-bottom:10px;font-size:20px;" width="30%" border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th align='center' colspan='5' style='padding-top: 10px;padding-bottom: 10px;'>Absolute Difference</th>
            </tr>
            <tr>
                <th align="center">Length_of_stay</th>
                <th align="center">Total_charges</th>
                <th align="center">DIscharge_status_ratio</th>
            </tr>
            <c:forEach var="row" items="${result9.rows}">
                <tr>
                    <td align="center"><c:out value="${row.los}"/></td>
                    <td align="center"><c:out value="${row.tc}"/></td>
                    <td align="center"><c:out value="${row.dsr}"/></td>
                </tr>   
            </c:forEach>          

        </table>
        <table style="background:lightgreen;display: inline-block;margin-right:10px;padding-top:10px;padding-left:10px;padding-right:10px;padding-bottom:10px;font-size:20px;" width="30%" border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th align='center' colspan='5' style='padding-top: 10px;padding-bottom: 10px;'>Deviation Ratio</th>
            </tr>
            <tr>
                <th align="center">Length_of_stay</th>
                <th align="center">Total_charges</th>
                <th align="center">DIscharge_status_ratio</th>
            </tr>
            <c:forEach var="row" items="${result10.rows}">
                <tr>
                    <td align="center"><c:out value="${row.los}"/></td>
                    <td align="center"><c:out value="${row.tc}"/></td>
                    <td align="center"><c:out value="${row.dsr}"/></td>
                </tr>   
            </c:forEach>          

        </table>
        </br>
        </br>
        <table style="background:lightgreen;display: inline-block;margin-right:10px;padding-top:10px;padding-left:10px;padding-right:10px;padding-bottom:10px;font-size:20px;" width="30%" border="1" cellpadding="0" cellspacing="0">>
            <tr>
                <th align='center' colspan='5' style='padding-top: 10px;padding-bottom: 10px;'>Diagnosis code for top length of stay</th>
            </tr>
            <tr>
                <th align="center">DIAGNOSIS_CODE</th>
                <th align="center">Average Length of Stay</th>

            </tr>
            <c:forEach var="row" items="${result6.rows}">
                <tr>
                    <td align="center"><c:out value="${row.admitting_diagnosis_code}"/></td>
                    <td align="center"><c:out value="${row.length_of_stay}"/></td>  
                </tr>   
            </c:forEach>          

        </table>
        <table style="background:lightgreen;display: inline-block;margin-right:10px;padding-top:10px;padding-left:10px;padding-right:10px;padding-bottom:10px;font-size:20px;" width="30%" border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th align='center' colspan='5' style='padding-top: 10px;padding-bottom: 10px;'>Most expensive admission diagnosis</th>
            </tr>
            <tr>
                <th align="center">DIAGNOSIS_CODE</th>
                   <th align="center">Average Total Charges</th>
            </tr>
            <c:forEach var="row" items="${result7.rows}">
                <tr>
                    <td align="center"><c:out value="${row.admitting_diagnosis_code}"/></td>
                       <td align="center"><c:out value="${row.total_charges}"/></td>
                </tr>   
            </c:forEach>          

        </table>
        <table style="background:lightgreen;display: inline-block;margin-right:10px;padding-top:10px;padding-left:10px;padding-right:10px;padding-bottom:10px;font-size:20px;" width="30%" border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th align='center' colspan='5' style='padding-top: 10px;padding-bottom: 10px;'>Most death causing admission diagnosis</th>
            </tr>
            <tr>
                <th align="center">DIAGNOSIS_CODE</th>
                <th align="center">NUMBER_OF_DEATHS</th>
            </tr>
            <c:forEach var="row" items="${result8.rows}">
                <tr>
                    <td align="center"><c:out value="${row.admitting_diagnosis_code}"/></td>
                    <td align="center"><c:out value="${row.number_of_deaths}"/></td>
                </tr>   
            </c:forEach>          

        </table>
        <% }%>
    </body>
</html>