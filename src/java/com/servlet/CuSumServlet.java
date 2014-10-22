/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CuSumServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 696576671243828983L;

	/**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String dt = request.getParameter("data");
        String arr[] = dt.split(",");
        ArrayList<Double> a1 = new ArrayList<Double>();
        for (String st : arr) {
            a1.add(Double.parseDouble(st.trim()));
        }
        String mn = request.getParameter("mean");
        double mean = Double.parseDouble(mn.trim());
        String stdev = request.getParameter("sd");
        double sd = Double.parseDouble(stdev.trim());
        ArrayList<Double> meanCol3 =  new ArrayList<Double>();
        for(Double val : a1){
            meanCol3.add(val - mean);
        }
        ArrayList<Double> meanCol4 =  new ArrayList<Double>();
        meanCol4.add(meanCol3.get(0));
        double temp=0;
        for(int i=0;i<meanCol3.size();i++){
            if(i==0)
                temp = meanCol3.get(i);
            else{
                temp = temp+meanCol3.get(i);
                meanCol4.add(temp);
            }
        }
        String condSt = request.getParameter("delta");
        double cond = Double.parseDouble(condSt);
        cond = cond*sd;
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CuSumServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<P ALIGN='center'><TABLE BORDER=1>");
            out.println("<TR>");
            for (int i = 0; i < getColumnName().size(); i++) {
                out.println("<TH>" + getColumnName().get(i) + "</TH>");
            }
            out.println("</TR>");
            
            for (int j = 0; j < a1.size(); j++) {
                out.println("<TR>");
                out.println("<TD>" +(j+1)+"</TD>");
                out.println("<TD>"+a1.get(j)+"</TD>");
                
                out.println("<TD>"+meanCol3.get(j)+"</TD>");
                
                if(meanCol4.get(j)>cond||meanCol4.get(j)<-cond){
                    out.println("<TD bgcolor=\"#FF0000\">"+meanCol4.get(j)+"</TD>");
                }else{
                    out.println("<TD>"+meanCol4.get(j)+"</TD>");
                }
                out.println("</TR>");
            }
            
            out.println("</TABLE></P>");
            out.println("</br><a href=\"cusum.jsp\">Go Back</a></br>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private ArrayList<String> getColumnName() {
        ArrayList<String> arrayHeader = new ArrayList<String>();
        arrayHeader.add("No.");
        arrayHeader.add("Given Numbers");
        arrayHeader.add("Deviation from mean");
        arrayHeader.add("cusum");
        return arrayHeader;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
