/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.servlets;

import com.test.beans.Location;
import com.test.dao.LocationDAO;
import com.test.dao.ReservationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bouaddi_ismail
 */
public class DeleteLogement extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        try (PrintWriter out = response.getWriter()){
            String idlocation=request.getParameter("idlocation");
           
            int idloc=Integer.parseInt(idlocation);
            
            Location loc=LocationDAO.getLocation(idloc);
            int y=LocationDAO.deleteLocation(loc);
            
            response.sendRedirect("userpages/userprofile.jsp ");
             
        } catch (Exception e) {
        }
        
    }

    

}
