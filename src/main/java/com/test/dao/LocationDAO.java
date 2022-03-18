
package com.test.dao;

import com.test.beans.Location;
import com.test.beans.Person;
import com.test.connectdatabase.ConnectDataBase;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import static java.lang.System.out;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) 
public class LocationDAO {
    ///insert new location into database
    
        ////insert person into data base
    public static int save(Location loc,Part [] filePart) throws IOException{
        ConnectDataBase db=new ConnectDataBase();
        int status;
        status = 0;
        Connection conn = null;
        InputStream  inputStream[] =new InputStream[5] ;
        inputStream[0]=null;
        inputStream[1]=null;
        inputStream[2]=null;
        inputStream[3]=null;
        inputStream[4]=null; 
                         
        try{
            inputStream [0] = filePart[0].getInputStream();
            inputStream [1] = filePart[1].getInputStream();
            inputStream [2] = filePart[2].getInputStream();
            inputStream [3] = filePart[3].getInputStream();
            inputStream [4] = filePart[4].getInputStream();
            
            conn=db.getCon();
            // constructs SQL statement
            String sql = "INSERT INTO location (titre,slogan,regle,description,ville,region,address,image1,image2,image3,image4,image5,prix,type,surface,nbrchambre,nbrsalon,nbrsalledebain,balcon,garage,parking,jardin,grenier) values "
                    + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setString(1, loc.getTitre());statement.setString(2, loc.getSlogan());
                statement.setString(3, loc.getRegle());statement.setString(4, loc.getDescription());
                statement.setString(5,loc.getVille());statement.setString(6,loc.getRegion());
                statement.setString(7,loc.getAddress());
                
            if (inputStream[0] != null || inputStream[1] != null || inputStream[2] != null || inputStream[3] != null || inputStream[4] != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(8, inputStream[0]);
                statement.setBlob(9, inputStream[1]);
                statement.setBlob(10, inputStream[2]);
                statement.setBlob(11, inputStream[3]);
                statement.setBlob(12, inputStream[4]);
               
            }
                
                
                statement.setDouble(13, loc.getPrix());statement.setString(14, loc.getType());
                statement.setDouble(15,loc.getSurface());statement.setInt(16,loc.getNbrchambre());
                statement.setInt(17,loc.getNbrsalon());
                statement.setInt(18,loc.getNbrsalledebain());statement.setString(19,loc.getBalcon());
                statement.setString(20,loc.getGarage());statement.setString(21,loc.getParking());
                statement.setString(22,loc.getJardin());statement.setString(23,loc.getGrenier());
                
                status=statement.executeUpdate();
                conn.close();
            }
        }catch(IllegalAccessException | InstantiationException | SQLException e){System.out.println(e);}
         
