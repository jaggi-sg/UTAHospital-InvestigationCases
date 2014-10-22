/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java.com.jdbc;

import java.com.data.Datadao;
import java.sql.*;
import java.util.ArrayList;

public class JDBCConnection {

    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/project2";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "";

    public ArrayList<Datadao> getData() {
        Connection conn = null;
        Statement stmt = null;
        ArrayList<Datadao> array = new ArrayList<Datadao>();
        try {

            //STEP 2: Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            //STEP 3: Open a connection
            System.out.println("Connecting to a selected database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected database successfully...");

            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt = conn.createStatement();

            String sql = "SELECT * FROM maindata";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set
            Datadao dt = null;
            while (rs.next()) {
                dt = new Datadao();
                dt.setAge(String.valueOf(rs.getInt(1)).trim());
                dt.setSex(String.valueOf(rs.getInt(2)).trim());
                dt.setRace(String.valueOf(rs.getInt(3)).trim());
                dt.setDay_of_admission(String.valueOf(rs.getInt(4)).trim());
                dt.setDischarge_status(rs.getString(5).trim());
                dt.setStay_indicator(rs.getString(6).trim());
                dt.setDrg_code(String.valueOf(rs.getInt(7)).trim());
                dt.setLength_of_stay(String.valueOf(rs.getInt(8)).trim());
                dt.setDrg_price(String.valueOf(rs.getInt(9)).trim());
                dt.setTotal_charges(String.valueOf(rs.getInt(10)).trim());
                dt.setCovered_charges(String.valueOf(rs.getInt(11)).trim());
                dt.setPoa_diagnosis_indicator_1(rs.getString(12).trim());
                dt.setPoa_diagnosis_indicator_2(rs.getString(13).trim());
                dt.setDiagnosis_code_1(rs.getString(14).trim());
                dt.setDiagnosis_code_2(rs.getString(15).trim());
                dt.setProcedure_code_1(rs.getString(16).trim());
                dt.setProcedure_code_2(rs.getString(17).trim());
                dt.setDischarge_destination(String.valueOf(rs.getInt(18)).trim());
                dt.setSource_of_admission(rs.getString(19).trim());
                dt.setType_of_admission(String.valueOf(rs.getInt(20)).trim());
                dt.setAdmitting_diagnosis_code(String.valueOf(rs.getString(21)).trim());
                
                array.add(dt);
            }
            rs.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    conn.close();
                }
            } catch (SQLException se) {
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        return array;
    }

}
