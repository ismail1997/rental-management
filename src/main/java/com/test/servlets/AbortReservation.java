
package com.test.servlets;

import com.test.beans.Location;
import com.test.beans.Person;
import com.test.dao.LocationDAO;
import com.test.dao.PersonDAO;
import com.test.dao.ReservationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AbortReservation extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()){
            String idlocation=request.getParameter("idlocation");
           
            int idloc=Integer.parseInt(idlocation);
            
            Location loc=LocationDAO.getLocation(idloc);
            
            
            
            ReservationDAO.etatLibreLocation( loc);
            int y=ReservationDAO.DeleteReservation(loc);
            response.sendRedirect("userpages/userprofile.jsp ");
             
        } catch (Exception e) {
        }
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
