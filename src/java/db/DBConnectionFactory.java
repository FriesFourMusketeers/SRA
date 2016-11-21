/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;

/**
 *
 * @author Garfield
 */
public abstract class DBConnectionFactory {
        String url = "jdbc:mysql://127.0.0.1:3306/safeguard";
        String username = "root";
        String password = "fourmusketeers";

    public static DBConnectionFactory getInstance(){
        return new DBConnectionFactoryImpl();
    }
    
    public abstract Connection getConnection();
}