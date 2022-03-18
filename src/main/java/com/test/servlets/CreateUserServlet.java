
package com.test.servlets;

import com.test.beans.Person;
import com.test.connectdatabase.ConnectDataBase;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/createuserservlet")
public class CreateUserServlet extends HttpServlet {

    


    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message=null;
        Person person=new Person();
        
        person.setNom(request.getParameter("nom"));
        person.setPrenom(request.getParameter("prenom"));
        person.setEmail(request.getParameter("email"));
        person.setPhone(request.getParameter("phone"));
        person.setAddress(request.getParameter("address"));
        person.setPassword(request.getParameter("password"));
        person.setPassword_confirmation(request.getParameter("confirmationpassword"));
        String bday = request.getParameter("birthday");
        
        if(!person.getPassword().equals(person.getPassword_confirmation())){
            response.sendRedirect("http://localhost:8080/projects3/otherpages/createuser.jsp");   
        }else{
            ConnectDataBase bdd=new ConnectDataBase();
            Connection conn=null;
            
            try {
                conn=bdd.getCon();
                if(conn==null){out.println("the connection is failed");}
                String sql="insert into person(nom,prenom,email,phone,password,password_confirmation,birthday,address) values"
                        + "(?,?,?,?,?,?,?,?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                
                stmt.setString(1,person.getNom());
                stmt.setString(2,person.getPrenom());
                stmt.setString(3, person.getEmail());
                stmt.setString(4,person.getPhone());
                stmt.setString(5, person.getPassword());
                stmt.setString(6, person.getPassword_confirmation());
                stmt.setString(7,bday);
                stmt.setString(8,person.getAddress());
                
                int row = stmt.executeUpdate();
                if (row > 0) {
                 message = "File uploaded and saved into database";
            }
                
                
            } catch (InstantiationException | IllegalAccessException | SQLException ex) {
                Logger.getLogger(CreateUserServlet.class.getName()).log(Level.SEVERE, null, ex);
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
