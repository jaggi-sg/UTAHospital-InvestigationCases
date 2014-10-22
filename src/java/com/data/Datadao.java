/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java.com.data;

public class Datadao {

    String age, sex, race, day_of_admission, drg_code, length_of_stay, drg_price, total_charges, covered_charges, discharge_destination, type_of_admission, admitting_diagnosis_code;
    String discharge_status, stay_indicator, poa_diagnosis_indicator_1, poa_diagnosis_indicator_2, diagnosis_code_1, diagnosis_code_2, procedure_code_1, procedure_code_2, source_of_admission;

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        if (!age.equals("")) {
            this.age = "Age " + age;
        }else{
            this.age = "";
        }
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        if (!sex.equals("")) {
            this.sex = "Sex " + sex;
        }else{
            this.sex = "";
        }
    }

    public String getRace() {
        return race;
    }

    public void setRace(String race) {
        if (!race.equals("")) {
            this.race = "Race " + race;
        }else{
            this.race = "";
        }
    }

    public String getDay_of_admission() {
        return day_of_admission;
    }

    public void setDay_of_admission(String day_of_admission) {
        if (!day_of_admission.equals("")) {
            this.day_of_admission = "Day of Admission " + day_of_admission;
        }else{
            this.day_of_admission = "";
        }
    }

    public String getDrg_code() {
        return drg_code;
    }

    public void setDrg_code(String drg_code) {
        if (!drg_code.equals("")) {
            this.drg_code = "Drug Code " + drg_code;
        }else{
            this.drg_code = "";
        }
    }

    public String getLength_of_stay() {
        return length_of_stay;
    }

    public void setLength_of_stay(String length_of_stay) {
        if (!length_of_stay.equals("")) {
            this.length_of_stay = "Length of Stay " + length_of_stay;
        }else{
            this.length_of_stay = "";
        }
    }

    public String getDrg_price() {
        return drg_price;
    }

    public void setDrg_price(String drg_price) {
        if (!drg_price.equals("")) {
            this.drg_price = "Drug Price " + drg_price;
        }else{
            this.drg_price = "";
        }
    }

    public String getTotal_charges() {
        return total_charges;
    }

    public void setTotal_charges(String total_charges) {
        if (!total_charges.equals("")) {
            this.total_charges = "Total Charges " + total_charges;
        }else{
            this.total_charges = "";
        }
    }

    public String getCovered_charges() {
        return covered_charges;
    }

    public void setCovered_charges(String covered_charges) {
        if (!covered_charges.equals("")) {
            this.covered_charges = "Covered Charges " + covered_charges;
        }else{
            this.covered_charges = "";
        }
    }

    public String getDischarge_destination() {
        return discharge_destination;
    }

    public void setDischarge_destination(String discharge_destination) {
        if (!discharge_destination.equals("")) {
            this.discharge_destination = "Discharge Destination " + discharge_destination;
        }else{
            this.discharge_destination = "";
        }
    }

    public String getType_of_admission() {
        return type_of_admission;
    }

    public void setType_of_admission(String type_of_admission) {
        if (!type_of_admission.equals("")) {
            this.type_of_admission = "Type of Admission " + type_of_admission;
        }else{
            this.type_of_admission = "";
        }
    }

    public String getAdmitting_diagnosis_code() {
        return admitting_diagnosis_code;
    }

    public void setAdmitting_diagnosis_code(String admitting_diagnosis_code) {
        if (!admitting_diagnosis_code.equals("")) {
            this.admitting_diagnosis_code = "Admitting Diagnosis Code " + admitting_diagnosis_code;
        }else{
            this.admitting_diagnosis_code = "";
        }
    }

    public String getDischarge_status() {
        return discharge_status;
    }

    public void setDischarge_status(String discharge_status) {
        if (!discharge_status.equals("")) {
            this.discharge_status = "Discharge Status " + discharge_status;
        }
        else{
            this.discharge_status = "";
        }
    }

    public String getStay_indicator() {
        return stay_indicator;
    }

    public void setStay_indicator(String stay_indicator) {
        if (!stay_indicator.equals("")) {
            this.stay_indicator = "Stay Indicator " + stay_indicator;
        }else{
            this.stay_indicator = "";
        }
    }

    public String getPoa_diagnosis_indicator_1() {
        return poa_diagnosis_indicator_1;
    }

    public void setPoa_diagnosis_indicator_1(String poa_diagnosis_indicator_1) {
        if (!poa_diagnosis_indicator_1.equals("")) {
            this.poa_diagnosis_indicator_1 = "Poa Diagnosis Indicator 1 " + poa_diagnosis_indicator_1;
        }else{
            this.poa_diagnosis_indicator_1 = "";
        }
    }

    public String getPoa_diagnosis_indicator_2() {
        return poa_diagnosis_indicator_2;
    }

    public void setPoa_diagnosis_indicator_2(String poa_diagnosis_indicator_2) {
        if (!poa_diagnosis_indicator_2.equals("")) {
            this.poa_diagnosis_indicator_2 = "Poa Diagnosis Indicator 2 " + poa_diagnosis_indicator_2;
        }else{
            this.poa_diagnosis_indicator_2 = "";
        }
    }

    public String getDiagnosis_code_1() {
        return diagnosis_code_1;
    }

    public void setDiagnosis_code_1(String diagnosis_code_1) {
        if (!diagnosis_code_1.equals("")) {
            this.diagnosis_code_1 = "Diagnosis Code 1 " + diagnosis_code_1;
        }else{
            this.diagnosis_code_1 = "";
        }
    }

    public String getDiagnosis_code_2() {
        return diagnosis_code_2;
    }

    public void setDiagnosis_code_2(String diagnosis_code_2) {
        if (!diagnosis_code_2.equals("")) {
            this.diagnosis_code_2 = "Diagnosis Code 2 " + diagnosis_code_2;
        }else{
            this.diagnosis_code_2 = "";
        }
    }

    public String getProcedure_code_1() {
        return procedure_code_1;
    }

    public void setProcedure_code_1(String procedure_code_1) {
        if (!procedure_code_1.equals("")) {
            this.procedure_code_1 = "Procedure Code 1 " + procedure_code_1;
        }else{
            this.procedure_code_1 = "";
        }
    }

    public String getProcedure_code_2() {
        return procedure_code_2;
    }

    public void setProcedure_code_2(String procedure_code_2) {
        if (!procedure_code_2.equals("")) {
            this.procedure_code_2 = "Procedure Code 2 " + procedure_code_2;
        }else{
            this.procedure_code_2 = "";
        }
    }

    public String getSource_of_admission() {
        return source_of_admission;
    }

    public void setSource_of_admission(String source_of_admission) {
        if (!source_of_admission.equals("")) {
            this.source_of_admission = "Source f Admission " + source_of_admission;
        }else{
            this.source_of_admission = "";
        }
    }

}
