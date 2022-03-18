
package com.test.dao;

import com.test.beans.Location;
import com.test.beans.Person;
import com.test.connectdatabase.ConnectDataBase;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReservationDAO {
    public static int Reserver(Location loc,Person person,String date) throws InstantiationException, IllegalAccessException{
        ConnectDataBase db=new ConnectDataBase();
        Connection conn=null;
        PreparedStatement stmt=null;
        int status=0;
        try {
            conn=db.getCon();
            String sql="insert into reservation(idperson,idlocation,datedepart,datefin) values(?,?,CURDATE(),?);";
                   /* + "update location set etat=? where id=?";*/
            stmt=conn.prepareStatement(sql);
            stmt.setInt(1,person.getId());
            stmt.setInt(2, loc.getId());
            stmt.setString(3,date);
           /* stmt.setString(4,"reserver");
            stmt.setInt(5,loc.getId());*/
            status=stmt.executeUpdate();
            
        } catch (SQLException e) {
        }
        return status;
    }
    public static void etatReservedLocation(Location loc) throws SQLException{
        ConnectDataBase db=new ConnectDataBase();
        Connection conn=null;
        PreparedStatement stmt=null;
        try {
            conn=db.getCon();
            String sql="update location set etat=? where id=?";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,"reserve");
            stmt.setInt(2,loc.getId());
            
            stmt.executeUpdate();
        } catch (IllegalAccessException | InstantiationException e) {
        }
    }
    public static void etatLibreLocation(Location loc) throws SQLException{
        ConnectDataBase db=new ConnectDataBase();
        Connection conn=null;
        PreparedStatement stmt=null;
        try {
            conn=db.getCon();
            String sql="update location set etat=? where id=?";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,"libre");
            stmt.setInt(2,loc.getId());
            
            stmt.executeUpdate();
        } catch (IllegalAccessException | InstantiationException e) {
        }
    }
    public static int DeleteReservation(Location loc) throws SQLException{
        ConnectDataBase db=new ConnectDataBase();
        Connection conn=null;
        PreparedStatement stmt=null;
        int status=0;
        try {
            conn=db.getCon();
            String sql="delete from reservation where idlocation=?";
            stmt=conn.prepareStatement(sql);
            stmt.setInt(1,loc.getId());
            
            status=stmt.executeUpdate();
        } catch (IllegalAccessException | InstantiationException e) {
        }
        return status;
    }
    
    
    public static void main(String [] args) throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException{
        Location loc =LocationDAO.getLocation(6);
        
        
       int x=DeleteReservation( loc);
        System.out.println(x);
    }
}
