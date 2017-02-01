/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnectionFactory;
import entity.Client;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.InputStream;

/**
 *
 * @author JohnMichael
 */
public class ClientDAO {
    
    public boolean inputClient(Client client, InputStream inputStream) {
        try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "insert into `client` (clientName, contactPerson, contactNumber, email, address, city, numberOfGuards, type, sla, dateJoined) values (?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setString(1, client.getClientName());
            pstmt.setString(2, client.getContactPerson());
            pstmt.setString(3, client.getContactNumber());
            pstmt.setString(4, client.getEmail());
            pstmt.setString(5, client.getAddress());
            pstmt.setString(6, client.getCity());
            pstmt.setInt(7, client.getNumberOfGuards());
            pstmt.setString(8, client.getType());
            pstmt.setBlob(9, inputStream);
            pstmt.setDate(10, client.getDateJoined());

            int rows = pstmt.executeUpdate();
            conn.close();
            return rows == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
      public ArrayList<Client> getAllClients() {
        try {
            ArrayList<Client> clientList = new ArrayList();
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from client";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Client client = new Client();

                int clientID = rs.getInt("clientID");
                String clientName = rs.getString("clientName");
                String contactPerson = rs.getString("contactPerson");
                String contactNumber = rs.getString("contactNumber");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String city = rs.getString("city");
                int numberOfGuards = rs.getInt("numberOfGuards");
                String type = rs.getString("type");

                client.setClientID(clientID);
                client.setClientName(clientName);
                client.setContactPerson(contactPerson);
                client.setContactNumber(contactNumber);
                client.setEmail(email);
                client.setAddress(address);
                client.setCity(city);
                client.setNumberOfGuards(numberOfGuards);
                client.setType(type);

                clientList.add(client);
            }
            conn.close();
            return clientList;
        } catch (SQLException ex) {
            Logger.getLogger(ClientDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
      
      public Client searchClient(int clientID) {
        try {
            
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String query = "select * from client where clientID = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, clientID);
            ResultSet rs = pstmt.executeQuery();
            
            Client client = new Client();
            
            while (rs.next()) {
                
                
                String clientName = rs.getString("clientName");
                String contactPerson = rs.getString("contactPerson");
                String contactNumber = rs.getString("contactNumber");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int numberOfGuards = rs.getInt("numberOfGuards");
                String type = rs.getString("type");

                
                client.setClientName(clientName);
                client.setContactPerson(contactPerson);
                client.setContactNumber(contactNumber);
                client.setEmail(email);
                client.setAddress(address);
                client.setNumberOfGuards(numberOfGuards);
                client.setType(type);

                
            }
            conn.close();
            return client;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
