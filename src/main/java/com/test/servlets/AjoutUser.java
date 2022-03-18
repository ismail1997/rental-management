
package com.test.servlets;

import com.test.beans.Person;
import com.test.dao.PersonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AjoutUser extends HttpServlet {


    
 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try (PrintWriter out = response.getWriter()) {
            Person person=new Person();
            String nom=request.getParameter("nom");
            String prenom=request.getParameter("prenom");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String address=request.getParameter("address");
            String password=request.getParameter("password");
            String password_confirmation=request.getParameter("password_confirmation");
            String birthday=request.getParameter("birthday");
            
           if(!password.equals(password_confirmation) || PersonDAO.verifyPassword(password)==0){
               String message = null;
                if(!password.equals(password_confirmation)){
                    message="invalid_password : password doesn't much the password_confirmation";
                }
                if(PersonDAO.verifyPassword(password)==0){
                    message="invalid_password : please be sure that lenght is higher than 6 caracters";
                }
                HttpSession session=request.getSession();
                session.setMaxInactiveInterval(30);
                session.setAttribute("message",message);
                response.sendRedirect("otherpages/ajouterperson.jsp");
                //getServletContext().getRequestDispatcher("/otherpages/ajouterperson.jsp").forward(request, response);
           }else{
               if(PersonDAO.searchEmail(email)!=null){
                    String message="email existe deja";
                    HttpSession session=request.getSession();
                    session.setMaxInactiveInterval(30);
                    session.setAttribute("message",message);
                    // forwards to the message page
                    response.sendRedirect("otherpages/ajouterperson.jsp");
               }else {
                    if(PersonDAO.searchPhone(phone)!=0 || PersonDAO.verifyPhoneNumber(phone)!=1 ){
                        String message="";
                        HttpSession session=request.getSession();
                        session.setMaxInactiveInterval(30);

                        if(PersonDAO.searchPhone(phone)!=0){
                            message="phone number existe deja";
                             session.setAttribute("message",message); 
                        }
                        if(PersonDAO.verifyPhoneNumber(phone)==0){
                            message="phone number doesn't mush our system";
                            session.setAttribute("message",message);
                        }
                         
                        //request.setAttribute("Message", message);
                        // forwards to the message page
                        response.sendRedirect("otherpages/ajouterperson.jsp "/*?name="+message);*/);
                        
                        
                    }else{
                        person.setNom(nom);person.setPrenom(prenom);person.setEmail(email);
                         person.setPhone(phone);person.setAddress(address);person.setPassword(password);
                         person.setPassword_confirmation(password_confirmation);person.setBirthday(birthday);

                         PersonDAO.save(person);
                         response.sendRedirect("otherpages/Login.jsp ");
                         
               }
                    
               
           }
           }

    }}

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
