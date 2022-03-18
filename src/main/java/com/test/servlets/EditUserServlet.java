
package com.test.servlets;

import com.test.beans.Person;
import com.test.connectdatabase.ConnectDataBase;
import com.test.dao.PersonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditUserServlet extends HttpServlet {



 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()) {
            HttpSession session =request.getSession();
            //String oldEmail =(String)session.getAttribute("email");
            //String oldPhone =(String)session.getAttribute("phone");
            /*---ajouter frequement--*/
            String idstring =(String)session.getAttribute("idstring");
            Integer id=Integer.parseInt(idstring);
            /*-----*/
            String nom=request.getParameter("nom");
            String prenom=request.getParameter("prenom");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String address=request.getParameter("address");
            String birthday=request.getParameter("birthday");
            String password=request.getParameter("password");
            String password_confirmation=request.getParameter("password_confirmation");
            
            ConnectDataBase db=new ConnectDataBase();
            Person p=new Person();
            Connection conn=null;
            boolean status;
            
            
            
            conn=db.getCon();
            
            if(PersonDAO.trimString(nom)==0 ||PersonDAO.trimString(prenom)==0 || PersonDAO.trimString(email)==0 || PersonDAO.trimString(phone)==0 || PersonDAO.trimString(address)==0  /*|| PersonDAO.trimString(password)==0 || PersonDAO.trimString(password_confirmation)==0 */||PersonDAO.trimString(birthday)==0 ){
                        String error="there is empty fields,please fill them";
                        session.setAttribute("error",error);
                        response.sendRedirect("otherpages/editprofile.jsp");
            }else{
                if(!password.equals(password_confirmation) || PersonDAO.verifyPassword(password)==0){
                    String error="invalid password check that password>6 caratcer and muched the confirmed pass";
                    session.setAttribute("error",error);
                    response.sendRedirect("otherpages/editprofile.jsp");
                }else{
                    if(PersonDAO.searchEmailUpdated(email,id)!=null){
                        String error="email existe deja";
                        session.setAttribute("error",error);
                        response.sendRedirect("otherpages/editprofile.jsp");
                        
                    }else{
                        if(PersonDAO.searchPhoneUpdated(phone, id) !=0 || PersonDAO.verifyPhoneNumber(phone)!=1){
                            String error="phone existe deja";
                            session.setAttribute("error",error);
                            response.sendRedirect("otherpages/editprofile.jsp");
                        }else{
                            p.setNom(nom);p.setPrenom(prenom);p.setEmail(email);
                            p.setPhone(phone);p.setAddress(address);p.setPassword(password);
                            p.setPassword_confirmation(password_confirmation);p.setBirthday(birthday);
                            
                            PersonDAO.updatePerson(p, id);
                            response.sendRedirect("userpages/userprofile.jsp");
                            
                        }
                    }
                }
            }
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
