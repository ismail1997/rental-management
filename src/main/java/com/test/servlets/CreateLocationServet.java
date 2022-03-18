
package com.test.servlets;

import com.test.beans.Location;
import com.test.connectdatabase.ConnectDataBase;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class CreateLocationServet extends HttpServlet {

    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ///connect to the database 
        ConnectDataBase bdd=new ConnectDataBase();
        Connection conn=null;
        String message=null;
        InputStream inputStream1 = null,inputStream2=null,inputStream3=null,inputStream4=null,inputStream5 = null; // input stream of the upload file
        ///declare the image parts
        Part filePart1 = request.getPart("image1");
        Part filePart2 = request.getPart("image2");
        Part filePart3 = request.getPart("image3");
        Part filePart4 = request.getPart("image4");
        Part filePart5 = request.getPart("image5");
        
        
        
        ///create the instanse of the location class
        Location loc=new Location();
        //get the parametres from the form
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
        
        try {
            conn=bdd.getCon();
            // constructs SQL statement
            String sql = "INSERT INTO location (titre,slogan,regle,description,ville,region,address,image1,image2,image3,image4,image5,prix,type,surface,nbrchambre,nbrsalon,nbrsalledebain,balcon,garage,parking,jardin,grenier) values "
                    + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, loc.getTitre());statement.setString(2, loc.getSlogan());
            statement.setString(3, loc.getRegle());statement.setString(4, loc.getDescription());
            statement.setString(5,loc.getVille());statement.setString(6,loc.getRegion());
            statement.setString(7,loc.getAddress());
            
            if (inputStream1 != null || inputStream2 != null || inputStream3 != null || inputStream4 != null || inputStream5 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(8, inputStream1);
                statement.setBlob(9, inputStream2);
                statement.setBlob(10, inputStream3);
                statement.setBlob(11, inputStream4);
                statement.setBlob(12, inputStream5);
               
            }
            statement.setDouble(13, loc.getPrix());statement.setString(14, loc.getType());
            statement.setDouble(15,loc.getSurface());statement.setInt(16,loc.getNbrchambre());
            statement.setInt(17,loc.getNbrsalon());
            statement.setInt(18,loc.getNbrsalledebain());statement.setString(19,loc.getBalcon());
            statement.setString(20,loc.getGarage());statement.setString(21,loc.getParking());
            statement.setString(22,loc.getJardin());statement.setString(23,loc.getGrenier());
            
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                 message = "File uploaded and saved into database";
            }
        } catch (InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(CreateLocationServet.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
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
