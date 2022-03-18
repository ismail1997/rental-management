
package com.test.dao;

import com.test.beans.Person;
import com.test.connectdatabase.ConnectDataBase;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) 
public class PersonDAO {
    
    public static Person get(int id) throws SQLException, IOException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        Person person = null;
         
        String sql = "SELECT * FROM person WHERE id = ?";
         
        try {
             Class.forName("com.mysql.cj.jdbc.Driver");
            Connection    connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/javaee?serverTimezone=UTC","root","root");
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
             
            if (result.next()) {
                person = new Person();
                int idperson=result.getInt("id");
                String nom = result.getString("nom");
                String prenom = result.getString("prenom");
                Blob blob = result.getBlob("image");
                String email=result.getString("email");
                String Phone =result.getString("phone");
                String address=result.getString("address");
                String birthday =result.getString("birthday");                
                String passworsd=result.getString("password");
                String password_confirmation=result.getString("password_confirmation");
                
                 String base64Image=null;
                if(blob==null){
                    base64Image="dz";
                } else {
                    InputStream inputStream = blob.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;

                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);                  
                    }

                    byte[] imageBytes = outputStream.toByteArray();
                    base64Image = Base64.getEncoder().encodeToString(imageBytes);
                    
                    
                    inputStream.close();
                    outputStream.close();
                 }
                person.setId(idperson);
                person.setPrenom(prenom);
                person.setNom(nom);
                person.setBase64Image(base64Image);
                person.setAddress(address);
                person.setEmail(email);
                person.setPhone(Phone);
                person.setBirthday(birthday);
                person.setPassword(passworsd);
                person.setPassword_confirmation(password_confirmation);
            }          
             
        } catch (SQLException | IOException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         
        return person;
    }
    
    
    ////insert person into data base
    public static int save(Person person){
        ConnectDataBase db=new ConnectDataBase();
        int status=0;Connection conn = null;
        try{
            conn=db.getCon();
            String sql="insert into person(nom,prenom,email,phone,password,password_confirmation,birthday,address) values"
                        + "(?,?,?,?,?,?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
                
                stmt.setString(1,person.getNom());
                stmt.setString(2,person.getPrenom());
                stmt.setString(3, person.getEmail());
                stmt.setString(4,person.getPhone());
                stmt.setString(5, person.getPassword());
                stmt.setString(6, person.getPassword_confirmation());
                stmt.setString(7,person.getBirthday());
                stmt.setString(8,person.getAddress());
            
            status=stmt.executeUpdate();
            conn.close();
        }catch(Exception e){System.out.println(e);}
            
        return status;
    }
    
    ///udate person from database 
    public static int updatePerson(Person person,int d){
        ConnectDataBase db=new ConnectDataBase();
        int status=0;Connection conn = null;
        try{
            conn=db.getCon();
            String sql="update   person set nom=?,prenom=?,email=?,phone=?,password=?,password_confirmation=?,birthday=?,address=? where id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
                
                stmt.setString(1,person.getNom());
                stmt.setString(2,person.getPrenom());
                stmt.setString(3, person.getEmail());
                stmt.setString(4,person.getPhone());
                stmt.setString(5, person.getPassword());
                stmt.setString(6, person.getPassword_confirmation());
                stmt.setString(7,person.getBirthday());
                stmt.setString(8,person.getAddress());
                stmt.setInt(9, d);
            
            status=stmt.executeUpdate();
            conn.close();
        }catch(IllegalAccessException | InstantiationException | SQLException e){System.out.println(e);}
            
        return status;
    
    }
        ///udate person from database  with image
    public static int updatePerson(Person person,int d,InputStream inputStream ){
        ConnectDataBase db=new ConnectDataBase();
        int status=0;Connection conn =null;
        try{
            conn=db.getCon();
            String sql="update   person set nom=?,prenom=?,email=?,phone=?,password=?,password_confirmation=?,birthday=?,address=?,image=? where id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
                
                
                
                stmt.setString(1,person.getNom());
                stmt.setString(2,person.getPrenom());
                stmt.setString(3, person.getEmail());
                stmt.setString(4,person.getPhone());
                stmt.setString(5, person.getPassword());
                stmt.setString(6, person.getPassword_confirmation());
                stmt.setString(7,person.getBirthday());
                stmt.setString(8,person.getAddress());
                stmt.setBlob(9, inputStream);
                stmt.setInt(10, d);
            
            status=stmt.executeUpdate();
            conn.close();
        }catch(Exception e){System.out.println(e);}
            
        return status;
    
    }
    
    public static int searchPhone(String phone){
        int d=0;
        ConnectDataBase db=new ConnectDataBase();
        Connection con=null;
        try{
            con=db.getCon();
            String sql="select * from person where phone=?";
            PreparedStatement stm =con.prepareStatement(sql);
            stm.setString(1, phone);
            ResultSet result = stm.executeQuery();
             
            if (result.next()) {
                d=1;
                return d;
            }
            
            stm.close();
            con.close();
        }catch(Exception ex){
        }
    
    return d;
    }
    //verefier l'unification de email lors de saisie
    public static String searchEmail(String email){
        
        ConnectDataBase db=new ConnectDataBase();
        Connection con=null;
        String nom = null;
        try{
            con=db.getCon();
            
            String sql="select * from person where email=?";
            
            PreparedStatement stm =con.prepareStatement(sql);
            stm.setString(1, email);
            
           ResultSet result = stm.executeQuery();
             
            if (result.next()) {
                
                nom = result.getString("nom");
                return nom;
            }
            stm.close();
            con.close();
            
            
        }catch(Exception ex){
        }
        return nom;
    
    
    }  
    public static int verifyPhoneNumber(String number){
        int d=0;
        String  regex = "[0-9]+";
        if(number.matches(regex)==false){
            return 0;
        }else{
            if(number.startsWith("06") || number.startsWith("07") || number.startsWith("05")){
                if(number.length()<=10){
                    return 1;
                }else{
                    return 0;
                }
            }else{
                return 0;
            }
        }
    }
    public static int verifyPassword(String password){
        if(password.length()<=6){
            return 0;
        }else{
            return 1;
        }
    }
   
 /// get info person
   public Person getPerson(int id) throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        
        Person person = null;
         
        ConnectDataBase db=new ConnectDataBase();
        Connection con=null;
        
        String sql = "SELECT * FROM person WHERE id = ?";
         
        try {
             
            con=db.getCon();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
             
            if (result.next()) {
                person = new Person();
                String nom = result.getString("nom");
                String prenom = result.getString("prenom");
                Blob blob = result.getBlob("image");
                String email=result.getString("email");
                String Phone =result.getString("phone");
                String address=result.getString("address");
                String birthday =result.getString("birthday");                
                String passworsd=result.getString("password");
                String password_confirmation=result.getString("password_confirmation");
                 
            
                 
                 
              
                person.setPrenom(prenom);
                person.setNom(nom);
                
                person.setAddress(address);
                person.setEmail(email);
                person.setPhone(Phone);
                person.setBirthday(birthday);
                person.setPassword(passworsd);
                person.setPassword_confirmation(password_confirmation);
            }          
             
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         
        return person;
    } 

   public static int trimString(String string){
        if(string ==null) return 0;
        if(string.trim().length()==0 ) {
               return 0;
        }else{
              return 1;
        }
   }
   
   
   ///search for the newest  email if exist or not
   public static String searchEmailUpdated(String email,int id){
        
        ConnectDataBase db=new ConnectDataBase();
        Connection con=null;
        String nom = null;
        try{
            con=db.getCon();
            
            String sql="select * from person where email=? and id != ?";
            
            PreparedStatement stm =con.prepareStatement(sql);
            stm.setString(1, email);
            stm.setInt(2, id);
            
           ResultSet result = stm.executeQuery();
             
            if (result.next()) {
                
                nom = result.getString("nom");
                return nom;
            }
            stm.close();
            con.close();
            
            
        }catch(Exception ex){
        }
        return nom;
    
    
    } 
   ////verifier si le phone inserer est new est n'est pas dans la base
   public static int searchPhoneUpdated(String phone,int id){
        int d=0;
        ConnectDataBase db=new ConnectDataBase();
        Connection con=null;
        try{
            con=db.getCon();
            String sql="select * from person where phone=? and id!=?";
            PreparedStatement stm =con.prepareStatement(sql);
            stm.setString(1, phone);
            stm.setInt(2,id);
            ResultSet result = stm.executeQuery();
             
            if (result.next()) {
                d=1;
                return d;
            }
            
            stm.close();
            con.close();
        }catch(Exception ex){
        }
    
    return d;
    }
   
   
   ////la liste des person  membre
   public static List<Person> getAllPersons(){
        
        List<Person> list=new ArrayList<Person>();
        ConnectDataBase db=new ConnectDataBase();
        
        Connection con=null;
        try{
            con=db.getCon();
            PreparedStatement ps=con.prepareStatement("select * from person where type='membre'");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Person pd=new Person();
                pd=PersonDAO.get(rs.getInt("id"));
                list.add(pd);
                       
            
            }con.close(); 
        }catch(Exception e){
        
        }
        return list;
        
    }
   ////la liste des person  admins
   public static List<Person> getAllAdmins(){
        
        List<Person> list=new ArrayList<Person>();
        ConnectDataBase db=new ConnectDataBase();
        
        Connection con=null;
        try{
            con=db.getCon();
            PreparedStatement ps=con.prepareStatement("select * from person where type='admin'");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Person pd=new Person();
                pd=PersonDAO.get(rs.getInt("id"));
                list.add(pd);
                       
            
            }con.close(); 
        }catch(Exception e){
        
        }
        return list;
        
    }
   public static void main(String args[]) throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException{

    /*PersonDAO dao=new PersonDAO();
    Person p=new Person();
    p.setNom("joulmoud");p.setPrenom("black");p.setAddress("japan");p.setBirthday("1999-01-25");
    p.setEmail("joulmoud@gmail.com");p.setPassword("0611298559");
    p.setPassword_confirmation("0611298559");p.setPhone("0698745987");
    
    int x=updatePerson(p, 4);*/
    //int y=searchPhoneUpdated("0611298559",2);
    //String x = searchEmailUpdated("bouaddi1997@gmail.com",1);
    //Person p=PersonDAO.get(1);
      // System.out.println(p.getAddress());
       //System.out.println(y);
       List<Person> list=PersonDAO.getAllPersons();
       for(Person p : list){
           System.out.println("le image ce person est : "+p.getId());
       }
   
 
   
}
  
    
}
