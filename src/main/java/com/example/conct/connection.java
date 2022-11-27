package com.example.conct;

import java.sql.*;
import java.util.Random;


public class connection {
    private Connection conx;
    public connection(){

    }
    public Connection connectDB() {
        try {
            String Driver = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://127.0.0.1:3306/J2EE";
            String nameDB = "root";
            String pass = "50211159Ali";
            Class.forName(Driver);
            this.conx = DriverManager.getConnection(url, nameDB, pass);
            System.out.println("database connected");
        } catch (Exception e) {
            System.out.println(e);
        }
        return conx;
    }


    public String  getMot(){
        Random x=new Random();
        String mot="";
        int val=x.nextInt(24);
        if(val==0){
            val+=1;
        }
        try{
            Connection con=connectDB();
            Statement stmS = con.createStatement();
            String SQL = "SELECT * FROM `tabMot` WHERE  id="+val;
            ResultSet res=stmS.executeQuery(SQL);
            while(res.next())
                mot=res.getString("mot");

        } catch (SQLException ex) {
            System.err.println("Connexion impossible");
        }
        return mot;
    }

}