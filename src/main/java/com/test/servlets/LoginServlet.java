/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.servlets;

import com.test.beans.Person;
import com.test.connectdatabase.ConnectDataBase;
import com.test.dao.PersonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ismail bouaddi
 */
public class LoginServlet extends HttpServlet {


  
 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String message=null;
            ConnectDataBase db=new ConnectDataBase();
            Person p=new Person();
            Connection conn=null;
            boolean status;
            PrintWriter out = response.getWriter();
            p.setEmail(request.getParameter("email"));
            p.setPassword(request.getParameter("password"));
            
            conn=db.getCon();
            
            
            PreparedStatement ps=conn.prepareStatement(  
                    "select * from person where email=? and password=?");  
            ps.setString(1,p.getEmail() );
            ps.setString(2,p.getPassword()); 
            
            ResultSet rs=ps.executeQuery();
            
            status=rs.next();
            
            ///test if he can login or not
            if(status==false){
                message="Incorrect Informations please check if you are a member";
                HttpSession session=request.getSession();
                session.setMaxInactiveInterval(3);
                session.setAttribute("message",message);
                
                response.sendRedirect("otherpages/Login.jsp");
                
               
            }else{
                
                if(rs.getString("type").equalsIgnoreCase("admin")){
                        
                    HttpSession session =request.getSession();
                    int d=rs.getInt("id");
                    //convert id to string
                    String idstring = Integer.toString(d);
                    session.setAttribute("idstring",idstring);       
                    
                        response.sendRedirect("adminpages/adminpanel.jsp");
                }else{
                    HttpSession session =request.getSession();
                    int id=rs.getInt("id");
                   
                    
                    //convert id to string
                    String idstring = Integer.toString(id);
                    session.setAttribute("idstring",idstring);
                    
                    
                    response.sendRedirect("userpages/userprofile.jsp");
                }
                
            }
            conn.close();
        }catch(IOException | IllegalAccessException | InstantiationException | SQLException e){
        
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