        return status;
    }
    ///select image from location
    public static Blob [] getImage(int id) throws InstantiationException, IllegalAccessException{
        ConnectDataBase bd=new ConnectDataBase();
        Connection conn=null;
        Blob[] b=new Blob[5];
        try {
            conn=bd.getCon();
            String sql="select image1,image2,image3,image4,image5 from location where id=?";
            PreparedStatement stmt=conn.prepareStatement(sql);
            stmt.setInt(1, id);
            
            ResultSet result = stmt.executeQuery();
            if(result.next()){
                b[0]=result.getBlob("image1");
                b[1]=result.getBlob("image2");
                b[2]=result.getBlob("image3");
                b[3]=result.getBlob("image4");
                b[4]=result.getBlob("image5");
            }
            
        } catch (SQLException e) {
        }
        
        return b;
    }
    //update ocation
    public static int update(Location loc,int id,Part [] filepart ) throws IOException, SQLException, InstantiationException, IllegalAccessException{
        ConnectDataBase db=new ConnectDataBase();
        int status;
        InputStream  inputStream [] = new InputStream[5];
        inputStream[0] = null;
        inputStream[1] = null;
        inputStream[2] = null;
        inputStream[3] = null;
        inputStream[4] = null;
        status = 0;
        Connection conn = null;
        Blob[] b=new Blob[5];
        b=getImage(id);
        try{
            
            conn=db.getCon();
            // constructs SQL statement
            String sql="";
            int x=1;
            
                
            if (x == 1 /*|| inputStream[1] == null || inputStream[2] == null || inputStream[3] == null || inputStream[4] == null*/) {
                sql = "update location set titre=?,slogan=?,regle=?,description=?,ville=?,region=?,address=?,image1=?,image2=?,image3=?,image4=?,image5=?"
                        + ",prix=?,type=?,surface=?,nbrchambre=?,nbrsalon=?,nbrsalledebain=?,balcon=?"
                        + ",garage=?,parking=?,jardin=?,grenier=? where id=? ";
              try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setString(1, loc.getTitre());
                statement.setString(2, loc.getSlogan());
                statement.setString(3, loc.getRegle());statement.setString(4, loc.getDescription());
                statement.setString(5,loc.getVille());statement.setString(6,loc.getRegion());
                statement.setString(7,loc.getAddress());
                if(filepart[0].getSize()==0){statement.setBlob(8, b[0]);}else{inputStream[0]=filepart[0].getInputStream();statement.setBlob(8, inputStream[0]);}
                if(filepart[1].getSize()==0){statement.setBlob(9, b[1]);}else{inputStream[1]=filepart[1].getInputStream();statement.setBlob(9, inputStream[1]);}
                if(filepart[2].getSize()==0){statement.setBlob(10, b[2]);}else{inputStream[2]=filepart[2].getInputStream();statement.setBlob(10, inputStream[2]);}
                if(filepart[3].getSize()==0){statement.setBlob(11, b[3]);}else{inputStream[3]=filepart[3].getInputStream();statement.setBlob(11, inputStream[3]);}
                if(filepart[4].getSize()==0){statement.setBlob(12, b[4]);}else{inputStream[4]=filepart[4].getInputStream();statement.setBlob(12, inputStream[4]);}
               
                statement.setDouble(13, loc.getPrix());statement.setString(14, loc.getType());
                statement.setDouble(15,loc.getSurface());statement.setInt(16,loc.getNbrchambre());
                statement.setInt(17,loc.getNbrsalon());
                statement.setInt(18,loc.getNbrsalledebain());statement.setString(19,loc.getBalcon());
                statement.setString(20,loc.getGarage());statement.setString(21,loc.getParking());
                statement.setString(22,loc.getJardin());statement.setString(23,loc.getGrenier());
                statement.setInt(24, id);
                status=statement.executeUpdate();
                conn.close();
                }
                
                
                
            
            }
        }catch(IllegalAccessException | InstantiationException | SQLException e){System.out.println(e);}
         
        return status;
    }
    
    
    ///method to delete a location from table
    
    public static int deleteLocation(Location loc){
        ConnectDataBase db=new ConnectDataBase();
        Connection conn=null;
        int s=0;
        try {
            conn=db.getCon();
            
            String sql="delete from location where id=?";
            
            PreparedStatement stmt=conn.prepareStatement(sql);
            stmt.setInt(1, loc.getId());
            
            s=stmt.executeUpdate();
            
        } catch (Exception e) {
        }return s;
    }
    ///method pour transformer un blob to a string
    
    public static String getBloob(Blob blob) throws SQLException, IOException{
        String url=null;
        InputStream inputStream=null;
        if(blob==null){
            url="/images/villa1.jpg";
            return url;
        }else{
            inputStream = blob.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);                  
            }

            byte[] imageBytes = outputStream.toByteArray();
            url = Base64.getEncoder().encodeToString(imageBytes);
                    
                    
            inputStream.close();
            outputStream.close();
            
            return url;
        }
    
    
    }
    
    ///get the specified locations
    public static Location getLocation(int id) throws SQLException, IOException{
        ConnectDataBase db=new ConnectDataBase();
        Connection conn=null;
        String sql = "SELECT * FROM location WHERE id = ?";
        Location loc =new Location();
        try {
            conn=db.getCon();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            if (result.next()){
                int ref=result.getInt("id");
                String titre=result.getString("titre");
                String slogan=result.getString("slogan");
                String regle=result.getString("regle");
                String description=result.getString("description");
                String ville=result.getString("ville");
                String region=result.getString("region");
                String address=result.getString("address");
                double prix=result.getDouble("prix");
                String type=result.getString("type");
                double surface=result.getDouble("surface");
                int nbrchambre=result.getInt("nbrchambre");
                int nbrsalon=result.getInt("nbrsalon");
                int nbrsalledebain=result.getInt("nbrsalledebain");
                String balcon=result.getString("balcon");
                String garage=result.getString("garage");
                String jardin=result.getString("jardin");
                String parking=result.getString("parking");
                String grenier=result.getString("grenier");
                Blob blob[];
                blob = new Blob[5];
                for(int i=0;i<5;i++){
                    blob[i]=result.getBlob("image"+(i+1));
                }
                //declare the url of the images
                String base64Image1=null;
                String base64Image2=null;
                String base64Image3=null;
                String base64Image4=null;
                String base64Image5=null;
                
                ///assign the url to the strings
                base64Image1=getBloob(blob[0]);
                base64Image2=getBloob(blob[1]);
                base64Image3=getBloob(blob[2]);
                base64Image4=getBloob(blob[3]);
                base64Image5=getBloob(blob[4]);
                
                
                ///intance our class to its values
                loc.setId(ref);
                loc.setTitre(titre);
                loc.setSlogan(slogan);
                loc.setRegle(regle);
                loc.setDescription(description);
                loc.setPrix(prix);
                loc.setType(type);
                loc.setSurface(surface);
                loc.setNbrchambre(nbrchambre);
                loc.setNbrsalon(nbrsalon);
                loc.setNbrsalledebain(nbrsalledebain);
                loc.setBalcon(balcon);
                loc.setGarage(garage);
                loc.setGrenier(grenier);
                loc.setJardin(jardin);
                loc.setParking(parking);
                loc.setAddress(address);
                loc.setVille(ville);
                loc.setRegion(region);
                loc.setBase64Image1(base64Image1);
                loc.setBase64Image2(base64Image2);
                loc.setBase64Image3(base64Image3);
                loc.setBase64Image4(base64Image4);
                loc.setBase64Image5(base64Image5);
            
            }
                       
        } catch (InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(LocationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    return loc;
    }
   
    public static List<Location> getAllLocations(){
        List<Location> list=new ArrayList<>();
        ConnectDataBase db=new ConnectDataBase();
        
        Connection con=null;
        try{
            con=db.getCon();
            PreparedStatement ps=con.prepareStatement("select * from location where etat='libre'");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Location lc=new Location();
                lc=LocationDAO.getLocation(rs.getInt("id"));
                list.add(lc);
                 
            }con.close(); 
        }catch(IOException | IllegalAccessException | InstantiationException | SQLException e){
        
        }
        return list;
    
    }
    public static List<Location> getAllReservations(){
        List<Location> list=new ArrayList<>();
        ConnectDataBase db=new ConnectDataBase();
        
        Connection con=null;
        try{
            con=db.getCon();
            PreparedStatement ps=con.prepareStatement("select * from location where etat!='libre'");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Location lc=new Location();
                lc=LocationDAO.getLocation(rs.getInt("id"));
                list.add(lc);
                 
            }con.close(); 
        }catch(IOException | IllegalAccessException | InstantiationException | SQLException e){
        
        }
        return list;
    
    }
    public static void main(String [] args) throws SQLException, IOException, InstantiationException, IllegalAccessException{
        //LocationDAO dao=new LocationDAO();
        //Location loc=dao.getLocation(2);
        
        //System.out.println("the titre of location is : "+loc.getTitre());
        /*List<Location> mylist =LocationDAO.getAllReservations();
        
        for(Location l : mylist){
            System.out.println("the titre of location is : "+l.getTitre()+" id is :"+l.getId());
        }*/
        /*int z=deleteLocation(5);
        System.err.println(z);
        */
    }
}
