
package com.test.servlets;

import com.test.beans.Location;
import com.test.dao.LocationDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class EditLocationServlet extends HttpServlet {

 

  
    /*0670655838*/
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()){
        ///connect to the database 
        String idstring=request.getParameter("id");
        int id=Integer.parseInt(idstring);
         ///initilize variables
        
        String message=null;
        Part filePart[] =new Part[5];
        filePart[0]=null;
        filePart[1]=null;
        filePart[2]=null;
        filePart[3]=null;
        filePart[4]=null;
        Location loc=new Location();
        ///declare the image parts
         filePart[0] = request.getPart("image1");
         filePart[1] = request.getPart("image2");
         filePart[2] = request.getPart("image3");
         filePart[3]= request.getPart("image4");
         filePart [4]= request.getPart("image5");
         
        
            
        loc.setTitre(request.getParameter("titre"));
        loc.setSlogan(request.getParameter("slogan"));
        loc.setRegle(request.getParameter("regle"));
        loc.setDescription(request.getParameter("description"));
        loc.setPrix(Double.parseDouble(request.getParameter("prix")));
        loc.setType(request.getParameter("type"));
        loc.setSurface(Double.parseDouble(request.getParameter("surface")));
        loc.setNbrchambre(Integer.parseInt(request.getParameter("nbrchambre")));
        loc.setNbrsalon(Integer.parseInt(request.getParameter("nbrsalon")));
        loc.setNbrsalledebain(Integer.parseInt(request.getParameter("nbrsalledebain")));
        loc.setBalcon(request.getParameter("balcon") );
        loc.setGarage(request.getParameter("garage") );
        loc.setGrenier(request.getParameter("grenier") );
        loc.setJardin(request.getParameter("jardin"));
        loc.setParking(request.getParameter("parking"));
        loc.setAddress(request.getParameter("address"));
        loc.setVille(request.getParameter("ville"));
        loc.setRegion(request.getParameter("region"));

             
        
        int x=LocationDAO.update(loc,id,filePart);
        
        //out.println("dd SDSD SDSd "+x);
        response.sendRedirect("adminpages/locations.jsp");
        
        }catch(Exception e ){
            out.println(e);
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
