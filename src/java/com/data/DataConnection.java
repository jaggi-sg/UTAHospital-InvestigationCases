/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java.com.data;

import java.mining.Mining;
import java.com.jdbc.JDBCConnection;
import java.helper.DataHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DataConnection {

    ArrayList<Datadao> array = new ArrayList<Datadao>();

    public void dataConnect(String arr[], PrintWriter out,double minSupport,double minConfidence) {
        try {
            JDBCConnection jdbc = new JDBCConnection();
            array = jdbc.getData();
            ArrayList<ArrayList<String>> columnData = new ArrayList<ArrayList<String>>();
            for (String st : arr) {
                columnData.add(dataCollection(st));
            }
            
            //Double minSupport = 0.1;
            //Double minConfidence = 0.1;
            DataHelper.init(minSupport, minConfidence);
            Mining aprioriHelper = new Mining();
            
            aprioriHelper.doMining(minSupport, minConfidence, columnData, out);
        } catch (IOException ex) {
            Logger.getLogger(DataConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<String> dataCollection(String columnName) {
        ArrayList<String> data = new ArrayList<String>();
        switch (columnName) {
            case "age":
                for (Datadao dt : array) {
                    data.add(dt.getAge());
                }
                break;
            case "sex":
                for (Datadao dt : array) {
                    data.add(dt.getSex());
                }
                break;
            case "race":
                for (Datadao dt : array) {
                    data.add(dt.getRace());
                }
                break;
            case "day_of_admission":
                for (Datadao dt : array) {
                    data.add(dt.getDay_of_admission());
                }
                break;
            case "drg_code":
                for (Datadao dt : array) {
                    data.add(dt.getDrg_code());
                }
                break;
            case "length_of_stay":
                for (Datadao dt : array) {
                    data.add(dt.getLength_of_stay());
                }
                break;
            case "drg_price":
                for (Datadao dt : array) {
                    data.add(dt.getDrg_price());
                }
                break;
            case "total_charges":
                for (Datadao dt : array) {
                    data.add(dt.getTotal_charges());
                }
                break;
            case "covered_charges":
                for (Datadao dt : array) {
                    data.add(dt.getCovered_charges());
                }
                break;
            case "discharge_destination":
                for (Datadao dt : array) {
                    data.add(dt.getDischarge_destination());
                }
                break;
            case "type_of_admission":
                for (Datadao dt : array) {
                    data.add(dt.getType_of_admission());
                }
                break;
            case "admitting_diagnosis_code":
                for (Datadao dt : array) {
                    data.add(dt.getAdmitting_diagnosis_code());
                }
                break;
            case "discharge_status":
                for (Datadao dt : array) {
                    data.add(dt.getDischarge_status());
                }
                break;
            case "stay_indicator":
                for (Datadao dt : array) {
                    data.add(dt.getStay_indicator());
                }
                break;
            case "poa_diagnosis_indicator_1":
                for (Datadao dt : array) {
                    data.add(dt.getPoa_diagnosis_indicator_1());
                }
                break;
            case "poa_diagnosis_indicator_2":
                for (Datadao dt : array) {
                    data.add(dt.getPoa_diagnosis_indicator_2());
                }
                break;
            case "diagnosis_code_1":
                for (Datadao dt : array) {
                    data.add(dt.getDiagnosis_code_1());
                }
                break;
            case "diagnosis_code_2":
                for (Datadao dt : array) {
                    data.add(dt.getDiagnosis_code_2());
                }
                break;
            case "procedure_code_1":
                for (Datadao dt : array) {
                    data.add(dt.getProcedure_code_1());
                }
                break;
            case "procedure_code_2":
                for (Datadao dt : array) {
                    data.add(dt.getProcedure_code_2());
                }
                break;
            case "source_of_admission":
                for (Datadao dt : array) {
                    data.add(dt.getSource_of_admission());
                }
                break;
        }
        return data;
    }

}
