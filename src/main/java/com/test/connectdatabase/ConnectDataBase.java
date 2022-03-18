
package com.test.connectdatabase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ismail bouaddi
 */
public class ConnectDataBase {
    Connection con;
    
    
    public Connection getCon() throws InstantiationException, IllegalAccessException{
        try {
           
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/javaee?serverTimezone=UTC","root","root");

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnectDataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
}
    
}
